#include "00_main.h"

// The same example from the first script but using QR instead of directly
// obtaining the inverse

MatrixXd ols_qr_(const doubles_matrix<>& y, const doubles_matrix<>& x) {
  MatrixXd Y = as_Matrix(y);
  MatrixXd X = as_Matrix(x);

  // Perform QR decomposition on X
  HouseholderQR<MatrixXd> qr(X);
  MatrixXd Q = qr.householderQ();
  MatrixXd R = qr.matrixQR().template triangularView<Upper>();

  // Check the rank of X
  FullPivLU<MatrixXd> lu_decomp(X);
  int Rank = lu_decomp.rank();

  if (Rank != X.cols()) {
    throw std::runtime_error("QR decomposition failed");
  }

  // Solve for beta
  MatrixXd Q_transpose_Y = Q.transpose() * Y;
  MatrixXd beta = R.topLeftCorner(Rank, Rank)
                      .colPivHouseholderQr()
                      .solve(Q_transpose_Y.topRows(Rank));

  return beta;
}

[[cpp11::register]] doubles_matrix<> ols_qr_mat(const doubles_matrix<>& y,
                                                const doubles_matrix<>& x) {
  MatrixXd beta = ols_qr_(y, x);
  return as_doubles_matrix(beta);
}

[[cpp11::register]] doubles ols_qr_dbl(const doubles_matrix<>& y,
                                       const doubles_matrix<>& x) {
  MatrixXd beta = ols_qr_(y, x);
  return as_doubles(beta);
}
