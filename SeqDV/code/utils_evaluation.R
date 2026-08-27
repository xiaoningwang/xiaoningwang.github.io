# Additional baseline and grouped-removal utilities extracted from the supplied archive.

f_LOO_nonseq <- function(dataname, SEED, ratio = c(4, 2, 2)) {
  set.seed(SEED)
  mydata <- load_real_data(dataname, y_loc = 1, SEED = SEED, ratio = ratio)
  n <- mydata$n_sample
  v_cache <- rep(0, n)
  Xborn <- mydata$Xborn; yborn <- mydata$yborn
  Xvalid <- mydata$Xvalid; yvalid <- mydata$yvalid
  X <- mydata$Xtrain; y <- mydata$ytrain
  N_tree <- round(0.05 * n)
  dt_0 <- dynaTree(Xborn, yborn, N = N_tree, model = "class")
  for (i in 1:n) {
    dt <- update(dt_0, matrix(X[-i, ], ncol = dt_0$m), y[-i])
    v_cache[i] <- acc_01(max.col(predict(dt, Xvalid)$p), yvalid)
  }
  dt_final <- update(dt_0, matrix(X, ncol = dt_0$m), y)
  v <- acc_01(max.col(predict(dt_final, Xvalid)$p), yvalid)
  write.table(data.frame(LOO = rep(v, n) - v_cache),
              glue("{OUTPUT_DIR}/{dataname}_LOO_nonseq_{SEED}.txt"),
              sep = ",", col.names = TRUE, quote = TRUE)
}

win_idx <- function(center, total, w) {
  if (w <= 1) return(center)
  half <- (w - 1) %/% 2
  idx <- (center - half):(center + half)
  idx[idx < 1] <- 1 - (idx[idx < 1] - 1)
  idx[idx > total] <- 2 * total - idx[idx > total]
  unique(idx)
}

.read_value <- function(dataname, method, SEED) {
  if (method == "seq") return(read.csv(glue("{OUTPUT_DIR}/{dataname}_seq_{SEED}.txt"))$nn_sv)
  if (method == "nonseq") return(read.csv(glue("{OUTPUT_DIR}/{dataname}_nonseq_{SEED}.txt"))$nn_sv)
  if (method == "random") return(read.csv(glue("{OUTPUT_DIR}/{dataname}_random_{SEED}.txt"))$random)
  if (method == "random_sample") return(read.csv(glue("{OUTPUT_DIR}/{dataname}_random_sample_{SEED}.txt"))$random)
  if (method == "LOO") return(read.csv(glue("{OUTPUT_DIR}/{dataname}_LOO_{SEED}.txt"))$LOO)
  if (method == "LOO_nonseq") return(read.csv(glue("{OUTPUT_DIR}/{dataname}_LOO_nonseq_{SEED}.txt"))$LOO)
  stop("method not recognized")
}

.removal_one <- function(dataname, SEED = 1, tp = "class", born_in = 10,
                         remove_pct = 0.05, method = "seq", w = 1,
                         high = TRUE, ratio = c(4, 2, 2)) {
  set.seed(SEED)
  value <- .read_value(dataname, method, SEED)
  dat <- load_real_data(dataname, ratio = ratio)
  first_X <- dat$Xborn; first_y <- dat$yborn
  Xtrain <- dat$Xtrain; ytrain <- dat$ytrain
  Xtest <- dat$Xtest; ytest <- dat$ytest
  n <- dat$n_sample
  N <- round(0.1 * n)
  step <- max(1, round(remove_pct * n))
  if (high) value[is.na(value)] <- -Inf
  ranking <- order(value, decreasing = high)
  labs <- sort(unique(c(ytest, ytrain))); levs <- labs
  score <- function(X, y) {
    dt <- dynaTree(X, y, N = N, model = tp)
    pred <- max.col(predict(dt, Xtest)$p)
    df <- data.frame(truth=factor(ytest, levels=levs, labels=labs),
                     estimate=factor(pred, levels=levs, labels=labs))
    c(acc_01=mean(ytest == pred),
      precision=mean(yardstick::precision(df, truth, estimate, estimator="micro")$.estimate),
      recall=mean(yardstick::recall(df, truth, estimate, estimator="micro")$.estimate),
      f1=mean(yardstick::f_meas(df, truth, estimate, estimator="micro")$.estimate))
  }
  cache <- matrix(score(rbind(first_X, Xtrain), c(first_y, ytrain)), nrow=1)
  for (loop in 1:50) {
    del_end <- step * loop
    if (del_end > n) break
    del_rank <- ranking[1:del_end]
    if (w > 1) del_rank <- unique(unlist(lapply(del_rank, win_idx, total=n, w=w)))
    keep <- setdiff(1:n, del_rank)
    cache <- rbind(cache, score(rbind(first_X, Xtrain[keep, ]), c(first_y, ytrain[keep])))
  }
  data.frame(acc_01=cache[,1], acc_precision=cache[,2], acc_recall=cache[,3], acc_f1=cache[,4])
}

