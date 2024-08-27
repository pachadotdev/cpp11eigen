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

// General case

MatrixXcd eigen_gen_(const doubles_matrix<>& x) {
  MatrixXd X = as_Matrix(x);
  EigenSolver<MatrixXd> res;
  return res.compute(X).eigenvalues();
}

[[cpp11::register]] list eigen_gen_mat(const doubles_matrix<>& x) {
  MatrixXcd y = eigen_gen_(x);

  MatrixXd y_real = y.real();
  MatrixXd y_imag = y.imag();

  writable::list out;
  out.push_back({"real"_nm = as_doubles_matrix(y_real)});
  out.push_back({"imag"_nm = as_doubles_matrix(y_imag)});

  return out;
}

[[cpp11::register]] list eigen_gen_dbl(const doubles_matrix<>& x) {
  MatrixXcd y = eigen_gen_(x);

  MatrixXd y_real = y.real();
  MatrixXd y_imag = y.imag();

  writable::list out;
  out.push_back({"real"_nm = as_doubles(y_real)});
  out.push_back({"imag"_nm = as_doubles(y_imag)});

  return out;
}
