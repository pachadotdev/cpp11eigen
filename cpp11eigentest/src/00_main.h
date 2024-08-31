// this pragma keeps the output minimal and eases finding the relevant warnings
// or errors
#pragma GCC diagnostic ignored "-Wignored-attributes"

#include <Eigen/Dense>
#include <Eigen/Eigenvalues>
#include <Eigen/Cholesky>

#include <cpp11.hpp>
#include <wrappers/matrices.hpp>
#include <wrappers/vectors.hpp>

using namespace Eigen;
using namespace cpp11;
