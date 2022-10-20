library

bs_f <- function(s, x, t, r, sigma){ # s: stock price; x: strike price of option; t: time to expiration in years; r: rf-rate; sigma: volatility
    call_price <- s  
}
length(paste("label", 1:30, sep=" "))

N <- 3
env <- new.env()
assign("N", 27, envir = env)
N
## this version changes the visible copy of N only, since the argument
## passed to eval is '4'.
eval(N <- 4, env)
N
get("N", envir = env)
## this version does the assignment in env, and changes N only there.
evalq(N <- 5, env)
N
get("N", envir = env)