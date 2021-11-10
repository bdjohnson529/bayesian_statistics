library(rethinking)

# set destination report file
pdf(file = '../reports/prior_prediction.pdf')

# construct priors
sample_a <- rlnorm(1e4, 0, 100)
sample_b <- rlnorm(1e4, 500, 200)
sample_s <- runif(1e4, 0, 200)

# joint prior
prior_h <- rnorm( 1e4 , sample_a + sample_b * 0.5 , sample_s )

plot(sample_a)
plot(sample_b)
plot(sample_s)

# turn off plotting
dev.off()