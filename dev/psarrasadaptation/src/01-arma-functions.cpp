#include <cpp11.hpp>
#include <cpp11armadillo.hpp>

using namespace arma;
using namespace cpp11;

[[cpp11::register]] doubles_matrix<> solve_nai_arma_(
  const doubles_matrix<>& a, const doubles_matrix<>& b) {
  mat A = as_Mat(a);
  mat B = as_Mat(b);
  mat res = inv(A) * B;
  return as_doubles_matrix(res);
}

[[cpp11::register]] doubles_matrix<> solve_rec_arma_(
  const doubles_matrix<>& a, const doubles_matrix<>& b) {
  mat A = as_Mat(a);
  mat B = as_Mat(b);
  mat res = solve(A, B);
  return as_doubles_matrix(res);
}
