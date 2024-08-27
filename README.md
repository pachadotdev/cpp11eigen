
<!-- README.md is generated from README.Rmd. Please edit that file -->

# cpp11eigen <img src="man/figures/logo.svg" align="right" height="139" alt="" />

<!-- badges: start -->

[![R-CMD-check](https://github.com/pachadotdev/cpp11eigen/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/pachadotdev/cpp11eigen/actions/workflows/R-CMD-check.yaml)
[![codecov](https://codecov.io/gh/pachadotdev/cpp11eigen/graph/badge.svg?token=mWfiUCgfNu)](https://app.codecov.io/gh/pachadotdev/cpp11eigen)
[![BuyMeACoffee](https://raw.githubusercontent.com/pachadotdev/buymeacoffee-badges/main/bmc-donate-white.svg)](https://buymeacoffee.com/pacha)
[![CRAN
status](https://www.r-pkg.org/badges/version/cpp11eigen)](https://CRAN.R-project.org/package=cpp11eigen)
<!-- badges: end -->

The goal of cpp11eigen is to provide a novel approach to use the [Eigen
C++ library](https://eigen.tuxfamily.org/index.php?title=Main_Page) by
using the header-only cpp11 R package and to simplify things for the
end-user.

The idea is to pass matrices/vectors from R to C++, write pure C++/Eigen
code for the computation, and then export the result back to R with the
proper data structures.

This follows from the same goals as cpp11:

  - Enforcing copy-on-write semantics.
  - Improving the safety of using the R API from C++ code.
  - Using UTF-8 strings everywhere.
  - Applying newer C++11 features.
  - Having a more straightforward, simpler implementation.
  - Faster compilation time with lower memory requirements.
  - Growing vectors more efficiently.

If this software is useful to you, please consider donating on [Buy Me A
Coffee](https://buymeacoffee.com/pacha). All donations will be used to
continue improving `cpp11eigen`.

## Installation

You can install the development version of cpp11eigen from GitHub:

``` r
remotes::install_github("pachadotdev/cpp11eigen")
```

## Examples

I have provided a package template for RStudio that also works with VS
Code.

The idea of this package is to be naive and simple (like me).

From RStudio/VSCode create a new project and run:

``` r
cpp11eigen::pkg_template()
```

Then follow the instructions from the README.

The vignettes contains detailed examples that I use to test
`cpp11eigen`, these include Ordinary Least Squares.

# Linear Algebra Libraries

Eigen supports OpenBLAS, Intel MKL, and the Accelerate framework (Mac).
You can install OpenBLAS on Debian-based systems with:

``` sh
sudo apt-get install libopenblas-dev
```

You can also use other commands for your specific operating system.

To verify that R is using OpenBLAS, you can run `sessionInfo()` after
restarting R to check the BLAS/LAPACK libraries in use:

``` r
Matrix products: default
BLAS:   /usr/lib/x86_64-linux-gnu/openblas-pthread/libblas.so.3 
LAPACK: /usr/lib/x86_64-linux-gnu/openblas-pthread/libopenblasp-r0.3.20.so; LAPACK version 3.10.0
```
