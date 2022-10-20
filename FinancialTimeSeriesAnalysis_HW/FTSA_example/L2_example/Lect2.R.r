# Random Sampling
## Drawing lottery numbers
set.seed(2022)
sample(1:49, 6)

# Draw random sample from a dataset

x<-sample(1:3210, 3)
x

tse.dat[x,]
# Draw random sample from a normal distribution
y <- rnorm(n=100, mean=0, sd=1) 

summary(y)

var(y)  # variance

sd(y) # standard deviation, or sqrt(var(y))

par(mfrow=c(1,1))  # reset subplots 
hist(y, prob=T) # Draw histogram
lines(density(y))

plot(density(y)) # Density plot

# Other common distributions: t, chisq, f, unif, binom, pois.

rt(10, df=5) # Draw random # from a t-distrib. with df=5

rchisq(10, df=5) # Draw random # from a chi-sq-distrib. with df=5

rf(10, df1=5, df2=10) # Draw random # from an F-distrib. with df=5,10

# Related functions
qnorm(0.5) # find quantile with cumulative prob. equal to 0.5
pnorm(0) # find cumulative prob. with quantile 0
1/sqrt(2*pi)*exp(-0^2/2)
dnorm(0) # find density with quantile equal to 0
# pdf = 1/sqrt(2*pi)*exp(-x^2/2)

# polygon
x<-c(0,3,0)
y<-c(0,0,1)
w<-c(0,3,1.5)
z<-c(0,0,0.5)
plot(x,y, type="b", lty=2)
polygon(x,y, col="red")
# 根據x,y 得到3個點 (0,0), (3,0), 及(0,1)
# polygon會把這3個點依序利用線段連接起來，
# 並自動把最後一點(0,1)跟第一點(0,0)連接起來，
# 最後圈成或多個（多邊形）的區域，並圖上顏色。

# Another example
plot(x,y, type="b", lty=2)
polygon(w,z, col="blue")

# Finding p-value of a Statistic
x<-seq(from=-3.5, to=3.5, by=0.01)
y<- dnorm(x)
plot(x, y, type="l", col = "slategray", lwd =2, main = "Density of the standard normal distribution")
# Alternatively, curve(dnorm, from = -3.5, to = 3.5)
text(locator(1), expression(f(x) == frac(1, sigma * sqrt(2*pi)) * e^{-frac((x - mu)^2, 2*sigma^2)}), adj = 0.5)
abline(h=0,v=0) # Add axes
abline(v=qnorm(c(0.05, 0.95)), lty=2)

abline(v=2.2, lty=2, col=2)
text(2.2, 0.2, "t-stat =2.2", adj=0.5)
polygon(c( x[x>2.2], 2.2 ),  c(y[x>2.2],0 ), col="#d82521")
# Color and Math.

# Writing a Function
test.f<-function(x){
    x^2 + 1
     }
 
test.f(x=3)

# Create a function using the ??fix?? command, e.g.
fix(test.f). 

# Writing a Function
test.f<-function(param){
  param^2 + 1
}
x<-seq(from=-10, to=10, by=1)
test.f(param=x)

# Plotting a Function
x<-seq(from=-10, to=10, by=1)
plot(x, test.f(x=x), type="l")
abline(h=0,v=0, lty=2)
text(locator(1), expression(f(x) == x^2+1), adj=0.5)

# Plotting a Function
# Plotting 2 lines on the same diagram
x<-seq(from=-3, to=3, by=0.01)
a.f<-function(x){x^3+3*x^2+1}
b.f<-function(x){x^2+1}
plot(x, a.f(x=x), type="l", ylab="Y", main="Functions on top of Each Other")
lines(x, b.f(x=x), lty=2, col=2)
legend(locator(1), lty=1:3, c(expression(x^3+3*x^2+1), expression(x^2+1)), col=1:2)

# Computing Asset Returns (log-return, continues return)
logret.f<-function(x){
	n <- length(x)
	logret <- log(x[2:n]/ x[1:(n-1)])  # or log(x[-1]/ x[-n])
	logret
}

