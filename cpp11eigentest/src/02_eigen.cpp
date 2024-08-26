#include "00_main.h"

// Symmetric case

MatrixXd eigen_sym_(const doubles_matrix<>& x) {
  MatrixXd X = as_Matrix(x);
  SelfAdjointEigenSolver<MatrixXd> res;
  return res.compute(X).eigenvalues();
}

[[cpp11::register]] doubles_matrix<> eigen_sym_mat(const doubles_matrix<>& x) {
  MatrixXd y = eigen_sym_(x);
  return as_doubles_matrix(y);
}

[[cpp11::register]] doubles eigen_sym_dbl(const doubles_matrix<>& x) {
  MatrixXd y = eigen_sym_(x);
  return as_doubles(y);
}
