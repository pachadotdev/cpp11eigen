library(dplyr)
library(bench)
library(purrr)
library(ggplot2)
library(tintin)

finp <- list.files("dev", pattern = "benchmarks-matrix-calculation", full.names = TRUE)

d <- map_df(
  finp,
  function(f) {
    # f <- finp[1]
    readRDS(f) %>%
      mutate(
        expression = as.character(expression),
        expression = case_when(
          grepl("matrix-calculation-01", f) ~ "Creation, transposition, deformation of a 2,500x2,500 matrix",
          grepl("matrix-calculation-02", f) ~ "2,400x2,400 normal distributed random matrix^1000",
          grepl("matrix-calculation-03", f) ~ "Sorting of 7,000,000 random values",
          grepl("matrix-calculation-04", f) ~ "2,800x2,800 cross-product matrix",
          grepl("matrix-calculation-05", f) ~ "Linear regression over a 3,000x3,000 matrix"
        ),
        software = c("R", "Armadillo", "Eigen")
      ) %>%
      select(expression, software, median)
  }
)

d$median <- as.numeric(bench::as_bench_time(d$median))

d$software <- factor(d$software, levels = c("Armadillo", "Eigen", "R"))

clrs <- tintin_clrs(3, option = "cigars of the pharaoh")

plot_matrix_calculation <- ggplot(d, aes(x = median, y = expression, fill = software)) +
  geom_col(position = "dodge") +
  labs(
    title = "Matrix calculation benchmarks (absolute time)",
    x = "Time (s)",
    y = "Operation"
  ) +
  # theme_minimal(base_size = 10) +
  theme_gray(base_size = 10) +
  theme(plot.title.position = "plot") +
  scale_fill_manual(
    values = c("Armadillo" = clrs[1], "Eigen" = clrs[2], "R" = clrs[3]),
    name = "Software",
    guide = guide_legend(reverse = T)
  )

# d2 <- d %>%
#   group_by(expression) %>%
#   mutate(median = median / max(median))

# plot_matrix_calculation_prop <- ggplot(d2, aes(x = median, y = expression, fill = software)) +
#   geom_col(position = "dodge") +
#   labs(
#     title = "Matrix calculation benchmarks (relative time)",
#     x = "Time (s)",
#     y = "Operation"
#   ) +
#   # theme_minimal(base_size = 10) +
#   theme_gray(base_size = 10) +
#   theme(plot.title.position = "plot") +
#   scale_fill_manual(
#     values = c("Armadillo" = clrs[1], "Eigen" = clrs[2], "R" = clrs[3]),
#     name = "Software",
#     guide = guide_legend(reverse = T)
#   ) +
#   scale_x_continuous(labels = scales::percent)

finp <- list.files("dev", pattern = "benchmarks-matrix-functions", full.names = TRUE)

d <- map_df(
  finp,
  function(f) {
    # f <- finp[1]
    readRDS(f) %>%
      mutate(
        expression = as.character(expression),
        expression = case_when(
          grepl("matrix-functions-01", f) ~ "FFT over 2,400,000 random values",
          grepl("matrix-functions-02", f) ~ "Eigenvalues of a 640x640 random matrix",
          grepl("matrix-functions-03", f) ~ "Determinant of a 2,500x2,500 random matrix",
          grepl("matrix-functions-04", f) ~ "Cholesky decomposition of a 3,000x3,000 matrix",
          grepl("matrix-functions-05", f) ~ "Inverse of a 1,600x1,600 random matrix"
        ),
        software = c("R", "Armadillo", "Eigen")
      ) %>%
      select(expression, software, median)
  }
)

d$median <- as.numeric(bench::as_bench_time(d$median))

d$software <- factor(d$software, levels = c("Armadillo", "Eigen", "R"))

plot_matrix_functions <- ggplot(d, aes(x = median, y = expression, fill = software)) +
  geom_col(position = "dodge") +
  labs(
    title = "Matrix functions benchmarks (absolute time)",
    x = "Time (s)",
    y = "Operation"
  ) +
  # theme_minimal(base_size = 10) +
  theme_gray(base_size = 10) +
  theme(plot.title.position = "plot") +
  scale_fill_manual(
    values = c("Armadillo" = clrs[1], "Eigen" = clrs[2], "R" = clrs[3]),
    name = "Software",
    guide = guide_legend(reverse = T)
  )

finp <- list.files("dev", pattern = "benchmarks-programmation", full.names = TRUE)

d <- map_df(
  finp,
  function(f) {
    # f <- finp[1]
    readRDS(f) %>%
      mutate(
        expression = as.character(expression),
        expression = case_when(
          grepl("programmation-01", f) ~ "3,500,000 Fibonacci numbers calculation",
          grepl("programmation-02", f) ~ "Creation of a 3,000x3,000 Hilbert matrix",
          grepl("programmation-03", f) ~ "Grand common divisors of 400,000 pairs of numbers",
          grepl("programmation-04", f) ~ "Creation of a 500x500 Toeplitz matrix",
          grepl("programmation-05", f) ~ "Escoufier's method on a 45x45 matrix"
        ),
        software = c("R", "Armadillo", "Eigen")
      ) %>%
      select(expression, software, median)
  }
)

d$median <- as.numeric(bench::as_bench_time(d$median))

d$software <- factor(d$software, levels = c("Armadillo", "Eigen", "R"))

plot_programmation <- ggplot(d, aes(x = median, y = expression, fill = software)) +
  geom_col(position = "dodge") +
  labs(
    title = "Programmation benchmarks (absolute time)",
    x = "Time (s)",
    y = "Operation"
  ) +
  # theme_minimal(base_size = 10) +
  theme_gray(base_size = 10) +
  theme(plot.title.position = "plot") +
  scale_fill_manual(
    values = c("Armadillo" = clrs[1], "Eigen" = clrs[2], "R" = clrs[3]),
    name = "Software",
    guide = guide_legend(reverse = T)
  )
