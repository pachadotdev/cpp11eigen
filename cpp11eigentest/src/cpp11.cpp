// Generated by cpp11: do not edit by hand
// clang-format off


#include "cpp11/declarations.hpp"
#include <R_ext/Visibility.h>

// 01_ols.cpp
doubles_matrix<> ols_mat(const doubles_matrix<>& y, const doubles_matrix<>& x);
extern "C" SEXP _cpp11eigentest_ols_mat(SEXP y, SEXP x) {
  BEGIN_CPP11
    return cpp11::as_sexp(ols_mat(cpp11::as_cpp<cpp11::decay_t<const doubles_matrix<>&>>(y), cpp11::as_cpp<cpp11::decay_t<const doubles_matrix<>&>>(x)));
  END_CPP11
}
// 01_ols.cpp
doubles ols_vec(const doubles_matrix<>& y, const doubles_matrix<>& x);
extern "C" SEXP _cpp11eigentest_ols_vec(SEXP y, SEXP x) {
  BEGIN_CPP11
    return cpp11::as_sexp(ols_vec(cpp11::as_cpp<cpp11::decay_t<const doubles_matrix<>&>>(y), cpp11::as_cpp<cpp11::decay_t<const doubles_matrix<>&>>(x)));
  END_CPP11
}
// 02_eigen.cpp
doubles_matrix<> eigen_sym_mat_no_wrapper(const doubles_matrix<>& x);
extern "C" SEXP _cpp11eigentest_eigen_sym_mat_no_wrapper(SEXP x) {
  BEGIN_CPP11
    return cpp11::as_sexp(eigen_sym_mat_no_wrapper(cpp11::as_cpp<cpp11::decay_t<const doubles_matrix<>&>>(x)));
  END_CPP11
}
// 02_eigen.cpp
doubles eigen_sym_dbl_no_wrapper(const doubles_matrix<>& x);
extern "C" SEXP _cpp11eigentest_eigen_sym_dbl_no_wrapper(SEXP x) {
  BEGIN_CPP11
    return cpp11::as_sexp(eigen_sym_dbl_no_wrapper(cpp11::as_cpp<cpp11::decay_t<const doubles_matrix<>&>>(x)));
  END_CPP11
}
// 02_eigen.cpp
list eigen_gen_mat_complex_wrapper(const doubles_matrix<>& x);
extern "C" SEXP _cpp11eigentest_eigen_gen_mat_complex_wrapper(SEXP x) {
  BEGIN_CPP11
    return cpp11::as_sexp(eigen_gen_mat_complex_wrapper(cpp11::as_cpp<cpp11::decay_t<const doubles_matrix<>&>>(x)));
  END_CPP11
}
// 02_eigen.cpp
list eigen_gen_dbl_complex_wrapper(const doubles_matrix<>& x);
extern "C" SEXP _cpp11eigentest_eigen_gen_dbl_complex_wrapper(SEXP x) {
  BEGIN_CPP11
    return cpp11::as_sexp(eigen_gen_dbl_complex_wrapper(cpp11::as_cpp<cpp11::decay_t<const doubles_matrix<>&>>(x)));
  END_CPP11
}
// 02_eigen.cpp
list eigen_gen_mat_no_wrapper(const doubles_matrix<>& x);
extern "C" SEXP _cpp11eigentest_eigen_gen_mat_no_wrapper(SEXP x) {
  BEGIN_CPP11
    return cpp11::as_sexp(eigen_gen_mat_no_wrapper(cpp11::as_cpp<cpp11::decay_t<const doubles_matrix<>&>>(x)));
  END_CPP11
}
// 02_eigen.cpp
list eigen_gen_dbl_no_wrapper(const doubles_matrix<>& x);
extern "C" SEXP _cpp11eigentest_eigen_gen_dbl_no_wrapper(SEXP x) {
  BEGIN_CPP11
    return cpp11::as_sexp(eigen_gen_dbl_no_wrapper(cpp11::as_cpp<cpp11::decay_t<const doubles_matrix<>&>>(x)));
  END_CPP11
}
// 03_chol.cpp
doubles_matrix<> chol_mat(const doubles_matrix<>& x);
extern "C" SEXP _cpp11eigentest_chol_mat(SEXP x) {
  BEGIN_CPP11
    return cpp11::as_sexp(chol_mat(cpp11::as_cpp<cpp11::decay_t<const doubles_matrix<>&>>(x)));
  END_CPP11
}
// 04_qr.cpp
doubles_matrix<> ols_qr_mat(const doubles_matrix<>& y, const doubles_matrix<>& x);
extern "C" SEXP _cpp11eigentest_ols_qr_mat(SEXP y, SEXP x) {
  BEGIN_CPP11
    return cpp11::as_sexp(ols_qr_mat(cpp11::as_cpp<cpp11::decay_t<const doubles_matrix<>&>>(y), cpp11::as_cpp<cpp11::decay_t<const doubles_matrix<>&>>(x)));
  END_CPP11
}
// 04_qr.cpp
doubles ols_qr_dbl(const doubles_matrix<>& y, const doubles_matrix<>& x);
extern "C" SEXP _cpp11eigentest_ols_qr_dbl(SEXP y, SEXP x) {
  BEGIN_CPP11
    return cpp11::as_sexp(ols_qr_dbl(cpp11::as_cpp<cpp11::decay_t<const doubles_matrix<>&>>(y), cpp11::as_cpp<cpp11::decay_t<const doubles_matrix<>&>>(x)));
  END_CPP11
}
// 05_capm.cpp
doubles_matrix<> capm(const doubles_matrix<>& r, const doubles_matrix<>& m, double f);
extern "C" SEXP _cpp11eigentest_capm(SEXP r, SEXP m, SEXP f) {
  BEGIN_CPP11
    return cpp11::as_sexp(capm(cpp11::as_cpp<cpp11::decay_t<const doubles_matrix<>&>>(r), cpp11::as_cpp<cpp11::decay_t<const doubles_matrix<>&>>(m), cpp11::as_cpp<cpp11::decay_t<double>>(f)));
  END_CPP11
}
// 06_typedefs.cpp
doubles typedef_Col_double(const doubles& x);
extern "C" SEXP _cpp11eigentest_typedef_Col_double(SEXP x) {
  BEGIN_CPP11
    return cpp11::as_sexp(typedef_Col_double(cpp11::as_cpp<cpp11::decay_t<const doubles&>>(x)));
  END_CPP11
}
// 06_typedefs.cpp
integers typedef_Col_int(const integers& x);
extern "C" SEXP _cpp11eigentest_typedef_Col_int(SEXP x) {
  BEGIN_CPP11
    return cpp11::as_sexp(typedef_Col_int(cpp11::as_cpp<cpp11::decay_t<const integers&>>(x)));
  END_CPP11
}
// 06_typedefs.cpp
doubles_matrix<> typedef_Mat_double(const doubles_matrix<>& x);
extern "C" SEXP _cpp11eigentest_typedef_Mat_double(SEXP x) {
  BEGIN_CPP11
    return cpp11::as_sexp(typedef_Mat_double(cpp11::as_cpp<cpp11::decay_t<const doubles_matrix<>&>>(x)));
  END_CPP11
}
// 06_typedefs.cpp
integers_matrix<> typedef_Mat_int(const integers_matrix<>& x);
extern "C" SEXP _cpp11eigentest_typedef_Mat_int(SEXP x) {
  BEGIN_CPP11
    return cpp11::as_sexp(typedef_Mat_int(cpp11::as_cpp<cpp11::decay_t<const integers_matrix<>&>>(x)));
  END_CPP11
}

