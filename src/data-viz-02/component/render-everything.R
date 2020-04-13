# This file will render every R Markdown file in the src directory and
# store the results in the results directory.

library(rmarkdown)

file_list <- list.files(path=".", pattern="*.Rmd", full.names=TRUE)
for (f in file_list) {
  render(f)
  cat(f)
  cat("\n")
}