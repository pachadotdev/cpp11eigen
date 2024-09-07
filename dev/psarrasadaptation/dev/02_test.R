# Estimate the model y ~ constant + x
# with y and x gaussian random variables

# A <- matrix(c(1, 0, 0, 1, 1, 0, 0, 1, 1), nrow = 3, ncol = 3, byrow = TRUE)
# b <- c(6.50, 7.50, 8.50)

# the system always has a solution because b is in the column space of A
set.seed(123)
A <- matrix(rnorm(10000), ncol = 100, nrow = 100)
x <- matrix(rnorm(100), ncol = 1, nrow = 100)
b <- A %*% x

devtools::load_all()

bench::mark(
  solve_nai(A, b),
  solve_rec(A, b),
  solve_nai_arma(A, b),
  solve_rec_arma(A, b),
  solve_nai_eigen(A, b),
  solve_rec_eigen(A, b)
)
