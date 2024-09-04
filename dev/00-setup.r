library(basebenchmark)
library(armadillobenchmark)
library(eigenbenchmark)
library(bench)

run_benchmark <- function(FUN1, FUN2, FUN3, n, name) {
  message(n)

  fout <- paste0("benchmarks/benchmarks-", name, "-", n, ".rds")

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
