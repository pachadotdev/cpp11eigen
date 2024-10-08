source("dev/00-setup.r")

# Creation, transposition, deformation of an NxN matrix ----

att_benchmark(matrix_calculation_01_r, matrix_calculation_01_arma, matrix_calculation_01_eigen, 2500L, "matrix-calculation-01")
gc()

# NxN normal distributed random matrix^1000 ----

att_benchmark(matrix_calculation_02_r, matrix_calculation_02_arma, matrix_calculation_02_eigen, 2400L, "matrix-calculation-02")
gc()

# Sorting of N random values ----

att_benchmark(matrix_calculation_03_r, matrix_calculation_03_arma, matrix_calculation_03_eigen, 7000000L, "matrix-calculation-03")
gc()

# NxN cross-product matrix ----

att_benchmark(matrix_calculation_04_r, matrix_calculation_04_arma, matrix_calculation_04_eigen, 2800L, "matrix-calculation-04")
gc()

# Linear regression over an NxN matrix ----

att_benchmark(matrix_calculation_05_r, matrix_calculation_05_arma, matrix_calculation_05_eigen, 3000L, "matrix-calculation-05")
gc()
