#include <cpp11.hpp>
#include <cpp11eigen.hpp>

using namespace cpp11;

[[cpp11::register]] doubles_matrix<> ols_mat(const doubles_matrix<>& y,
                                             const doubles_matrix<>& x) {
  Eigen::MatrixXd Y = as_Mat(y);
  Eigen::MatrixXd X = as_Mat(x);

  Eigen::MatrixXd XtX = X.t() * X;
  Eigen::MatrixXd XtX_inv = inv(XtX);
  Eigen::MatrixXd beta = XtX_inv * X.t() * Y;

  return as_doubles_matrix(beta);
}

[[cpp11::register]] doubles ols_double(const doubles_matrix<>& y,
                                       const doubles_matrix<>& x) {
  Eigen::MatrixXd Y = as_Mat(y);
  Eigen::MatrixXd X = as_Mat(x);

  Eigen::MatrixXd XtX = X.t() * X;
  Eigen::MatrixXd XtX_inv = inv(XtX);
  Eigen::MatrixXd beta = XtX_inv * X.t() * Y;

  return as_doubles(beta);
}
