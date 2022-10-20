# Another IRR Example
new_irr_f <- function(cashflow, seqn, ra=0.01, rb=0.2,rby=0.01){
  results <- NULL
  n <- length(cashflow)
  for(irate in seq(ra, rb, by =rby)) {
    total <- sum(cashflow/(1 + irate)^seqn)
    results <- c(results, total)
  }
  plot(seq(ra, rb, by =rby), results, type = "b")
  abline(h = 0)
  cbind(seq(ra, rb, by =rby), results)
}

new_irr_f(cashflow=c(-18000,rep(5600,5)), seqn=0:5,ra=0.01, rb=0.2,rby=0.01)  # find out the IRR is between 0.16 and 0.17

new_irr_f(cashflow=c(-18000,rep(5600,5)), seqn=0:5,ra=0.16, rb=0.17,rby=0.001)  # find out the IRR is between 0.167 and 0.168

new_irr_f(cashflow=c(-18000,rep(5600,5)), seqn=0:5,ra=0.167, rb=0.168,rby=0.0001)