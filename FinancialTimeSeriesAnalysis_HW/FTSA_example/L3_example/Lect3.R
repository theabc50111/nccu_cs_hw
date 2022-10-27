### An FX Rate Example

# fx<-read.csv(file.choose(),sep=" ", stringsAsFactors =F, strip.white = T, header=F,na.strings="N.A.")
fx<-read.csv("~/workspace/nccu_cs_hw/FinancialTimeSeriesAnalysis_HW/FTSA_example/L3_example/fx.txt",sep=" ", stringsAsFactors =F, strip.white = T, header=F,na.strings="N.A.")
names(fx)<-c("Date","Time", "Bid", "Ask", "Bank")
Bank.names<-unique(fx$Bank)
table(fx[,"Bank"])
sort(table(fx[,"Bank"]))
sort(table(fx[,"Bank"]), decreasing =T)

###### separate all institutions
for (i in Bank.names) { #separate all institutions
  assign(i,fx[fx$Bank == i,], envir = .GlobalEnv)
} 

td <- as.POSIXct(paste(fx$Date, fx$Time, sep=" "), format="%m.%d.%Y %H:%M:%S") # Date and Time
library(zoo)
for (j in Bank.names) { # Conversion to zoo objects
  z <- eval(as.symbol(j)) # Make R recognize a character name as an existing variable 
  w <- zoo(z[,-c(1,2,5)], as.POSIXct(paste(z$Date, z$Time, sep=" "), format="%d.%m.%Y %H:%M:%S"))  # only take bid & ask 
  assign(paste(j, ".ts",sep=""), w, envir = .GlobalEnv)
}

###### Remove data with non-uique indices
for (j in Bank.names) { # Remove data with non-uique indices
  z <- eval(as.symbol(paste(j, ".ts",sep="")))
  dp <- duplicated(index(z)) == 1
  if (sum(dp) > 0) {#???P?_dp?̦??S??TRUE(1)?????G?C?p?G?????ܡA?~?Q??which???X???ƪ????m 
    dp <- which(duplicated(index(z)) == 1)
    assign(paste(j, ".ts2",sep=""),z[-dp,], envir = .GlobalEnv)
  } else {#?p?G?S?????ƪ??ܡA?N??.ts?????󪽱????㪺??????.ts2??????
    assign(paste(j, ".ts2",sep=""),z, envir = .GlobalEnv)
  }
}


###### Aggregate a time series
install.packages("xts")
install.packages("highfrequency")
library(xts)
library(highfrequency)
head(SGOX.ts2)
SGOX.10min <- aggregateTS(as.xts(SGOX.ts2), alignBy = "minutes", alignPeriod = 10) # Aggregate tick-by-tick to 10 minutes data
head(SGOX.10min)
plot(SGOX.10min)


### TFE Example

# install.packages("readr") # if not installed yet
library(readr)
library(zoo)

###### ?ŧi???????e???W??
fitx_fields.widths =c(7,26,6,8,rep(2,4),9,rep(c(9,8),11),rep(8,3)) # width need to be adjust by encoding
fimtx_fields.widths =c(7,26,6,8,rep(2,4),9,rep(c(9,8),11),rep(8,3)) # width need to be adjust by encoding
fite_fields.widths =c(7,28,6,8,rep(2,4),9,rep(c(9,8),11),rep(8,3)) # width need to be adjust by encoding
fitf_fields.widths =c(7,28,6,8,rep(2,4),9,rep(c(9,8),11),rep(8,3)) # width need to be adjust by encoding
fields.names =c("FUTR_ID", "NAME", "SETT_YM", "DATE", "DEAK.HR", "DEAK.Min", "DEAK.Sec", "DEAK.Ms", "STRIKE", "PRC", "QTY", "BUY_P1", "BUY_Q1", "BUY_P2", "BUY_Q2", "BUY_P3", "BUY_Q3", "BUY_P4", "BUY_Q4", "BUY_P5", "BUY_Q5", "SEL_P1", "SEL_Q1", "SEL_P2", "SEL_Q2", "SEL_P3", "SEL_Q3", "SEL_P4", "SEL_Q4", "SEL_P5", "SEL_Q5", "DEALQTY", "DEALBUY_N", "DEALSEL_N")

#########  use the read_fwf() function in Hadley Wickham's readr package.
#########  A huge performance improvement is to be expected, compared to
#########  Compared to the equivalent base function read.fwf(), readr functions are around 
#########  10x faster. 

# df<-data.frame(read_fwf(file.choose(), fwf_widths(widths=fields.widths, fields.names)))
df_fitx<-data.frame(read_fwf("~/workspace/nccu_cs_hw/FinancialTimeSeriesAnalysis_HW/FTSA_example/L3_example/f9112312_fitx_utf8.ftm", fwf_widths(widths=fitx_fields.widths, fields.names)))
View(df_fitx)
df_fimtx<-data.frame(read_fwf("~/workspace/nccu_cs_hw/FinancialTimeSeriesAnalysis_HW/FTSA_example/L3_example/f9112312_fimtx_utf8.ftm", fwf_widths(widths=fimtx_fields.widths, fields.names)))
View(df_fimtx)
df_fite<-data.frame(read_fwf("~/workspace/nccu_cs_hw/FinancialTimeSeriesAnalysis_HW/FTSA_example/L3_example/f9112312_fite_utf8.ftm", fwf_widths(widths=fite_fields.widths, fields.names)))
View(df_fite)
df_fitf<-data.frame(read_fwf("~/workspace/nccu_cs_hw/FinancialTimeSeriesAnalysis_HW/FTSA_example/L3_example/f9112312_fitf_utf8.ftm", fwf_widths(widths=fitf_fields.widths, fields.names)))
View(df_fitf)


df_fitx = df_fitx[df_fitx$QTY!=0,] # ???R?????S???????q???????A?q?`?]?N???|???????ɶ?
table(df_fitx$SETT_YM) # ?C?ѳ??????Ӥ??P???��骺?????b?????A???u???@?Ӫ??뫴?? nearby contract???????̼???

df<-df_fitx[df$_fitx[df_fitxT_YM==200301,] 
# ? ??Only retriver"by contract
td."input0 = paste(df$DEA_fitx$DEAK.HR, ":",df_fitx$DEAK.Min, ":", df_fitx$DEAK.Sec, ".", df_fitxK.Ms, sep ="")
#?Q?head(td.input0)
?paste???O???o?|?????????_?Ӧ???R as.POSITct ?i?HŪ?o��?o?榡8:45:06.91?C
# %OS will input seconds including fractional seconds i.e. ?????᭱???p???I???ɨϥΡA
# ?_?h?? %S?Y?i
td.input = paste(df$DATE, t_fitxd.input0, sep = " ")
#???��??head(td.input)
ɶ??Q??paste???_?ӡA?????m?@?Ů?
td.input = as.POSIXct(td.input, format="%Y%m%d %H:%M:%OS")
df.ts = zoo(df_fitx[,-c(2, 4:8)_fitx[,-c(2, 4:8)], as.POSIXct(td.input, format="%Y%m%d %H:%M:%OS"))
head(df_fitx.ts)
, ???n?O?d???嫴???W?????��ɶ???????


