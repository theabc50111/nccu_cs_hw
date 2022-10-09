library(zoo)

tse = read.table("~/workspace/nccu_cs_hw/FinancialTimeSeriesAnalysis_HW/FTSA_example/L1_example/tse.prn", header=T)
tse_na_pre = na.omit(tse)
date = as.Date(as.character(tse_na_pre[,"DATE"]), "%Y%m%d")
WD = weekdays(date)
length(WD); dim(tse_na_pre)
tse_new = zoo(cbind(tse_na_pre, WD), date)
tse_mon = tse_new[tse_new$"WD"=="Monday"]
tse_tue = tse_new[tse_new$"WD"=="Tuesday"]
tse_wed = tse_new[tse_new$"WD"=="Wednesday"]
tse_thu = tse_new[tse_new$"WD"=="Thursday"]
tse_fri = tse_new[tse_new$"WD"=="Friday"]
head(tse_mon);head(tse_tue);head(tse_wed);head(tse_thu);head(tse_fri)