simple_ret <- function(x){
  n <- length(x)
  ret <- (x[2:n] - x[1:(n-1)])/ x[1:(n-1)] # ret <- (x[2:n]/x[1:(n-1)])-1 work as well
  return(ret)
}

# How about, apply this to tse.dat, and calculate the log-returns of the TSE value weighted index?
logret.dat<-logret.f(tse.dat[,"JS"])
plot.ts(logret.dat) 
title("TSE Index Log-Returns")

simple_ret_dat <- simple_ret(tse.dat[,"JS"])
simple_ret_dat
plot.ts(simple_ret_dat) 
title("TSE Index Simple-Returns")

summary(logret.dat); summary(simple_ret_dat); summary((logret.dat - simple_ret_dat))
# draw return with date
library(zoo)
tse<-read.table("~/workspace/nccu_cs_hw/FinancialTimeSeriesAnalysis_HW/FTSA_example/L1_example/tse.prn", header=T)
tse.dat<-na.omit(tse)
tse_date <- as.Date(as.character(tse.dat$DATE), format="%Y%m%d")[2:length(tse.dat$JS)]
tse_js <-tse.dat$JS[2:length(tse.dat$JS)]
tse_zoo <- zoo(cbind(tse_js, logret.dat, simple_ret_dat), tse_date)
head(tse_zoo)
par(mfrow=c(2,2), oma=c(1,1,2,1))
plot(tse_zoo[,"tse_js"], ylab="JS")
title("TSE index JS")
plot(tse_zoo[,"simple_ret_dat"], ylab="Simple return")
title("TSE index Simple return")
plot(tse_zoo[,"logret.dat"], ylab="Log return")
title("TSE index Log return")
mtext(outer=T,"Taiwan Stock Exchange", cex=2)


# IF Statement
x <- c(1.8, 3.14, 4, 88.169, 13)
if(rnorm(1) > 0) sum(x) else mean(x)

# The condition cond can only be of length 1. For vectorized evaluation, use ifelse().
ifelse(x > 4, sqrt(x), x^2)

# Recursively compute first differences in the vector x.
y <- x
for(i in 2:5) {  y[i] <- x[i] - x[i-1]  }
cbind(x,y)
rbind(x,y)

# Avoid such a loop whenever you can by resorting to R??s vectorized operation, for example
z <- x[-1] - x[-5]
z

# while Loop
w <- x
sum(w) 
while(sum(w) < 200) {  w <- 2 } # w 
sum(w) 
cbind(x,w)
rbind(x,w)

# R Multiplication Table

for (i in 1:9){
   for (j in 1:9){
      cat(i, "*", j, "=", i*j, "\t")
   }
   cat("\n")
}


## where "\t" is similar to the "tab" key, while "\n" is similar to the ??carriage return?? key.

MTab.f<-function(i1=1, i2=9, j1=1, j2=9){
   for (i in i1:i2){
      for (j in j1:j2){
         cat(i, "*", j, "=", i*j, "\t")
      }
   cat("\n")
   }
}

MTab.f(i1=3, i2=5, j1=4, j2=6)

# An IRR Example
irr.f<-function(cashflow, seqn, ra=0.01, rb=0.2,rby=0.01){
	results <- NULL
	n <- length(cashflow)
	for(irate in seq(ra, rb, by =rby)) {
		total <- 0
		for(i in 1:n) {
			total <- total + cashflow[i]/(1 + irate)^seqn[i]
		}
		results <- c(results, total)
	}
	plot(seq(ra, rb, by =rby), results, type = "b")
	abline(h = 0)
	cbind(seq(ra, rb, by =rby), results)
}

irr.f(cashflow=c(-18000,rep(5600,5)), seqn=0:5,ra=0.01, rb=0.2,rby=0.01)  # find out the IRR is between 0.16 and 0.17

irr.f(cashflow=c(-18000,rep(5600,5)), seqn=0:5,ra=0.16, rb=0.17,rby=0.001)  # find out the IRR is between 0.167 and 0.168

irr.f(cashflow=c(-18000,rep(5600,5)), seqn=0:5,ra=0.167, rb=0.168,rby=0.0001)

