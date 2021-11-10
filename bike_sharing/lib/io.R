print_density_plot <- function(sample, filename) {
  filepath = paste('reports/', filename, sep="")

  png(file = filepath,
      width     = 3.25,
      height    = 3.25,
      units     = "in",
      res       = 1200,
      pointsize = 4
      )

  plot(density(sample))

  # close plot
  dev.off()
}