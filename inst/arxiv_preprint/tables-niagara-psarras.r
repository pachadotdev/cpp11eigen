library(dplyr)
library(tidyr)

# tidy ----

finp <- list.files("benchmarks/niagara/", pattern = "benchmarks-psarras-large", full.names = TRUE)

d <- readRDS(finp) %>%
  mutate(
    expression = as.character(expression),
    expression = case_when(
      expression == "solve_nai(A, B)" ~ "Naive solution",
      expression == "solve_rec(A, B)" ~ "Smart solution",
      expression == "solve_nai_arma(A, B)" ~ "Naive solution",
      expression == "solve_rec_arma(A, B)" ~ "Smart solution",
      expression == "solve_nai_eigen(A, B)" ~ "Naive solution",
      expression == "solve_rec_eigen(A, B)" ~ "Smart solution"
    ),
    software = c("Base R", "Base R", "Armadillo", "Armadillo", "Eigen", "Eigen")
  ) %>%
  select(expression, software, median_30000 = median) %>%
  group_by(expression) %>%
  mutate(rank_30000 = dense_rank(median_30000)) %>%
  arrange(expression, rank_30000) %>%
  mutate(expression = paste0(expression, " - ", software)) %>%
  select(-software)

finp <- list.files("benchmarks/niagara/", pattern = "benchmarks-psarras-small", full.names = TRUE)

d2 <- readRDS(finp) %>%
  mutate(
    expression = as.character(expression),
    expression = case_when(
      expression == "solve_nai(A, B)" ~ "Naive solution",
      expression == "solve_rec(A, B)" ~ "Smart solution",
      expression == "solve_nai_arma(A, B)" ~ "Naive solution",
      expression == "solve_rec_arma(A, B)" ~ "Smart solution",
      expression == "solve_nai_eigen(A, B)" ~ "Naive solution",
      expression == "solve_rec_eigen(A, B)" ~ "Smart solution"
    ),
    software = c("Base R", "Base R", "Armadillo", "Armadillo", "Eigen", "Eigen")
  ) %>%
  select(expression, software, median_6000 = median) %>%
  group_by(expression) %>%
  mutate(rank_6000 = dense_rank(median_6000)) %>%
  arrange(expression, rank_6000) %>%
  mutate(expression = paste0(expression, " - ", software)) %>%
  select(-software)

d <- d %>%
  left_join(d2, by = "expression") %>%
  select(expression, median_6000, rank_6000, median_30000, rank_30000)

saveRDS(d, "inst/arxiv_preprint/tables-niagara-psarras.rds")
