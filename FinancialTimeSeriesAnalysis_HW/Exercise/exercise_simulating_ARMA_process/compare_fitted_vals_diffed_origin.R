par(mfrow=c(3,2))

ori_time_series <- c(0.49958017, 0.15162735, 0.86757565, 0.3093554, 0.20545085, -0.48288408, 0.6880291,
                     0.8461229, 0.8320223, -0.7372907, 0.6048833, 0.40874475, 0.57708055, 0.27590698,
                     -0.21213382, 0.4236031, 0.3324298, -0.076647766, -0.20372462, 0.93162024, 0.5740154)

for (diff_ord in seq(1:3)) {
  library(forecast)
  fit.model <- Arima(ori_time_series, order = c(2, diff_ord, 1))
  
  fitted_val_r_forecast_arima <- fitted(fit.model)
  plot.ts(ori_time_series, xaxp = c(0, 21, 21), ylim = c(-2,2), ylab="y")
  lines(fitted_val_r_forecast_arima, col=2, lty=2)
  legend(1, -1.1, c("origin", "fitted"), col=c(1, 2), lty=c(1,2), cex=1, ncol=2, y.intersp=0, x.intersp=0, text.width=0.9)
  mtext(paste("Compare \"fitted vals\" and \"original time-series\" for diff order:", diff_ord))


  plot.ts(c(rep(0,diff_ord), diff(ori_time_series, differences=diff_ord)), xaxp = c(0, 21, 21), ylim = c(-3.5,3.5), ylab="y")
  lines(fitted_val_r_forecast_arima, col=2, lty=2)
  legend(1, -2, c("differed origin", "fitted"), col=c(1, 2), lty=c(1,2), cex=1, ncol=2, y.intersp=0, x.intersp=0, text.width=0.9)
  mtext(paste("Compare \"fitted vals\" and \"diffed original time-series\" for diff order:", diff_ord))
}