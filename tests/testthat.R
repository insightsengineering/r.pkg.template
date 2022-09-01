pkg_name <- "r.pkg.template"
library(pkg_name, character.only = TRUE)
testthat::test_check(pkg_name)
