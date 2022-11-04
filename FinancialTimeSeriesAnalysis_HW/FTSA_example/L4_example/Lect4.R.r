# Computing Asset Returns
logret.f<-function(x){
  n <- length(x)
  logret <- log(x[-1]/ x[-n]) ##or log(x[2:n]/ x[1:(n-1)]) 
  logret
}

# How about, apply this to tse.dat, and calculate the log-returns of the TSE value weighted index?
library(dplyr)
library(zoo)

tse<-read.table("~/workspace/nccu_cs_hw/FinancialTimeSeriesAnalysis_HW/FTSA_example/L1_example/tse.prn", header=T)
## How to get rid of the missing values “NA”?
tse.dat<-na.omit(tse)

logR <- tse.dat$JS %>% logret.f()

tse.ts <-zoo(cbind(tse.dat[-1,-1], logR),
             as.Date(as.character(tse.dat$DATE[-1]), format="%Y%m%d"))  # 拿掉第一天的資料， 因為logR 沒有第一天的資料

plot(tse.ts$JS,xlab="", ylab="TSE Index",main="台灣證券交易所發行量加權股價指數") 

plot(tse.ts$logR,xlab="", ylab="Log-Returns",main="發行量加權股價指數日報酬率") 

logR.min<-min(logR)
logR.max<-max(logR)
logR.mean<-mean(logR)
logR.sd<-sd(logR)
hist(logR, prob=T, ylim=c(0, 30))  # prob=T 會令y軸從frequency 變成 density 
lines(density(logR), lty=2, col=2)
density.dat<-density(logR)

max(density(logR)$y)
x <- seq(logR.min, logR.max, length=length(logR))
max(dnorm(x,mean=logR.mean, sd=logR.sd))

# Density (for a continuous distribution) is not probability

dnorm(0,mean=logR.mean, sd=logR.sd)
(1/(sqrt(2*pi)*logR.sd)) * exp((-1/2)*((0-logR.mean)/logR.sd)^2)




plot(density(logR), type="l", xlab="logR", ylab="Density",main="日報酬率機率密度函數與標準常態分配之比較")
lines(x, dnorm(x,mean=logR.mean, sd=logR.sd), lty=2, col=2)
abline(v=logR.mean, lty=3, col=3)
text(x=0.04, y=15, expression(f(x) == frac(1, sqrt(2*pi*sigma^2))  * e^{-frac((x - mu)^2, 2*sigma^2)} ), adj = 0.5)
                            
legend(x=-0.08, y=30, lty=1:3, col=1:3, c("日報酬率機率密度","標準常態分配機率密度","平均日報酬率"))
#x <- seq(from=logR.min, to=logR.max, length=length(logR))
#plot(x, dnorm(x,mean=logR.mean, sd=logR.sd), type="l", ylim=c(0,32), xlab="logR", ylab="Density",main="日報酬率機率密度函數與標準常態分配之比較")
#lines(density(logR), lty=2, col=2)

par(mfrow=c(2,1))
acf(logR,main="ACF of logR")
acf(logR^2,main="ACF of squared logR")
par(mfrow=c(1,1))

install.packages("fGarch")
library(fGarch)
mod1 <- garchFit(~ 1 + garch(1,1), data=logR, trace=FALSE)
summary(mod1); plot(mod1)
# Plot Standardized Residuals
vola <- volatility(mod1)
par(mfrow=c(2,1))
plot(zoo(vola, index(tse.ts)), xlab="", ylab="SD", main="Conditional Standard Deviation")
abline(h=sd(logR), col="green")

##plot(mod1, which=11)
vola <- volatility(mod1)
hatmu <- coef(mod1)["mu"]
lb.JS <- hatmu - 2*vola
ub.JS <- hatmu + 2*vola
x.JS <- c(time(tse.ts))
plot(tse.ts$logR, type="l", xlab="", ylab="Log-Returns",main="logR with 2 conditional SDs Superimposed",ylim =
       range(c(as.numeric(logR), lb.JS, ub.JS)))
lines(zoo(lb.JS, index(tse.ts)), col="red")
lines(zoo(ub.JS, index(tse.ts)), col="red")
#在fGarch的garchFit()函數中加參數cond.dist=“std”，可以把分配改為t分配and many more.
par(mfrow=c(1,1))

par(mfrow=c(2,1))
acf(logR/vola,main="ACF of Standardized logR")
acf((logR/vola)^2,main="ACF of squared Standardized logR")
par(mfrow=c(1,1))


