# Simulate a random walk process
par(mfrow=c(1,2)) 
set.seed(1)
y1<-arima.sim(n=100, list(order = c(0,1,0)))
plot.ts(y1, main="A simulated Random Walk Process", xlab="")
acf(y1, main="Correlogram of the simulated Process")


# Compared with a Near-Unit Root Process in Small Sample 
par(mfrow=c(2,2),oma=c(1,1,4,1))

set.seed(1)
x.I1 <- arima.sim(list(order = c(0,1,0)), n = 100)
plot.ts(x.I1, main="A simulated Random Walk Process", xlab="")
acf(x.I1,lag.max=30)
set.seed(1)
x.99 <- arima.sim(list(order = c(1,0,0), ar=0.99), n = 100)
plot.ts(x.99, main="A simulated Near Unit-Root Process", xlab="")
acf(x.99,lag.max=30)

mtext("Comparing a Random Walk with a near Unit-Root Process\n in Small Samples (n=100) ", outer=T, cex=2)
par(mfrow=c(1,1))

# Compared with a Near Unit-Root Process in Large Sample 
par(mfrow=c(2,2),oma=c(1,1,4,1))

set.seed(1)
x.I1 <- arima.sim(list(order = c(0,1,0)), n = 5000)
plot.ts(x.I1)
acf(x.I1,lag.max=30)

set.seed(1)
x.99 <- arima.sim(list(order = c(1,0,0), ar=0.99), n = 5000)
plot.ts(x.99)
acf(x.99,lag.max=30)

mtext("Comparing a Random Walk with a near Unit-Root Process\n in Large Samples (n=5000) ", outer=T, cex=2)

par(mfrow=c(1,1))

# Tests
x1 <- arima.sim(list(order = c(0,1,0)), n =100)

library(tseries) 
adf.test(x1,k=1)
# tseries::adf.test() eliminate drift and time-trend before testing ADF.

# Augmented Dickey Fuller with trend and drift
library(urca)
df1=ur.df(x1,type="drift",lags=1)
#ur.df(y, type = c("none", "drift", "trend"), lags = 1, selectlags = c("Fixed", "AIC", "BIC"))
summary(df1)

library(fUnitRoots)
adfTest(x1, lags=1, type="c")
# adfTest(x, lags = 1, type = c("nc", "c", "ct"), title = NULL, description = NULL)

# Phillips-Perron Test from the stats package
PP.test(x1) 

# KPSS Test from the urca package
Df3 <- urca::ur.kpss(x1)
summary(df3)
