library(rethinking)

# set destination report file

#png(file = 'reports/sample_x.png',
#    width     = 3.25,
#    height    = 3.25,
#    units     = "in",
#    res       = 1200,
#    pointsize = 4
#    )


pdf(file = 'reports/prior_prediction.pdf')


# construct priors
sample_a <- rlnorm(1e4, 0, 1)
sample_b <- rnorm(1e4, 500, 200)
sample_s <- runif(1e4, 0, 200)


# joint prior
prior_x <- rnorm( 1e4 , sample_a + sample_b * 0.8 , sample_s )

plot(dens(sample_a))
#plot(sample_b)
#plot(dens(sample_s))
#plot(dens(prior_x))

# turn off plotting
dev.off()