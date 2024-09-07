// this pragma keeps the output minimal and eases finding the relevant warnings
// or errors
#pragma GCC diagnostic ignored "-Wignored-attributes"

#include <cpp11.hpp>
#include <cpp11eigen.hpp>

using namespace Eigen;
using namespace cpp11;

[[cpp11::register]] doubles_matrix<> solve_nai_eigen_(
  const doubles_matrix<>& a, const doubles_matrix<>& b) {
  MatrixXd A = as_Matrix(a);
  MatrixXd B = as_Matrix(b);
  MatrixXd res = A.inverse() * B;
  return as_doubles_matrix(res);
}

[[cpp11::register]] doubles_matrix<> solve_rec_eigen(
  const doubles_matrix<>& a, const doubles_matrix<>& b) {
  MatrixXd A = as_Matrix(a);
  MatrixXd B = as_Matrix(b);
  MatrixXd res = A.partialPivLu().solve(B);
  return as_doubles_matrix(res);
}
