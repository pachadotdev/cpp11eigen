#include "eigen/Dense"
#include <cpp11.hpp>
#include <cpp11eigen.hpp>

using namespace Eigen;
using namespace cpp11;

[[cpp11::register]] doubles_matrix<> ols_mat(const doubles_matrix<>& y,
                                             const doubles_matrix<>& x) {
  MatrixXd Y = as_Mat(y);
  MatrixXd X = as_Mat(x);

  MatrixXd XtX = X.t() * X;
  MatrixXd XtX_inv = inv(XtX);
  MatrixXd beta = XtX_inv * X.t() * Y;

  return as_doubles_matrix(beta);
}

[[cpp11::register]] doubles ols_double(const doubles_matrix<>& y,
                                       const doubles_matrix<>& x) {
  MatrixXd Y = as_Mat(y);
  MatrixXd X = as_Mat(x);

  MatrixXd XtX = X.t() * X;
  MatrixXd XtX_inv = inv(XtX);
  MatrixXd beta = XtX_inv * X.t() * Y;

  return as_doubles(beta);
}
