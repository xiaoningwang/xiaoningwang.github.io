library("dynaTree")
library("glue")
library("keras")
library("tensorflow")
library("foreach")
library("doParallel")
library("yardstick")
# Optional GPU selection. Leave unset for CPU/default-device execution.
.seqdv_cuda <- Sys.getenv("SEQDV_CUDA_VISIBLE_DEVICES", unset = "")
if (nzchar(.seqdv_cuda)) Sys.setenv(CUDA_VISIBLE_DEVICES = .seqdv_cuda)

OUTPUT_DIR <- Sys.getenv("SEQDV_OUTPUT_DIR", unset = "./born10_422")

acc_01 <- function(ypred, ytest) {
  return(mean(ypred == ytest))
}

robust_scale <- function(Xtrain, Xvalid, Xtest, eps = 1e-10) {
  train_mean <- apply(Xtrain, 2, mean)
  train_sd <- apply(Xtrain, 2, sd)
  near_zero_sd <- which(train_sd < eps | is.na(train_sd))
  if (length(near_zero_sd) > 0) {
    warning(paste("发现", length(near_zero_sd), "个特征列方差接近0，将使用单位缩放"))
    if (!is.null(colnames(Xtrain))) cat("零方差特征列:", colnames(Xtrain)[near_zero_sd], "\n")
    train_sd[near_zero_sd] <- 1
  }
  standardize <- function(X, mean_vec, sd_vec) {
    X_centered <- sweep(X, 2, mean_vec, "-")
    X_scaled <- sweep(X_centered, 2, sd_vec, "/")
    X_scaled[is.na(X_scaled)] <- 0
    X_scaled[is.infinite(X_scaled)] <- 0
    return(X_scaled)
  }
  Xtrain_scaled <- standardize(Xtrain, train_mean, train_sd)
  Xvalid_scaled <- standardize(Xvalid, train_mean, train_sd)
  Xtest_scaled <- standardize(Xtest, train_mean, train_sd)
  return(list(Xtrain=Xtrain_scaled, Xvalid=Xvalid_scaled, Xtest=Xtest_scaled,
              mean=train_mean, sd=train_sd, zero_var_cols=near_zero_sd))
}

load_real_data <- function(data_name, y_loc = 1, header = T, sep = ",",
                           SEED = 1, SCALE = TRUE, noise = F, born_in = 10,
                           ratio = c(4, 2, 2)) {
  train <- ratio[1]; valid <- ratio[2]; test <- ratio[3]
  pd <- read.csv(glue("./real_data/{data_name}.csv"), header = header, sep = sep)
  set.seed(SEED)
  X <- pd[, -y_loc]; y <- pd[, y_loc]
  kmin <- min(pd[, y_loc]); kmax <- max(pd[, y_loc])
  if (kmin != 1) y <- y - kmin + 1
  X <- as.matrix(X); y <- as.integer(y); n <- length(y)
  total <- train + valid + test
  n_train <- round((n - born_in) * train / total)
  n_valid <- round((n - born_in) * valid / total)
  Xvalid <- X[1:n_valid, ]; yvalid <- y[1:n_valid]
  Xtrain <- X[(n_valid + 1):(n_valid + born_in + n_train), ]
  ytrain <- y[(n_valid + 1):(n_valid + born_in + n_train)]
  Xtest <- X[(n_valid + born_in + n_train + 1):n, ]
  ytest <- y[(n_valid + born_in + n_train + 1):n]
  if (SCALE) {
    scale_result <- robust_scale(Xtrain, Xvalid, Xtest)
    Xtrain <- scale_result$Xtrain; Xvalid <- scale_result$Xvalid; Xtest <- scale_result$Xtest
  }
  return(list(Xborn=Xtrain[1:born_in, ], yborn=ytrain[1:born_in],
              Xtrain=Xtrain[(born_in + 1):(born_in + n_train), ],
              ytrain=ytrain[(born_in + 1):(born_in + n_train)], Xtest=Xtest, ytest=ytest,
              Xvalid=Xvalid, yvalid=yvalid, num_class=kmax-kmin+1,
              num_feat=ncol(Xtrain), n_sample=n_train))
}

