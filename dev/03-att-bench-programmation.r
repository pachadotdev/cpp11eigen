source("dev/00-setup.r")

# N Fibonacci numbers calculation ----

att_benchmark(programmation_01_r, programmation_01_arma, programmation_01_eigen, 3500000L, "programmation-01")
gc()

# Creation of an NxN Hilbert matrix ----

att_benchmark(programmation_02_r, programmation_02_arma, programmation_02_eigen, 3000L, "programmation-02")
gc()

# Grand common divisors of N pairs ----

att_benchmark(programmation_03_r, programmation_03_arma, programmation_03_eigen, 400000L, "programmation-03")
gc()

# Creation of an NxN Toeplitz matrix ----

att_benchmark(programmation_04_r, programmation_04_arma, programmation_04_eigen, 500L, "programmation-04")
gc()

# Escoufier's method on an NxN matrix ----

att_benchmark(programmation_05_r, programmation_05_arma, programmation_05_eigen, 45L, "programmation-05")
gc()
