y<-c(0.49958017, 0.15162735, 0.86757565, 0.3093554, 0.20545085, -0.48288408, 0.6880291,0.8461229, 0.8320223, -0.7372907, 0.6048833, 0.40874475, 0.57708055, 0.27590698,-0.21213382, 0.4236031, 0.3324298, -0.076647766, -0.20372462, 0.93162024, 0.5740154)

# The statistical part of the question is understanding that the in-sample one-step-ahead forecasts of an ARIMA model are actually the fitted values of that model. In R, the method fitted applied on model output object normally returns the fitted values of the model. However, the method is not applicable to the output of function arima. There is a workaround: fitted values equal original values minus residuals. Residuals can be extracted from a fitted object using the method residuals (and that applies to the output of function arima).

par(mfrow=c(1,2))
plot.ts(y)
fit.model <- arima(y, order = c(2, 1, 1))
residuals(fit.model)
lines(y-residuals(fit.model), col=2, lty=2)

#  Better still, use the forecast package which does have a fitted method for outputs from Arima and auto.arima. – Rob Hyndman Feb 26, 2016 at 9:49
library(forecast)
fit.model.2 <- Arima(y, order = c(2, 1, 1))
plot.ts(y)
lines(fitted(fit.model.2), col=2, lty=2)