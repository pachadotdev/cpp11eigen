# copy and paste reverse linking
# https://cran.r-project.org/web/packages/cpp11/index.html

# cpp11 goes to LinkingTo and not Depends, so lee2024 does not count it
cpp11linkingto <- "ambient, area, arrow, bignum, bigrquery, binpackr, BiocParallel, carbondate, cheapr, clock, CMF, cppdoubles, CytoML, deformula, densityClust, epiworldR, flowCore, flowWorkspace, ggraph, haven, heumilkr, hilbert, httpgd, igraph, jinjar, literanger, lobstr, lzstring, marquee, meltr, mice, minty, MOSim, myTAI, ncdfFlow, openCyto, particles, poputils, rar, RcppAlgos, RcppBigIntAlgos, readNSx, readr, readxl, rjsoncons, RMariaDB, roxygen2, RPostgres, RSQLite, shide, shinytest2, sift, SpatialKDE, spatialsample, supercells, svglite, systemfonts, tardis, textrecipes, textshaping, tidyfast, tidygraph, tidyr, timechange, timeplyr, tipitaka, transformr, triangulr, triptych, tweenr, twosamples, tzdb, unigd, vdiffr, vroom, websocket"

# Count the number of commas
cpp11count <- stringr::str_count(cpp11linkingto, ",")

cpp11count
