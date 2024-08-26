#include "00_main.h"

[[cpp11::register]] doubles_matrix<> chol_mat(const doubles_matrix<>& x) {
  MatrixXd X = as_Matrix(x);

  MatrixXd L(X.llt().matrixL());

  return as_doubles_matrix(L);
}
