library(rethinking)
source(file="lib/io.R")

# construct priors
sample_a <- rlnorm(1e4, 0, 1)
sample_b <- rnorm(1e4, 500, 200)
sample_s <- runif(1e4, 0, 200)

# joint prior
prior_x <- rnorm( 1e4 , sample_a + sample_b * 0.8 , sample_s )

print_density_plot(sample_a, "sample_a.png")
print_density_plot(sample_b, "sample_b.png")
print_density_plot(sample_s, "sample_s.png")
print_density_plot(sample_s, "prior_x.png")