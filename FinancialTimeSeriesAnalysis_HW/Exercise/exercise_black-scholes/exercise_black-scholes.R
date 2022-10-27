black_scholes_f <- function(s, x, t, r, sigma_){ # s: stock price; x: strike price of option; t: time to expiration in years; r: rf-rate; sigma: volatility
    d1 = (log(s/x) + (r+((sigma_^2)/2))*t)/(sigma_*(t^0.5))
    d2 = d1 - (sigma_*(t^0.5))
    call_price <- s * pnorm(d1) - x * exp(-1*r*t) * pnorm(d2)
    put_price <- x * exp(-1*r*t) * pnorm(-1*d2) - s * pnorm(-1*d1)
    return(list("call_price"=call_price, "put_price"=put_price))
}

stock_price_range = seq(100,120,0.1)
call_price <- NULL
put_price <- NULL
for (stock_price in stock_price_range){
  results <- black_scholes_f(s=stock_price, x=110, t=1, r=0.05, sigma_=0.2)
  call_price <- c(call_price, results[["call_price"]])
  put_price <- c(put_price, results[["put_price"]])
}

call_price_diff <- call_price[-1] - call_price[-length(call_price)]
put_price_diff <- put_price[-1] - put_price[-length(put_price)]
stock_price_diff <- stock_price_range[-1] - stock_price_range[-length(stock_price_range)]
call_price_derivative <- call_price_diff / stock_price_diff
put_price_derivative <- put_price_diff / stock_price_diff

par(mfrow=c(2,2), oma=c(1,1,2,1))
plot(stock_price_range, call_price, type="l")
title("call price in different stock price")
plot(stock_price_range, put_price, type="l")
title("put price in different stock price")
plot(stock_price_range[2:length(stock_price_range)], call_price_derivative, type="l")
title("derivative of call price")
plot(stock_price_range[2:length(stock_price_range)], put_price_derivative, type="l")
title("derivative of put price")
mtext(outer=T,"Call & Put", cex=2)


