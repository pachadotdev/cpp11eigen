#include "00_main.h"

// vec = colvec = MatrixXd

[[cpp11::register]] doubles typedef_Col_double(const doubles& x) {
  MatrixXd y = as_Matrix(x);
  return as_doubles(y);
}

[[cpp11::register]] integers typedef_Col_int(const integers& x) {
  MatrixXi y = as_Matrix(x);
  return as_integers(y);
}

[[cpp11::register]] doubles_matrix<> typedef_Mat_double(const doubles_matrix<>& x) {
  MatrixXd y = as_Matrix(x);
  return as_doubles_matrix(y);
}

[[cpp11::register]] integers_matrix<> typedef_Mat_int(const integers_matrix<>& x) {
  MatrixXi y = as_Matrix(x);
  return as_integers_matrix(y);
}
