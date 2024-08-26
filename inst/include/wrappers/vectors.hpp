#pragma once

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
inline U Matrix_to_dblint_(const Eigen::Matrix<T, Eigen::Dynamic, Eigen::Dynamic>& x) {
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

inline integers as_integers(const Eigen::Matrix<int, Eigen::Dynamic, Eigen::Dynamic>& x) {
  return Matrix_to_dblint_<int, integers>(x);
}

inline doubles as_doubles(
    const Eigen::Matrix<double, Eigen::Dynamic, Eigen::Dynamic>& x) {
  return Matrix_to_dblint_<double, doubles>(x);
}

#endif
