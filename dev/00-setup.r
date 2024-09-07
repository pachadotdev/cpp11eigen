if (!require("devtools")) install.packages("devtools")
if (!require("bench")) install.packages("bench")
if (!require("ggplot2")) install.packages("ggplot2")

if (!require("armadillobenchmark")) devtools::install("dev/armadillobenchmark")
if (!require("basebenchmark")) devtools::install("dev/basebenchmark")
if (!require("eigenbenchmark")) devtools::install("dev/eigenbenchmark")
if (!require("psarrasadaptation")) devtools::install("dev/psarrasadaptation")

library(basebenchmark)
library(armadillobenchmark)
library(eigenbenchmark)
library(psarrasadaptation)
library(bench)
library(ggplot2)

att_benchmark <- function(FUN1, FUN2, FUN3, n, name) {
  message(n)

  fout <- paste0("benchmarks/benchmarks-", name, "-", n, ".rds")

  dir <- dirname(fout)
  try(dir.create(dir, recursive = TRUE))

  if (!file.exists(fout)) {
    out <- mark(
      FUN1(n),
      FUN2(n),
      FUN3(n),
      min_iterations = 10L,
      max_iterations = 10L
    )
    print(out)
    saveRDS(out, fout)
  }
}
