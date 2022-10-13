### An FX Rate Example

fx<-read.csv(file.choose(),sep=" ", stringsAsFactors =F, strip.white = T, header=F,na.strings="N.A.")
# fx<-read.csv("c:/temp/fx.txt",sep=" ", stringsAsFactors =F, strip.white = T, header=F,na.strings="N.A.")
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
  w <- zoo(z[,-c(1,2,5)], as.POSIXct(paste(z$Date, z$Time,   
                                         sep=" "), format="%d.%m.%Y %H:%M:%S"))
  assign(paste(j, ".ts",sep=""),w, envir = .GlobalEnv)
}

###### Remove data with non-uique indices
for (j in Bank.names) { # Remove data with non-uique indices
  z <- eval(as.symbol(paste(j, ".ts",sep="")))
  dp <- duplicated(index(z)) == 1
  if (sum(dp) > 0) {#先判斷dp裡有沒有TRUE(1)的結果。如果有的話，才利用which找出重複的位置 
    dp <- which(duplicated(index(z)) == 1)
    assign(paste(j, ".ts2",sep=""),z[-dp,], envir    
           = .GlobalEnv)
  } else {#如果沒有重複的話，就把.ts的物件直接完整的拷貝為.ts2的物件
    assign(paste(j, ".ts2",sep=""),z, envir    
           = .GlobalEnv)
  }
}


###### Aggregate a time series
library(xts)
library(highfrequency)
SGOX.10min <- aggregateTS(as.xts(SGOX.ts2), alignBy = "minutes", alignPeriod = 10) # Aggregate tick-by-tick to 10 minutes data
plot(SGOX.10min)


### TFE Example

###### 宣告欄位佔寬跟名稱
fields.widths =c(7,20,6,8,rep(2,4),9,rep(c(9,8),11),rep(8,3))
fields.names =c("FUTR_ID", "NAME", "SETT_YM", "DATE", "DEAK.HR", "DEAK.Min", "DEAK.Sec", "DEAK.Ms", "STRIKE", "PRC", "QTY", "BUY_P1", "BUY_Q1", "BUY_P2", "BUY_Q2", "BUY_P3", "BUY_Q3", "BUY_P4", "BUY_Q4", "BUY_P5", "BUY_Q5", "SEL_P1", "SEL_Q1", "SEL_P2", "SEL_Q2", "SEL_P3", "SEL_Q3", "SEL_P4", "SEL_Q4", "SEL_P5", "SEL_Q5", "DEALQTY", "DEALBUY_N", "DEALSEL_N")

#########  use the read_fwf() function in Hadley Wickham's readr package.
#########  A huge performance improvement is to be expected, compared to
#########  Compared to the equivalent base function read.fwf(), readr functions are around 
#########  10x faster. 

install.packages("readr") # if not installed yet
library(readr)

df<-data.frame(read_fwf(file.choose(), fwf_widths(widths=fields.widths, fields.names)))
#df<-data.frame(read_fwf("c:\\temp\\f9112312.ftm", fwf_widths(widths=fields.widths, fields.names)))

df = df[df$QTY!=0,] # 先刪除掉沒有成交量的紀錄，通常也就不會有成交時間
table(df$SETT_YM) # 每天都有五個不同到期日的契約在交易，但只有一個近月契約 nearby contract交易的最熱絡

df<-df[df$SETT_YM==200301,] 
# 只取近月契約 nearby contract
td.input0 = paste(df$DEAK.HR, ":",df$DEAK.Min, ":", df$DEAK.Sec, ".", df$DEAK.Ms, sep ="")
#利用paste指令把這四個欄位串起來成為R as.POSITct 可以讀得懂得格式8:45:06.91。
# %OS will input seconds including fractional seconds i.e. 當秒後面有小數點秒時使用，
# 否則用 %S即可
td.input = paste(df$DATE, td.input0, sep = " ")
#日期跟時間利用paste串起來，中間置一空格
td.input = as.POSIXct(td.input, format="%Y%m%d %H:%M:%OS")
df.ts = zoo(df[,-c(2, 4:8)], as.POSIXct(td.input, format="%Y%m%d %H:%M:%OS")) 
#-c(2, 4:8)], 不要保留中文契約名跟日期時間的欄位


