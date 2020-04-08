suppressMessages(suppressWarnings(library(dplyr)))
suppressMessages(suppressWarnings(library(ggplot2)))
suppressMessages(suppressWarnings(library(knitr)))
suppressMessages(suppressWarnings(library(magrittr)))
suppressMessages(suppressWarnings(library(readr)))
suppressMessages(suppressWarnings(library(reticulate)))
pd_text <- "This image was produced by Steve Simon and is placed in the public domain. You are welcome to use this image any way you see fit. An acknowledgement would be appreciated, but is not required."
initiate_image <- function(w=480, h=480) {
  if (redraw_graphs==FALSE) return
  fn <- opts_current$get("label")
  png(filename=paste0("../images/r/", fn, ".png"), width=w, height=h)
  return(invisible(fn))
}
narrow_image <- function() {
  fn <- opts_current$get("label")
  if (redraw_graphs==FALSE) return
  png(filename=paste0("../images/r/", fn, ".png"), width=240, height=480)
  return(invisible(fn))
}
finalize_image <- function(caption="") {
  fn <- opts_current$get("label")
  display_image <<- paste0("![", caption, "](../images/r/", fn, ".png)")
  if (redraw_graphs==FALSE) return
  quiet <- dev.off()
  write(pd_text, file=paste0("../images/r/", fn, ".txt"))
}
