library(dplyr)
library(tidyr)
library(bench)
library(purrr)

# tidy ----

finp <- list.files("benchmarks/niagara/att-large", pattern = "benchmarks-matrix-calculation", full.names = TRUE)

d <- map_df(
  finp,
  function(f) {
    # f <- finp[1]
    readRDS(f) %>%
      mutate(
        expression = as.character(expression),
        expression = case_when(
          grepl("matrix-calculation-01", f) ~ "Creation and modification of a 12500x12500 matrix",
          grepl("matrix-calculation-02", f) ~ "12000x12000 matrix^1000",
          grepl("matrix-calculation-03", f) ~ "Sorting of 35000000 values",
          grepl("matrix-calculation-04", f) ~ "14000x14000 cross-product matrix",
          grepl("matrix-calculation-05", f) ~ "Linear regression over a 15000x15000 matrix"
        ),
        software = c("R", "Armadillo", "Eigen")
      ) %>%
      select(expression, software, median)
  }
)

# d <- d %>%
#   pivot_wider(names_from = software, values_from = median) %>%
#   mutate(benchmark = "Matrix calculation") %>%
#   select(benchmark, everything())

d$median <- as.numeric(bench::as_bench_time(d$median))

d <- d %>%
  group_by(expression) %>%
  mutate(
    relative = paste0(scales::comma(round(100 * median / min(median), 0)), "%")
  )

# d$software <- factor(d$software, levels = c("Armadillo", "Eigen", "R"))

d1 <- d %>%
  group_by(expression) %>%
  mutate(
    rank = dense_rank(median)
  ) %>%
  arrange(expression, rank) %>%
  mutate(
    expression = paste0(expression, " - ", software),
    median = signif(median, 5)
  ) %>%
  select(expression, median, relative, rank)

d1 <- d1 %>%
  separate(expression, into = c("operation", "software"), sep = " - ")

finp <- list.files("benchmarks/niagara/att-large", pattern = "benchmarks-matrix-functions", full.names = TRUE)

d <- map_df(
  finp,
  function(f) {
    # f <- finp[1]
    readRDS(f) %>%
      mutate(
        expression = as.character(expression),
        expression = case_when(
          grepl("matrix-functions-01", f) ~ "Fast Fourier Transform over 12000000 values",
          grepl("matrix-functions-02", f) ~ "Eigenvalues of a 3200x3200 matrix",
          grepl("matrix-functions-03", f) ~ "Determinant of a 12500x12500 matrix",
          grepl("matrix-functions-04", f) ~ "Cholesky decomposition of a 15000x15000 matrix",
          grepl("matrix-functions-05", f) ~ "Inverse of a 8000x8000 matrix"
        ),
        software = c("R", "Armadillo", "Eigen")
      ) %>%
      select(expression, software, median)
  }
)

d$median <- as.numeric(bench::as_bench_time(d$median))

# d$software <- factor(d$software, levels = c("Armadillo", "Eigen", "R"))

d <- d %>%
  group_by(expression) %>%
  mutate(
    relative = paste0(scales::comma(round(100 * median / min(median), 0)), "%")
  )

d2 <- d %>%
  group_by(expression) %>%
  mutate(
    rank = dense_rank(median)
  ) %>%
  arrange(expression, rank) %>%
  mutate(
    expression = paste0(expression, " - ", software),
    median = signif(median, 5)
  ) %>%
  select(expression, median, relative, rank)

d2 <- d2 %>%
  separate(expression, into = c("operation", "software"), sep = " - ")

finp <- list.files("benchmarks/niagara/att-large", pattern = "benchmarks-programmation", full.names = TRUE)

d <- map_df(
  finp,
  function(f) {
    # f <- finp[1]
    readRDS(f) %>%
      mutate(
        expression = as.character(expression),
        expression = case_when(
          grepl("programmation-01", f) ~ "17500000 Fibonacci numbers calculation",
          grepl("programmation-02", f) ~ "Creation of a 15000x15000 Hilbert matrix",
          grepl("programmation-03", f) ~ "Grand common divisors of 2000000 pairs",
          grepl("programmation-04", f) ~ "Creation of a 2500x2500 Toeplitz matrix",
          grepl("programmation-05", f) ~ "Escoufier's method on a 225x225 matrix"
        ),
        software = c("R", "Armadillo", "Eigen")
      ) %>%
      select(expression, software, median)
  }
)

d$median <- as.numeric(bench::as_bench_time(d$median))

d <- d %>%
  group_by(expression) %>%
  mutate(
    relative = paste0(scales::comma(round(100 * median / min(median), 0)), "%")
  )

d3 <- d %>%
  group_by(expression) %>%
  mutate(
    rank = dense_rank(median)
  ) %>%
  arrange(expression, rank) %>%
  mutate(
    expression = paste0(expression, " - ", software),
    median = signif(median, 5)
  ) %>%
  select(expression, median, relative, rank)

d3 <- d3 %>%
  separate(expression, into = c("operation", "software"), sep = " - ")

# presentation ----

