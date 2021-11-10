library(rethinking)

d <- read.csv("data/hour.csv")
tbar <- mean(d$temp)

m <- quap(
    alist(
        cnt ~ dnorm( mu, sigma ),
        mu <- a + b * ( temp - tbar ),
        a ~ dnorm(400, 200),
        b ~ dnorm(200, 100),
        sigma ~ dunif(0, 200)

    ) , data=d )

precis( m )