.aggregate_removal <- function(dataname, remove_pct, method, born_in, w, high, ratio) {
  cl <- makeCluster(max(1, detectCores() - 1)); registerDoParallel(cl)
  clusterEvalQ(cl, {library(dynaTree); library(glue); library(yardstick)})
  df_cache <- foreach(b=1:50,
                      .export=c(".removal_one", ".read_value", "load_real_data", "robust_scale", "win_idx", "OUTPUT_DIR"),
                      .packages=c("dynaTree","yardstick","glue")) %dopar% {
    .removal_one(dataname, SEED=b, born_in=born_in, remove_pct=remove_pct,
                 method=method, w=w, high=high, ratio=ratio)
  }
  stopCluster(cl)
  collect <- function(col) do.call(cbind, lapply(df_cache, function(x) x[[col]]))
  a <- collect("acc_01"); p <- collect("acc_precision"); r <- collect("acc_recall"); f <- collect("acc_f1")
  data.frame(mean_01=apply(a,1,mean), std_01=apply(a,1,sd),
             mean_recall=apply(r,1,mean), std_recall=apply(r,1,sd),
             mean_precision=apply(p,1,mean), std_precision=apply(p,1,sd),
             mean_f1=apply(f,1,mean), std_f1=apply(f,1,sd))
}

remove_high_exp_w <- function(dataname, remove_pct=0.05, method="seq", born_in=10, w=1, ratio=c(4,2,2)) {
  df <- .aggregate_removal(dataname,remove_pct,method,born_in,w,TRUE,ratio)
  write.csv(df, glue("./metric_w/{dataname}_{method}_{remove_pct}_remove_high_w{w}.csv"), row.names=FALSE)
  invisible(df)
}
remove_low_exp_w <- function(dataname, remove_pct=0.05, method="seq", born_in=10, w=1, ratio=c(4,2,2)) {
  df <- .aggregate_removal(dataname,remove_pct,method,born_in,w,FALSE,ratio)
  write.csv(df, glue("./metric_w/{dataname}_{method}_{remove_pct}_remove_low_w{w}.csv"), row.names=FALSE)
  invisible(df)
}

.count_one <- function(dataname, SEED, remove_pct, method, w, high, ratio) {
  set.seed(SEED)
  value <- .read_value(dataname, method, SEED)
  n <- load_real_data(dataname, ratio=ratio)$n_sample
  step <- max(1, round(remove_pct*n)); ranking <- order(value, decreasing=high)
  counts <- numeric(50)
  for (loop in 1:50) {
    del_end <- step*loop; if (del_end > n) break
    ids <- ranking[1:del_end]
    if (w > 1) ids <- unique(unlist(lapply(ids, win_idx, total=n, w=w)))
    counts[loop] <- length(ids)
  }
  counts[1:loop]
}
.aggregate_counts <- function(dataname, remove_pct, method, w, high, ratio) {
  counts_list <- lapply(1:50, function(seed) .count_one(dataname,seed,remove_pct,method,w,high,ratio))
  max_loops <- max(lengths(counts_list)); mat <- matrix(NA,max_loops,50)
  for (i in 1:50) mat[seq_along(counts_list[[i]]),i] <- counts_list[[i]]
  data.frame(loop=1:max_loops, mean_deleted_count=apply(mat,1,mean,na.rm=TRUE))
}
remove_high_count_w <- function(dataname, remove_pct=0.05, method="seq", born_in=10, w=1, ratio=c(4,2,2)) {
  df <- .aggregate_counts(dataname,remove_pct,method,w,TRUE,ratio)
  write.csv(df, glue("./remove_count/{dataname}_{method}_{remove_pct}_remove_high_w{w}_counts.csv"), row.names=FALSE)
}
remove_low_count_w <- function(dataname, remove_pct=0.05, method="seq", born_in=10, w=1, ratio=c(4,2,2)) {
  df <- .aggregate_counts(dataname,remove_pct,method,w,FALSE,ratio)
  write.csv(df, glue("./remove_count/{dataname}_{method}_{remove_pct}_remove_low_w{w}_counts.csv"), row.names=FALSE)
}
