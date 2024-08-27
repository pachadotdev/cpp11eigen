#include "00_main.h"

[[cpp11::register]] doubles_matrix<> capm(const doubles_matrix<>& r,
                                          const doubles_matrix<>& m, double f) {
  MatrixXd R = as_Matrix(r);
  MatrixXd M = as_Matrix(m);

  MatrixXd F = MatrixXd::Ones(R.cols(), 1) * f;

  // Market average return
  MatrixXd M_avg = MatrixXd::Ones(R.cols(), 1) * M.mean();

  MatrixXd cov = (R.array() - R.mean()).matrix().transpose() *
                 (M.array() - M.mean()).matrix() / (R.rows() - 1);

  double var =
      ((M.array() - M.mean()).matrix().transpose() * (M.array() - M.mean()).matrix())
          .sum() /
      (M.rows() - 1);

  // CAPM betas
  MatrixXd beta = cov / var;

  // MatrixXd out = MatrixXd::Zero(R.cols(), 1);
  // for (int i = 0; i < R.cols(); i++) {
  //   out(i, 0) += F(i, 0) + beta(i, 0) * (M_avg(i, 0) - F(i, 0));
  // }

  // Expected returns
  MatrixXd out = F.array() + beta.array() * (M_avg.array() - F.array());

  return as_doubles_matrix(out);
}
