library(rethinking)
source(file="lib/io.R")

# configure output png
png(file = "reports/prior_prediction.png",
    width     = 3.25,
    height    = 3.25,
    units     = "in",
    res       = 1200,
    pointsize = 4
    )

# import data
d <- read.csv("data/hour.csv")

# sample priors
set.seed(1234)
N <- 100
a <- rnorm( N, 400, 200)
b <- rnorm( N, 200, 100 )
xbar <- mean(d$temp)

# configure plot
plot(
      NULL ,
      xlim=range(d$temp),
      ylim=c(-400,1000),
      xlab="normalized temperature",
      ylab="bike count"
    )

# plot priors
for ( i in 1:N )
    curve(
           a[i] + b[i]*(x - xbar),
           from=min(d$temp),
           to=max(d$temp),
           add=TRUE,
           col=col.alpha("black",0.2)
          )
