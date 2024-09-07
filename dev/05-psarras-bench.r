source("dev/00-setup.r")

# A <- matrix(c(1, 0, 0, 1, 1, 0, 0, 1, 1), nrow = 3, ncol = 3, byrow = TRUE)
# B <- c(6.50, 7.50, 8.50)

# the system always has a solution because B is in the column space of A
n <- 6 * 1000 * 5
m <- 2 * 100 * 5

set.seed(123)
A <- matrix(rnorm(n^2), nrow = n, ncol = n)
X <- matrix(rnorm(n * m), nrow = n, ncol = m)
B <- A %*% X

fout <- "benchmarks/niagara/benchmarks-psarras-large.rds"

out <- mark(
  solve_nai(A, B),
  solve_rec(A, B),
  solve_nai_arma(A, B),
  solve_rec_arma(A, B),
  solve_nai_eigen(A, B),
  solve_rec_eigen(A, B)
)

out <- data.frame(
  expression = as.character(out$expression),
  median = as.numeric(bench::as_bench_time(out$median))
)

dir <- dirname(fout)
try(dir.create(dir, recursive = TRUE))

if (!file.exists(fout)) { saveRDS(out, fout) }
