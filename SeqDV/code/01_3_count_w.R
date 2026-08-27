#!/usr/bin/env Rscript
source("utils.R")
parse_args <- function() {
  args <- commandArgs(trailingOnly=TRUE); ratio <- c(4,2,2); datanames <- c(); i <- 1
  while (i <= length(args)) {
    if (args[i] == "--ratio" || args[i] == "-r") {
      ratio_vals <- as.numeric(strsplit(args[i+1], ",")[[1]])
      if (length(ratio_vals) != 3 || any(is.na(ratio_vals))) stop("ratio format should be train,valid,test")
      ratio <- ratio_vals; i <- i + 2
    } else { datanames <- c(datanames,args[i]); i <- i + 1 }
  }
  if (length(datanames)==0) datanames <- c("changping1","seoulbike4")
  list(ratio=ratio,datanames=datanames)
}
params <- parse_args(); RATIO <- params$ratio; DATANAMES <- params$datanames
m <- list("LOO","random","random_sample","seq"); pct <- 0.01
for (method in m) for (dataname in DATANAMES) {
  for (w in c(1,3,5,7)) remove_high_count_w(dataname,remove_pct=pct,method=method,w=w,ratio=RATIO)
  for (w in c(1,3,5,7)) remove_low_count_w(dataname,remove_pct=pct,method=method,w=w,ratio=RATIO)
}
