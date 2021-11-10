library(rethinking)

# configure output png
png(file = "reports/posterior.png",
    width     = 3.25,
    height    = 3.25,
    units     = "in",
    res       = 1200,
    pointsize = 4
    )

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

# plot data
plot( cnt ~ temp , data=d , col=rangi2 )

# uncertainty bounds
temp.seq <- seq( from=0 , to=1 , by=0.05 )
mu <- link( m , data=data.frame(temp=temp.seq) )

# summarize the distribution of mu
mu.mean <- apply( mu , 2 , mean )
mu.PI <- apply( mu , 2 , PI , prob=0.89 )

# plot posterior
post <- extract.samples( m )
a_map <- mean(post$a)
b_map <- mean(post$b)
curve( a_map + b_map*(x - tbar) , add=TRUE )

# plot the MAP line, aka the mean mu for each weight
lines( temp.seq , mu.mean )

# plot a shaded region for 89% PI
shade( mu.PI , temp.seq )

# prediction intervals
sim.count <- sim( m , data=list(temp=temp.seq) )
count.PI <- apply( sim.count , 2 , PI , prob=0.89 )

# plot prediction interval
shade( count.PI , temp.seq )