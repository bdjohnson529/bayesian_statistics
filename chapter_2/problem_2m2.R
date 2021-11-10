p_grid <- seq( from=0 , to=1 , length.out=100 )

likelihood <- dbinom( 3 , size=3 , prob=p_grid )

# new prior
prior <- ifelse( p_grid < 0.5 , 0 , 1 )

posterior <- likelihood * prior

# standardize
posterior <- posterior / sum(posterior)

plot( posterior ~ p_grid , type="l" )