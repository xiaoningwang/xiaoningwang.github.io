#!/usr/bin/env Rscript

source("utils.R")

# ==================== 命令行参数解析 ====================
parse_args <- function() {
  args <- commandArgs(trailingOnly = TRUE)
  ratio <- c(4, 2, 2)
  datanames <- c()
  i <- 1
  while (i <= length(args)) {
    if (args[i] == "--ratio" || args[i] == "-r") {
      if (i + 1 <= length(args)) {
        ratio_str <- args[i + 1]
        ratio_vals <- as.numeric(strsplit(ratio_str, ",")[[1]])
        if (length(ratio_vals) == 3 && !any(is.na(ratio_vals))) {
          ratio <- ratio_vals
        } else {
          stop("ratio 格式错误，应为 train,valid,test 格式，如: 4,2,2")
        }
        i <- i + 2
      } else {
        stop("--ratio 选项需要指定参数")
      }
    } else {
      datanames <- c(datanames, args[i])
      i <- i + 1
    }
  }
  if (length(datanames) == 0) datanames <- c("changping1", "seoulbike4")
  return(list(ratio = ratio, datanames = datanames))
}

params <- parse_args()
RATIO <- params$ratio
DATANAMES <- params$datanames

cat("========================================\n")
cat("remove_w.R 运行配置\n")
cat("数据集:", paste(DATANAMES, collapse=", "), "\n")
cat("数据划分比例 (train:valid:test):", paste(RATIO, collapse=":"), "\n")
cat("========================================\n")

m <- list("LOO", "random", "random_sample", "seq")
pct <- 0.01
born_in <- 10

for (method in m) {
  for (dataname in DATANAMES) {
    cat(glue("\nProcessing {dataname}, method={method}\n"))
    remove_high_exp_w(dataname, remove_pct = pct, method = method, w = 1, ratio = RATIO)
    cat("remove_high done w = 1\n")
    remove_high_exp_w(dataname, remove_pct = pct, method = method, w = 3, ratio = RATIO)
    cat("remove_high done w = 3\n")
    remove_high_exp_w(dataname, remove_pct = pct, method = method, w = 5, ratio = RATIO)
    cat("remove_high done w = 5\n")
    remove_high_exp_w(dataname, remove_pct = pct, method = method, w = 7, ratio = RATIO)
    cat("remove_high done w = 7\n")
    remove_low_exp_w(dataname, remove_pct = pct, method = method, w = 1, ratio = RATIO)
    remove_low_exp_w(dataname, remove_pct = pct, method = method, w = 3, ratio = RATIO)
    remove_low_exp_w(dataname, remove_pct = pct, method = method, w = 5, ratio = RATIO)
    remove_low_exp_w(dataname, remove_pct = pct, method = method, w = 7, ratio = RATIO)
    cat("remove_low done\n")
  }
}
