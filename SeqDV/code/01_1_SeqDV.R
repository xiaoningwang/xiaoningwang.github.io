#!/usr/bin/env Rscript

library("dynaTree")
source("utils.R")
library("glue")
library("foreach")
library("doParallel")

# ==================== 命令行参数解析 ====================
# 用法: Rscript SeqDV.R --ratio 4,2,2 changping1 seoulbike4

parse_args <- function() {
  args <- commandArgs(trailingOnly = TRUE)
  
  ratio <- c(4, 2, 2)  # 默认值
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
  
  # 如果没有指定数据集，使用默认值
  if (length(datanames) == 0) {
    datanames <- c("seoulbike4", "changping1")
  }
  
  return(list(ratio = ratio, datanames = datanames))
}

# 解析参数
params <- parse_args()
RATIO <- params$ratio
DATANAMES <- params$datanames

cat("========================================\n")
cat("SeqDV.R 运行配置\n")
cat("数据集:", paste(DATANAMES, collapse=", "), "\n")
cat("数据划分比例 (train:valid:test):", paste(RATIO, collapse=":"), "\n")
cat("========================================\n")

noise <- FALSE

for (dataname in DATANAMES) {
  for (i in 1:50) {
    set.seed(i)
    cat(glue("Processing {dataname}, SEED={i}\n"))
    
    data <- real_stability(dataname, y_loc = 1, batch = 200, thresh = 0.2,
                           SEED = i, noise = noise, SEQ = "seq", ratio = RATIO)
    stability_nn(dataname, data, SEED = i, mbatch = 64, epochs = 100,
                 LOG = TRUE, SEQ = "seq")
    f_random(dataname, i, 'random', ratio = RATIO)
    f_random(dataname, i, 'random_sample', ratio = RATIO)
    f_LOO_nonseq(dataname, i, ratio = RATIO)
    f_LOO(dataname, i, ratio = RATIO)
    print(glue("loop {i} done"))
  }
}