nn_struct <- function(in_dim, out_dim, node = c(2, 100), DROPOUT = 0) {
  n_layers <- node[1]; width <- node[2]
  if (n_layers == -1) {
    mbl <- keras_model_sequential() %>%
      layer_dense(units = width, activation = "relu", input_shape = in_dim) %>%
      layer_dropout(DROPOUT) %>% layer_dense(units = out_dim)
  } else if (n_layers == 1) {
    mbl <- keras_model_sequential() %>%
      layer_dense(units = width, activation = "relu", input_shape = in_dim) %>%
      layer_dropout(DROPOUT) %>% layer_dense(units = width, activation = "relu") %>%
      layer_dropout(DROPOUT) %>% layer_dense(units = out_dim)
  } else if (n_layers == 2) {
    mbl <- keras_model_sequential() %>%
      layer_dense(units = width, activation = "relu", input_shape = in_dim) %>%
      layer_dropout(DROPOUT) %>% layer_dense(units = width, activation = "relu") %>%
      layer_dropout(DROPOUT) %>% layer_dense(units = width, activation = "relu") %>%
      layer_dropout(DROPOUT) %>% layer_dense(units = out_dim)
  }
  return(mbl)
}

train_mlp <- function(model, train_x, train_y, epoch, mbatch, val_rate = 0.2) {
  model %>% compile(loss='mean_squared_error', optimizer='adam', metrics=c('accuracy'))
  callbacks <- list(callback_early_stopping(monitor="val_loss", min_delta=1e-2,
                                             patience=10, verbose=0))
  model %>% fit(train_x, train_y, epochs=epoch, batch_size=mbatch,
                validation_split=val_rate, callbacks=callbacks)
  return(model)
}

train_nn_SV <- function(mydata, filename, out_file, nodes, epochs, mbatch,
                        sep = ",", header = T) {
  df <- read.csv(filename, sep=sep, header=header)
  X <- mydata$Xtrain; y <- mydata$ytrain
  target_set <- df$is_target
  delta <- df$SV[target_set == 1]
  input_feat <- cbind(X[target_set == 1, ], y[target_set == 1])
  input_sv <- delta
  m <- colMeans(input_feat); s <- apply(input_feat, 2, sd); eps <- 1e-10
  near_zero_sd <- which(s < eps | is.na(s) | s == 0)
  if (length(near_zero_sd) > 0) s[near_zero_sd] <- 1
  train_feat <- sweep(input_feat, 2, m, "-")
  train_feat <- sweep(train_feat, 2, s, "/")
  train_feat[is.na(train_feat)] <- 0; train_feat[is.infinite(train_feat)] <- 0
  model <- nn_struct(ncol(train_feat), 1, node=nodes)
  s_time <- Sys.time(); model <- train_mlp(model, train_feat, input_sv, epochs, mbatch); e_time <- Sys.time()
  test_input <- cbind(X[target_set == 0, ], y[target_set == 0])
  pred <- predict(model, test_input)
  final_sv <- rep(0, length(y)); final_sv[target_set == 1] <- delta; final_sv[target_set == 0] <- pred[,1]
  df$nn_sv <- final_sv
  write.table(df, file=out_file, sep=sep, col.names=TRUE, quote=TRUE)
  print("Done: training model and predict Sv for all points!")
  return(e_time-s_time)
}

Welford_phi <- function(phi, phi_var, new_phi, phi_hist, total, batch, thresh = 0.05) {
  total <- total + batch
  diff_1 <- t(apply(new_phi, 1, function(x) x - phi))
  phi <- phi + apply(diff_1, 2, sum) / total
  diff_2 <- t(apply(new_phi, 1, function(x) x - phi))
  phi_var <- phi_var + apply(diff_1 * diff_2, 2, sum)
  var <- phi_var / total^2; var[var < 0] <- 0
  phi_std <- sqrt(var); phi_hist <- rbind(phi_hist, phi)
  hist_std <- apply(phi_hist, 2, function(x) sqrt(var(x)))
  ratio1 <- max(phi_std) / (max(phi) - min(phi))
  converged <- ratio1 < thresh
  return(list(phi=phi, phi_var=phi_var, phi_hist=phi_hist, converged=converged, total=total))
}