d3 <- d3 %>%
  mutate(
    median = case_when(
      # express as scientific notation if median < 0.05
      median < 1 ~ format(median, scientific = TRUE, digits = 2),
      TRUE ~ as.character(round(median, 3))
    )
  ) %>%
  mutate(
    # in median, replace e-02 by \times 10^-2
    median = gsub("e-0(\\d)", " \\\\times 10^{-\\1}", median),
    median = paste0("$", median, "$")
  ) %>%
  mutate(
    # in expression replace 123x123 by 123 \times 123 by $123 \times 123$
    operation = gsub("(\\d+)x(\\d+)", "\\$\\1 \\\\times \\2\\$", operation)
  ) %>%
  mutate(
    # in expression replace matrix^1000 by $\text{matrix}^{1000}$
    operation = gsub("matrix\\^(\\d+)", "\\$\\\\text{matrix}^{\\1}\\$", operation)
  )

d2 <- d2 %>%
  mutate(
    median = case_when(
      # express as scientific notation if median < 0.05
      median < 0.05 ~ format(median, scientific = TRUE, digits = 2),
      TRUE ~ as.character(round(median, 3))
    )
  ) %>%
  mutate(
    # in median, replace e-02 by \times 10^-2
    median = gsub("e-0(\\d)", " \\\\times 10^{-\\1}", median),
    median = paste0("$", median, "$")
  ) %>%
  mutate(
    # in expression replace 123x123 by 123 \times 123 by $123 \times 123$
    operation = gsub("(\\d+)x(\\d+)", "\\$\\1 \\\\times \\2\\$", operation)
  ) %>%
  mutate(
    # in expression replace matrix^1000 by $\text{matrix}^{1000}$
    operation = gsub("matrix\\^(\\d+)", "\\$\\\\text{matrix}^{\\1}\\$", operation)
  )

d1 <- d1 %>%
  mutate(
    median = case_when(
      # express as scientific notation if median < 0.05
      median < 0.1 ~ format(median, scientific = TRUE, digits = 2),
      TRUE ~ as.character(round(median, 3))
    )
  ) %>%
  mutate(
    # in median, replace e-02 by \times 10^-2
    median = gsub("e-0(\\d)", " \\\\times 10^{-\\1}", median),
    median = paste0("$", median, "$")
  ) %>%
  mutate(
    # in expression replace 123x123 by 123 \times 123 by $123 \times 123$
    operation = gsub("(\\d+)x(\\d+)", "\\$\\1 \\\\times \\2\\$", operation)
  ) %>%
  mutate(
    # in expression replace matrix^1000 by $\text{matrix}^{1000}$
    operation = gsub("matrix\\^(\\d+)", "\\$\\\\text{matrix}^{\\1}\\$", operation)
  )

# format d1$operation numbers as 3000 -> 3,000 or 10000 -> 10,000
# if there are four consecutive digits, add a comma after the first digit
d1$operation <- gsub("(\\d)(\\d)(\\d)(\\d)(\\d)(\\d)(\\d)(\\d)", "\\1\\2,\\3\\4\\5,\\6\\7\\8", d1$operation)
d1$operation <- gsub("(\\d)(\\d)(\\d)(\\d)(\\d)(\\d)(\\d)", "\\1,\\2\\3\\4,\\5\\6\\7", d1$operation)
d1$operation <- gsub("(\\d)(\\d)(\\d)(\\d)(\\d)(\\d)", "\\1\\2\\3,\\4\\5\\6", d1$operation)
d1$operation <- gsub("(\\d)(\\d)(\\d)(\\d)(\\d)", "\\1\\2,\\3\\4\\5", d1$operation)
d1$operation <- gsub("(\\d)(\\d)(\\d)(\\d)", "\\1,\\2\\3\\4", d1$operation)

d2$operation <- gsub("(\\d)(\\d)(\\d)(\\d)(\\d)(\\d)(\\d)(\\d)", "\\1\\2,\\3\\4\\5,\\6\\7\\8", d2$operation)
d2$operation <- gsub("(\\d)(\\d)(\\d)(\\d)(\\d)(\\d)(\\d)", "\\1,\\2\\3\\4,\\5\\6\\7", d2$operation)
d2$operation <- gsub("(\\d)(\\d)(\\d)(\\d)(\\d)(\\d)", "\\1\\2\\3,\\4\\5\\6", d2$operation)
d2$operation <- gsub("(\\d)(\\d)(\\d)(\\d)(\\d)", "\\1\\2,\\3\\4\\5", d2$operation)
d2$operation <- gsub("(\\d)(\\d)(\\d)(\\d)", "\\1,\\2\\3\\4", d2$operation)

d3$operation <- gsub("(\\d)(\\d)(\\d)(\\d)(\\d)(\\d)(\\d)(\\d)", "\\1\\2,\\3\\4\\5,\\6\\7\\8", d3$operation)
d3$operation <- gsub("(\\d)(\\d)(\\d)(\\d)(\\d)(\\d)(\\d)", "\\1,\\2\\3\\4,\\5\\6\\7", d3$operation)
d3$operation <- gsub("(\\d)(\\d)(\\d)(\\d)(\\d)(\\d)", "\\1\\2\\3,\\4\\5\\6", d3$operation)
d3$operation <- gsub("(\\d)(\\d)(\\d)(\\d)(\\d)", "\\1\\2,\\3\\4\\5", d3$operation)
d3$operation <- gsub("(\\d)(\\d)(\\d)(\\d)", "\\1,\\2\\3\\4", d3$operation)

out <- list(d1 = d1, d2 = d2, d3 = d3)

saveRDS(out, "inst/arxiv_preprint/tables-niagara-att-large.rds")
