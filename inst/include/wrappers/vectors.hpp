#pragma once

using namespace Eigen;
using namespace cpp11;

#ifndef VECTORS_HPP
#define VECTORS_HPP

// Note: dblint = doubles or integers

////////////////////////////////////////////////////////////////
// Eigen to R
////////////////////////////////////////////////////////////////

// Double/Integer to vector

// we can use std::copy from R to Armadillo, not the other way around

template <typename T, typename U>
inline U Matrix_to_dblint_(const Matrix<T, Dynamic, Dynamic>& x) {
  const int n = x.rows();
  const int m = x.cols();

  if (m != 1) {
    throw std::runtime_error("Only column vectors can be converted to doubles/integers");
  }

  using dblint = typename std::conditional<std::is_same<U, doubles>::value,
                                           writable::doubles, writable::integers>::type;

  dblint y(n);

#ifdef _OPENMP
#pragma omp parallel for schedule(static)
#endif
  for (int i = 0; i < n; ++i) {
    y[i] = x(i, 0);
  }

  return y;
}

inline integers as_integers(const Matrix<int, Dynamic, Dynamic>& x) {
  return Matrix_to_dblint_<int, integers>(x);
}

inline doubles as_doubles(const Matrix<double, Dynamic, Dynamic>& x) {
  return Matrix_to_dblint_<double, doubles>(x);
}

#endif
