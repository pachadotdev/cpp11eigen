#include "00_main.h"

Eigen::MatrixXd ols_(const doubles_matrix<>& y, const doubles_matrix<>& x) {
  Eigen::MatrixXd Y = as_Matrix(y);  // Col<double> Y = as_Col(y); also works
  Eigen::MatrixXd X = as_Matrix(x);

  Eigen::MatrixXd XtX = X.transpose() * X;             // X'X
  Eigen::MatrixXd XtX_inv = XtX.inverse();             // (X'X)^(-1)
  Eigen::MatrixXd beta = XtX_inv * X.transpose() * Y;  // (X'X)^(-1)(X'Y)

  return beta;
}

[[cpp11::register]] doubles_matrix<> ols_mat(const doubles_matrix<>& y,
                                             const doubles_matrix<>& x) {
  Eigen::MatrixXd beta = ols_(y, x);
  return as_doubles_matrix(beta);
}

[[cpp11::register]] doubles ols_vec(const doubles_matrix<>& y,
                                    const doubles_matrix<>& x) {
  Eigen::MatrixXd beta = ols_(y, x);

  return as_doubles(beta);
}
