p_grid <- seq( from=0 , to=1 , length.out=100 )

# likelihood of 3 water in 3 tosses
likelihood <- dbinom( 3 , size=3 , prob=p_grid )

# likelihood of 3 water in 4 tosses
likelihood <- dbinom( 3 , size=4 , prob=p_grid )

# likelihood of 5 water in 7 tosses
# likelihood <- dbinom( 5 , size=7 , prob=p_grid )

# uniform prior
prior <- rep(1,100)
posterior <- likelihood * prior
posterior <- posterior / sum(posterior) # standardize

plot( posterior ~ p_grid , type="l" )