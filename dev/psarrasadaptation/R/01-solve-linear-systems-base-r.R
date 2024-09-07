#' @noRd 
#' @export
solve_nai <- function(A, B) {
  solve(A) %*% B
}

#' @noRd
#' @export
solve_rec <- function(A, B) {
  solve(A, B)
}