extern "C" {
static const R_CallMethodDef CallEntries[] = {
    {"_cpp11eigentest_capm",                          (DL_FUNC) &_cpp11eigentest_capm,                          3},
    {"_cpp11eigentest_chol_mat",                      (DL_FUNC) &_cpp11eigentest_chol_mat,                      1},
    {"_cpp11eigentest_eigen_gen_dbl_complex_wrapper", (DL_FUNC) &_cpp11eigentest_eigen_gen_dbl_complex_wrapper, 1},
    {"_cpp11eigentest_eigen_gen_dbl_no_wrapper",      (DL_FUNC) &_cpp11eigentest_eigen_gen_dbl_no_wrapper,      1},
    {"_cpp11eigentest_eigen_gen_mat_complex_wrapper", (DL_FUNC) &_cpp11eigentest_eigen_gen_mat_complex_wrapper, 1},
    {"_cpp11eigentest_eigen_gen_mat_no_wrapper",      (DL_FUNC) &_cpp11eigentest_eigen_gen_mat_no_wrapper,      1},
    {"_cpp11eigentest_eigen_sym_dbl_no_wrapper",      (DL_FUNC) &_cpp11eigentest_eigen_sym_dbl_no_wrapper,      1},
    {"_cpp11eigentest_eigen_sym_mat_no_wrapper",      (DL_FUNC) &_cpp11eigentest_eigen_sym_mat_no_wrapper,      1},
    {"_cpp11eigentest_ols_mat",                       (DL_FUNC) &_cpp11eigentest_ols_mat,                       2},
    {"_cpp11eigentest_ols_qr_dbl",                    (DL_FUNC) &_cpp11eigentest_ols_qr_dbl,                    2},
    {"_cpp11eigentest_ols_qr_mat",                    (DL_FUNC) &_cpp11eigentest_ols_qr_mat,                    2},
    {"_cpp11eigentest_ols_vec",                       (DL_FUNC) &_cpp11eigentest_ols_vec,                       2},
    {"_cpp11eigentest_typedef_Col_double",            (DL_FUNC) &_cpp11eigentest_typedef_Col_double,            1},
    {"_cpp11eigentest_typedef_Col_int",               (DL_FUNC) &_cpp11eigentest_typedef_Col_int,               1},
    {"_cpp11eigentest_typedef_Mat_double",            (DL_FUNC) &_cpp11eigentest_typedef_Mat_double,            1},
    {"_cpp11eigentest_typedef_Mat_int",               (DL_FUNC) &_cpp11eigentest_typedef_Mat_int,               1},
    {NULL, NULL, 0}
};
}

extern "C" attribute_visible void R_init_cpp11eigentest(DllInfo* dll){
  R_registerRoutines(dll, NULL, CallEntries, NULL, NULL);
  R_useDynamicSymbols(dll, FALSE);
  R_forceSymbols(dll, TRUE);
}
