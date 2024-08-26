// clang-format off

#include <eigen/Dense>
#include <cpp11.hpp>
#include <cpp11eigen.hpp>

using namespace Eigen;
using namespace cpp11;

MatrixXd ols_(const doubles_matrix<>& y, const doubles_matrix<>& x) {
  MatrixXd Y = as_Matrix(y);  // Col<double> Y = as_Col(y); also works
  MatrixXd X = as_Matrix(x);

  MatrixXd XtX = X.transpose() * X;             // X'X
  MatrixXd XtX_inv = XtX.inverse();             // (X'X)^(-1)
  MatrixXd beta = XtX_inv * X.transpose() * Y;  // (X'X)^(-1)(X'Y)

  return beta;
}

[[cpp11::register]] doubles_matrix<> ols_mat(const doubles_matrix<>& y,
                                             const doubles_matrix<>& x) {
  MatrixXd beta = ols_(y, x);
  return as_doubles_matrix(beta);
}

[[cpp11::register]] doubles ols_dbl(const doubles_matrix<>& y,
                                    const doubles_matrix<>& x) {
  MatrixXd beta = ols_(y, x);

  return as_doubles(beta);
}
