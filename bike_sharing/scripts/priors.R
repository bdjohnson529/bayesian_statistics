library(rethinking)
source(file="lib/io.R")

# construct priors
sample_a <- rnorm(1e4, 400, 200)
sample_b <- rnorm(1e4, 500, 200)
sample_s <- runif(1e4, 0, 200)

print_density_plot(sample_a, "sample_a.png")
print_density_plot(sample_b, "sample_b.png")
print_density_plot(sample_s, "sample_s.png")