#' Vendor the cpp11 and cpp11eigen dependency
#'
#' Vendoring is the act of making your own copy of the 3rd party packages your
#' project is using. It is often used in the go language community.
#'
#' This function vendors cpp11 and cpp11eigen into your package by copying
#' the cpp11 and cpp11eigen headers into the `inst/include` folder and
#' adding 'cpp11 version: XYZ' and 'cpp11eigen version: XYZ' to the top of
#' the files, where XYZ is the version of cpp11 and cpp11eigen currently
#' installed on your machine.
#'
#' Vendoring places the responsibility of updating the code on
#' you. Bugfixes and new features in cpp11 and cpp11eigen will not be
#' available for your code until you run `cpp_vendor()` again.
#'
#' @param dir The directory to vendor the code into.
#' @param subdir The subdirectory to vendor the code into.
#' @return The file path to the vendored code (invisibly).
#' @export
#' @examples
#' # create a new directory
#' dir <- tempdir()
#' dir.create(dir)
#'
#' # vendor the cpp11 headers into the directory
#' cpp_vendor(dir)
cpp_vendor <- function(dir = NULL, subdir = "/inst/include") {
  if (is.null(dir)) {
    stop("You must provide a path to vendor the code into", call. = FALSE)
  }

  path <- paste0(dir, subdir)

  path2 <- file.path(path, "cpp11")
  if (dir.exists(path2)) {
    stop("'", path2, "' already exists\n * run unlink('", path2, "', recursive = TRUE)", call. = FALSE)
  }

  # Vendor cpp11 ----

  dir.create(
    path2,
    recursive = TRUE,
    showWarnings = FALSE
  )

  current_cpp11 <- system.file(
    "include",
    "cpp11",
    package = "cpp11"
  )

  if (!nzchar(current_cpp11)) {
    stop("cpp11 is not installed", call. = FALSE)
  }

  cpp11_version <- utils::packageVersion("cpp11")

  cpp11_header <- sprintf(
    "// cpp11 version: %s\n// vendored on: %s",
    cpp11_version,
    Sys.Date()
  )

  write_header(
    path, "cpp11.hpp", "cpp11",
    cpp11_header
  )

  copy_files(
    list.files(current_cpp11, full.names = TRUE),
    path, "cpp11", cpp11_header
  )

  # Vendor cpp11eigen ----

  dir.create(
    file.path(path, "eigen"),
    recursive = TRUE,
    showWarnings = FALSE
  )

  dir.create(
    file.path(path, "wrappers"),
    recursive = TRUE,
    showWarnings = FALSE
  )

  current_eigen <- system.file(
    "include",
    "Eigen",
    package = "cpp11eigen"
  )

  current_wrappers <- system.file(
    "include",
    "wrappers",
    package = "cpp11eigen"
  )

  if (!nzchar(current_eigen) || !nzchar(current_wrappers)) {
    stop("cpp11eigen is not installed", call. = FALSE)
  }

  eigen_version <- utils::packageVersion("cpp11eigen")

  eigen_header <- sprintf(
    "// cpp11eigen version: %s\n// vendored on: %s",
    eigen_version,
    Sys.Date()
  )

  write_header(
    path, "cpp11eigen.hpp", "cpp11eigen",
    eigen_header
  )

  copy_files(
    list.files(current_eigen, full.names = TRUE, recursive = TRUE),
    path, "eigen", eigen_header
  )

  copy_files(
    list.files(current_wrappers, full.names = TRUE),
    path, "wrappers", eigen_header
  )

  # Additional steps to make vendoring work ----

  message(paste(
    "Makevars and/or Makevars.win should have a line such as",
    "'PKG_CPPFLAGS = -I../inst/include'"
  ))

  message("DESCRIPTION should not have lines such as 'LinkingTo: cpp11'")

  invisible(path)
}

write_header <- function(path, header, pkg, eigen_header) {
  writeLines(
    c(
      eigen_header,
      readLines(
        system.file("include", header, package = pkg)
      )
    ),
    file.path(path, header)
  )
}

copy_files <- function(files, path, out, eigen_header) {
  for (f in files) {
    writeLines(
      c(eigen_header, readLines(f)),
      file.path(path, out, basename(f))
    )
  }
}