grow_target_dynatree <- function(mydata, u_fun, target_set, N_trees = 1, tp = "class") {
  n <- mydata$n_sample; Xborn <- mydata$Xborn; yborn <- mydata$yborn
  Xvalid <- mydata$Xvalid; yvalid <- mydata$yvalid; X <- mydata$Xtrain; y <- mydata$ytrain
  new_phi <- rep(0,n); permu <- sample(n); target_pos <- sort(match(target_set,permu))
  dt <- dynaTree(Xborn,yborn,N=N_trees,model=tp); re <- predict(dt,Xvalid)
  v <- u_fun(max.col(re$p),yvalid); v_cache <- rep(v,n+1); v_cache[1] <- v; idx <- 1
  for (i in 1:length(target_pos)) {
    if ((target_pos[i]-1) <= 0) next
    dt1 <- update(dt, matrix(X[permu[idx:(target_pos[i]-1)], ], ncol=dt$m), y[permu[idx:(target_pos[i]-1)]])
    dt <- update(dt1, matrix(X[permu[target_pos[i]], ], ncol=dt1$m), y[permu[target_pos[i]]])
    v_cache[target_pos[i]] <- u_fun(max.col(predict(dt1,Xvalid)$p), yvalid)
    v_cache[target_pos[i]+1] <- u_fun(max.col(predict(dt,Xvalid)$p), yvalid)
    idx <- target_pos[i]+1
  }
  new_phi[permu] <- v_cache[2:(n+1)] - v_cache[1:n]
  return(new_phi)
}

grow_bornin_dynatree <- function(mydata, u_fun, target_set, N_trees = 1, tp = "class") {
  n <- mydata$n_sample; Xborn <- mydata$Xborn; yborn <- mydata$yborn
  Xvalid <- mydata$Xvalid; yvalid <- mydata$yvalid; X <- mydata$Xtrain; y <- mydata$ytrain
  permu <- sample(c(0,1), size=n, replace=TRUE); tmp <- permu; permu[target_set] <- 1
  sampled_id <- (1:n)[permu == 1]; permu <- sampled_id
  target_pos <- sort(match(target_set,permu)); new_phi <- rep(0,n)
  dt <- dynaTree(Xborn,yborn,N=N_trees,model=tp); v <- u_fun(max.col(predict(dt,Xvalid)$p),yvalid)
  v_cache <- rep(v,n+1); v_cache[1] <- v; idx <- 1
  for (i in 1:length(target_pos)) {
    if ((target_pos[i]-1) <= 0) next
    dt1 <- update(dt, matrix(X[permu[idx:(target_pos[i]-1)], ], ncol=dt$m), y[permu[idx:(target_pos[i]-1)]])
    dt <- update(dt1, matrix(X[permu[target_pos[i]], ], ncol=dt1$m), y[permu[target_pos[i]]])
    v_cache[permu[target_pos[i]]] <- u_fun(max.col(predict(dt1,Xvalid)$p),yvalid)
    v_cache[permu[target_pos[i]]+1] <- u_fun(max.col(predict(dt,Xvalid)$p),yvalid)
    idx <- target_pos[i]+1
    if (tmp[permu[target_pos[i]]] == 0) dt <- dt1
  }
  new_phi <- v_cache[2:(n+1)] - v_cache[1:n]
  return(new_phi)
}

