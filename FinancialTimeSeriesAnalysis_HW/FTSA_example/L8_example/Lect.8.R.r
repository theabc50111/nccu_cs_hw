# WPI
## Read Data
WPI<-read.table(file.choose(), header=F)
plot.ts(WPI[,1], main="US Wholesale Price Index (1985=100)")
## Transformation & Plots
par(mfrow=c(2,1))
plot.ts(diff(WPI[,1]), main="First Difference of the WPI"); abline(h=0)
plot.ts(diff(log(WPI[,1])), main="Logarithmic Change of the WPI")
abline(h=0)
## acf & pacf
dlnWPI <- diff(log(WPI[,1])); par(mfrow=c(1,3))
acf(dlnWPI, main="ACF for the Logarithmic Change of the WPI")
pacf(dlnWPI, main="PACF for the Logarithmic Change of the WPI")
acf(dlnWPI, main="ACF of dlnWPI",ci.type="ma")
par(mfrow=c(1,1))
## Estimation with arima
Model.1<-arima(dlnWPI, order=c(1,0,0))
Model.2<-arima(dlnWPI, order=c(2,0,0)) 
Model.3<-arima(dlnWPI, order=c(1,0,1)) 
Model.4<-arima(dlnWPI, order=c(1,0,4), transform.pars = FALSE, fix=c(NA, NA, 0, 0, NA, NA)) #AR coefs. -> MA coefs. -> Intercept
Model.5<-arima(dlnWPI, order=c(1,0,2))
### Diagnostics
library(forecast); 
tsdisplay(dlnWPI, plot.type="partial")
tsdiag(Model.4)
plot(Model.4)
checkresiduals(Model.4)

names(Model.1); Model.1$aic; 
AIC(Model.1); -2*Model.1$loglik+2*3 # Same as AIC
BIC(Model.1); -2*Model.1$loglik+log(Model.1$nobs)*3 # Same as BIC
sum(Model.4$resid^2) #SSR
Box.test(Model.4$resid, lag = 12, type="Ljung-Box") 

## Estimation with auto.arima
auto.arima(dlnWPI, d = 0, D = NA, max.p = 10, max.q = 10)
