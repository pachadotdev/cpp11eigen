#pragma once

using namespace Eigen;
using namespace cpp11;

#ifndef MATRICES_HPP
#define MATRICES_HPP

////////////////////////////////////////////////////////////////
// R to Armadillo
////////////////////////////////////////////////////////////////

template <typename T>
inline Matrix<T, Dynamic, Dynamic> as_Matrix(const T& x) {
  // Generic implementation
  throw std::runtime_error("Cannot convert to Mat");
}

template <typename T, typename U>
inline Matrix<T, Dynamic, Dynamic> dblint_matrix_to_Matrix_(const U& x) {
  const int n = x.nrow();
  const int m = x.ncol();

  if (std::is_same<U, doubles_matrix<>>::value) {
    Map<Matrix<T, Dynamic, Dynamic>> y(reinterpret_cast<T*>(REAL(x.data())), n, m);
    return y;
  } else {
    Map<Matrix<T, Dynamic, Dynamic>> y(reinterpret_cast<T*>(INTEGER(x.data())), n, m);
    return y;
  }
}

template <typename T, typename U>
inline Matrix<T, Dynamic, Dynamic> dblint_to_Matrix_(const U& x) {
  const int n = x.size();

  if (std::is_same<U, doubles>::value) {
    Map<Matrix<T, Dynamic, Dynamic>> y(reinterpret_cast<T*>(REAL(x.data())), n, 1);
    return y;
  } else {
    Map<Matrix<T, Dynamic, Dynamic>> y(reinterpret_cast<T*>(INTEGER(x.data())), n, 1);
    return y;
  }
}

inline Matrix<double, Dynamic, Dynamic> as_Matrix(const doubles_matrix<>& x) {
  return dblint_matrix_to_Matrix_<double, doubles_matrix<>>(x);
}

inline Matrix<int, Dynamic, Dynamic> as_Matrix(const integers_matrix<>& x) {
  return dblint_matrix_to_Matrix_<int, integers_matrix<>>(x);
}

inline Matrix<double, Dynamic, Dynamic> as_Matrix(const doubles& x) {
  return dblint_to_Matrix_<double, doubles>(x);
}

inline Matrix<int, Dynamic, Dynamic> as_Matrix(const integers& x) {
  return dblint_to_Matrix_<int, integers>(x);
}

////////////////////////////////////////////////////////////////
// Armadillo to R
////////////////////////////////////////////////////////////////

// Double/Integer

template <typename T, typename U>
inline U Matrix_to_dblint_matrix_(const Matrix<T, Dynamic, Dynamic>& A) {
  const int n = A.rows();
  const int m = A.cols();

  using dblint_matrix =
      typename std::conditional<std::is_same<U, doubles_matrix<>>::value,
                                writable::doubles_matrix<>,
                                writable::integers_matrix<>>::type;

  dblint_matrix B(n, m);

#ifdef _OPENMP
#pragma omp parallel for collapse(2) schedule(static)
#endif
  for (int i = 0; i < n; ++i) {
    for (int j = 0; j < m; ++j) {
      B(i, j) = A(i, j);
    }
  }

  return B;
}

inline doubles_matrix<> as_doubles_matrix(const Matrix<double, Dynamic, Dynamic>& A) {
  return Matrix_to_dblint_matrix_<double, doubles_matrix<>>(A);
}

inline integers_matrix<> as_integers_matrix(const Matrix<int, Dynamic, Dynamic>& A) {
  return Matrix_to_dblint_matrix_<int, integers_matrix<>>(A);
}

#endif
