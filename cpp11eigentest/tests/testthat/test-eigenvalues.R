test_that("cpp11armadillo vs base R (sorted)", {
  x <- mtcars_mat$x
  y <- mtcars_mat$y

  x <- x[, c("wt", "cyl4", "cyl6", "cyl8")]

  x <- cor(x)

  # Armadillo computation
  a <- sort(eigen_sym_mat(x))
  
  b <- eigen_gen_mat(x)
  b_real <- sort(b$real)
  b_imag <- sort(b$imag)

  c <- eigen_gen_dbl(x)
  c_real <- sort(c$real)
  c_imag <- sort(c$imag)

  # Base R computation
  d <- sort(eigen(x)$values)

  expect_equal(a, d)
  expect_equal(b_real, d)
  expect_equal(b_imag, rep(0, length(b_imag)))
  expect_equal(c_real, d)
  expect_equal(c_imag, rep(0, length(c_imag)))
})
