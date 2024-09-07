source("dev/00-setup.r")

library(economiccomplexity)
library(dplyr)
library(RPostgres)

con <- dbConnect(
  RPostgres::Postgres(), dbname = "tradestatistics", host = "localhost",
  port = 5432, user = "tradestatistics", password = Sys.getenv("TRADESTATISTICS_SQL_PWD"))

trade <- tbl(con, "hs_rev2017_imports") %>%
  filter(year == 2020L) %>%
  group_by(country = partner_iso, product = commodity_code) %>%
  summarise(value = sum(trade_value_usd, na.rm = TRUE)) %>%
  filter(country != "0-unspecified") %>%
  collect()

trade %>%
  ungroup() %>%
  distinct(country)

trade %>%
  ungroup() %>%
  distinct(product)

X <- economiccomplexity:::country_product_aggregation(
  trade, "country", "product", "value")
X <- economiccomplexity:::dataframe_to_matrix(X)
X <- as.matrix(X)

balassa_r_2 <- function(X) {
  Y <- balassa_r(X)
  dimnames(Y) <- NULL
  Y
}

bench <- mark(
  balassa_r_2(X),
  balassa_arma(X),
  balassa_eigen(X),
  min_iterations = 10,
  max_iterations = 10
)

as.numeric(bench::as_bench_time(bench$median))

dir <- dirname(fout)
try(dir.create(dir, recursive = TRUE))

saveRDS(bench, "dev/own-balassa/benchmarks-balassa-index.rds")