real_stability <- function(dataname="seq_AQI_2", u_fun=acc_01, tp="class", y_loc=1,
                           batch=500, thresh=0.2, SEED=1, LOG=TRUE, SEQ="seq",
                           noise=FALSE, ratio=c(4,2,2)) {
  mydata <- load_real_data(dataname,y_loc,SEED=SEED,noise=noise,ratio=ratio)
  n <- mydata$n_sample
  N <- round(0.1*n)  # preserved from supplied code; see CODE_AUDIT.md
  set.seed(SEED)
  phi_mean <- rep(0,n); phi_var <- rep(0,n); phi_hist <- rep(0,n)
  target_percent <- 0.8; target_set <- sample(n,round(target_percent*n))
  is_target <- rep(0,n); is_target[target_set] <- 1
  s_time <- Sys.time(); phi <- c()
  for (b in 1:batch) {
    if (SEQ == "seq") new_phi <- grow_bornin_dynatree(mydata,u_fun,target_set,N_trees=N,tp=tp)
    else new_phi <- grow_target_dynatree(mydata,u_fun,target_set,N_trees=N,tp=tp)
    phi <- rbind(phi,new_phi)
  }
  e_time <- Sys.time(); timing <- e_time-s_time
  cal_re <- Welford_phi(phi_mean,phi_var,phi,phi_hist,batch,batch,thresh=thresh)
  while (cal_re$converged == FALSE) {
    cl <- makeCluster(detectCores()-1); registerDoParallel(cl); clusterEvalQ(cl,library(dynaTree))
    s_time <- Sys.time()
    phi <- foreach(b=1:batch,.combine=rbind,.export=c("grow_bornin_dynatree","grow_target_dynatree")) %dopar% {
      if (SEQ == "seq") grow_bornin_dynatree(mydata,u_fun,target_set,N_trees=N,tp=tp)
      else grow_target_dynatree(mydata,u_fun,target_set,N_trees=N,tp=tp)
    }
    e_time <- Sys.time(); stopCluster(cl)
    cal_re <- Welford_phi(cal_re$phi,cal_re$phi_var,phi,cal_re$phi_hist,cal_re$total,batch,thresh=thresh)
    timing <- timing + e_time-s_time
  }
  out_file <- glue("{OUTPUT_DIR}/{dataname}_{SEQ}_{SEED}.txt")
  write.table(data.frame(is_target=is_target,SV=cal_re$phi),out_file,sep=",",col.names=TRUE,quote=TRUE)
  if (LOG) {
    sink(glue("{OUTPUT_DIR}/{dataname}_{SEQ}_log.txt"),append=TRUE,split=FALSE)
    print(glue("noisy SV: target set percent is {target_percent}; noise = {noise}")); print(timing); sink()
  }
  return(mydata)
}

stability_nn <- function(dataname,mydata,SEED=1,mbatch=64,epochs=100,SEQ="seq",LOG=TRUE) {
  nodes <- c(2,128); out_file <- glue("{OUTPUT_DIR}/{dataname}_{SEQ}_{SEED}.txt")
  t <- train_nn_SV(mydata,out_file,out_file,nodes,epochs,mbatch,sep=",")
  if (LOG) { sink(glue("{OUTPUT_DIR}/{dataname}_{SEQ}_log.txt"),append=TRUE,split=FALSE); print(t); sink() }
}

f_random <- function(dataname,SEED,random_sample='random',ratio=c(4,2,2)) {
  mydata <- load_real_data(dataname,y_loc=1,SEED=SEED,ratio=ratio); n <- mydata$n_sample; set.seed(SEED)
  if (random_sample == "random_norm") random <- rnorm(n)
  else if (random_sample == "random_sample") random <- sample(n)
  else if (random_sample == "random") random <- runif(n,-1,1)
  else stop("random_sample not recognized")
  write.table(data.frame(random=random),glue("{OUTPUT_DIR}/{dataname}_{random_sample}_{SEED}.txt"),sep=",",col.names=TRUE,quote=TRUE)
}

f_LOO <- function(dataname,SEED,ratio=c(4,2,2)) {
  set.seed(SEED); mydata <- load_real_data(dataname,y_loc=1,SEED=SEED,ratio=ratio); n <- mydata$n_sample
  v <- rep(0,n+1); Xborn <- mydata$Xborn; yborn <- mydata$yborn; Xvalid <- mydata$Xvalid; yvalid <- mydata$yvalid
  X <- mydata$Xtrain; y <- mydata$ytrain; N_tree <- round(0.05*n)
  dt <- dynaTree(Xborn,yborn,N=N_tree,model="class"); v[1] <- acc_01(max.col(predict(dt,Xvalid)$p),yvalid)
  for (i in 1:n) { dt <- update(dt,matrix(X[i,],ncol=dt$m),y[i]); v[i+1] <- acc_01(max.col(predict(dt,Xvalid)$p),yvalid) }
  write.table(data.frame(LOO=v[2:(n+1)]-v[1:n]),glue("{OUTPUT_DIR}/{dataname}_LOO_{SEED}.txt"),sep=",",col.names=TRUE,quote=TRUE)
}
