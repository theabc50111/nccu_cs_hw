# Basic elements
#setwd("/homoe/ywt01/Documents/Rstudio_path")
#getwd()
#save.image("/homoe/ywt01/Documents/Rstudio_path/FTSA.RData")
#load("/homoe/ywt01/Documents/Rstudio_path/FTSA.RData")
#savehistory("/homoe/ywt01/Documents/Rstudio_path/FTSA.Rhistory")
#loadhistory("/homoe/ywt01/Documents/Rstudio_path/FTSA.Rhistory")

# Vector arithmetic
x <- c(1.8, 3.14, 4, 88.169, 13)
length(x)

# The mode of a vector
mode(x)

#Logical vectors
x > 3.5

# Character Vectors
names(x) <- c("a", "b", "c", "d", "e")

# Examples
sys_date <- Sys.Date()
as.integer(sys_date)
sys_date <- Sys.Date()
as.character(sys_date)

sys_time <- Sys.time() 
sys_time
class(sys_time)
as.integer(sys_time)

# Vector Arithmetic
## scalars 2 and 3 are recycled to the length of x.
2 * x + 3

##x is multiplied element-wise by the vector 5:1 (the integers from 5 through 1,) and then the vector 1:5 is added element-wise.
(5:1) * x + (1:5) # or 5:1 * x + 1:5

# application of mathematical functions.
log(x, base=10)

# Subsetting vectors

## Extract elements by their index:
x[c(1, 4)]

## Exclude elements with negative index: 
x[-c(2, 3, 5)]

# Patterned vectors
ones <- rep(1, 10)
rep(c(2,5), c(3,2)) # repeat 2 for 3 times, repeat 5 for 2 times
trend <- 1981:2005
even <- seq(from = 2, to = 20, by = 2)
seq(from = 2, to = 20, length = 5)
c(ones, even)

# More on Subsetting

##by numeric indices
x[3:5]

## character subsetting can be used if there is a names attribute: 
x[c("c", "d", "e")]

#$ Logical subsetting: Selects elements corresponding to TRUE: 
x[x > 3.5]

# Lists
mylist <- list(sample = rnorm(5), family = "normal distribution", 	parameters = list(mean = 0, sd = 1))
mylist

mylist[[1]]
mylist[["sample"]]
mylist$sample
mylist[[3]]$sd

## What’s the difference? 
mylist <- list(sample = c(1,2,3,4,5))
class(mylist[["sample"]]) 
class(mylist["sample"])
length(mylist[["sample"]])
length(mylist["sample"])

# Logical comparisons
x <- c(1.8, 3.14, 4, 88.169, 13)
y <- (x > 3 & x <= 4)
# What happens?
x[y]
which(x > 3 & x <= 4)

all(x > 3)
any(x > 3)

7 + TRUE

all.equal(1.9 - 0.9, 1)
identical(1.9 - 0.9, 1)

# Data Input & Plotting
tse<-read.table("~/workspace/nccu_cs_hw/FinancialTimeSeriesAnalysis_HW/FTSA_example/L1_example/tse.prn", header=T)
tse<-read.table(file.choose(), header=T)
dim(tse)
class(tse)
colnames(tse)
rownames(tse)

## Now, try plotting the index data
plot.ts(tse[1:50, "JS"])
plot.ts(tse[, "JS"])
plot.ts(tse$JS)
plot.ts(tse["JS"])
plot.ts(tse[["JS"]])


## Check data by typing, 
tse [1:5,] #for the first 5 records, 
## or alternatively
head(tse) # the first 6 records
tail(tse) # the last 6 records

## How to get rid of the missing values “NA”?
tse.dat<-na.omit(tse)
tse.dat1<-na.exclude(tse)

# Regularly-Spaced Time Series
ts(rnorm(24), start=2012) # annual data , a time-serires from 2012~2035
ts(rnorm(24), start=c(2012,2), frequency=4) # quarterly data , a time-serires from 2012~2018
ts(rnorm(24), start=c(2012,3), frequency=12) # monthly data , a time-serires from 2012~2014

# Date Examples
my.date <- as.Date("1970/1/1")
my.date
class(my.date)
as.numeric(my.date)
my.date + 10
as.numeric(my.date + 10)
myDates = c("2013-12-19", "2003-12-20")
as.Date(myDates)

## Use the format argument to specify the input format of the date if it is not in the default format

as.Date("1970/1/1"); as.Date("1970-1-1")
as.Date("1970.1.1", format="%Y.%m.%d") 
as.Date("1/1/1970", format="%m/%d/%Y") 
as.Date("January 1, 1970", format="%B %d, %Y")
as.Date("01JAN70", format="%d%b%y")
as.Date(as.character(tse$DATE[1:5]), format="%Y%m%d")

# When as.Date doesn’t Work
as.Date("January 1, 1970", format="%B %d, %Y") 
## and 
as.Date("01JAN70", format="%d%b%y") 
##both produce “NA” why?
Sys.getlocale("LC_TIME")
## Windows 
Sys.setlocale(category = "LC_ALL", locale = "English")
## Mac iOS
Sys.setlocale(category = "LC_ALL", locale = "en_US")

as.Date("2020/09/17")
weekdays(as.Date("2020/09/17")) 

as.Date("01JAN70", format="%d%b%y")  

# Extracting Information from Date objects
my.date<-as.Date("1970-01-01")
myYear <- format(my.date, "%Y")
as.numeric(myYear); as.character(myYear)

# Covert dataframe to timeseries object
install.packages("zoo") # if not intsalled yet
library(zoo) # load the package

tse.ts<-zoo(tse[,-1],as.Date(as.character(tse[,"DATE"]), "%Y%m%d"))
plot(tse.ts[, "JS"])

# Get All Friday Data 
Sys.getlocale("LC_TIME", "English")
tse<-read.table("c:/temp/tse.prn", header=T) 
x<-as.Date(as.character(tse$DATE),"%Y%m%d")
WD<-weekdays(x) 
library(zoo)
x.ts<-zoo(cbind(tse[,-1],WD), x) 
head(x.ts)
x.ts.Fri<-x.ts[x.ts$WD=="星期五"] # does NOT work!
head(x.ts.Fri); tail(x.ts.Fri)
x.ts.Fri<-x.ts[x.ts$WD=="Friday"]
head(x.ts.Fri); tail(x.ts.Fri)

# Plot Again
library(zoo)
tse.ts<-zoo(tse.dat[,-1], as.Date(as.character(tse.dat[,1]), format="%Y%m%d"))
plot(tse.ts[,"JS"], main="Taiwan Stock Exchange Value-Weighted Index",col="slateblue1",ylab="TSE Index", xlab="",las=0, cex=2)
abline(v=as.numeric(as.Date("1999/09/21")),lty=2)
text(as.numeric(as.Date("1999/09/21")), 4000,"921 Earthquake", col="red")
abline(h=c(min(tse.ts[,"JS"]),max(tse.ts[,"JS"])),lty=3)
text(locator(1), "Historical High", col="red")
text(locator(1), "Historical Low", col="red")

# plot linear model
x <- rnorm(100)
y <- 3-5*x+rnorm(100)
plot(x,y)
lr_model <- lm(y~x)
summary(lr_model)
abline(lr_model, col="red")

# Multiple Plots on the Same Page
par(mfrow=c(2,2), oma=c(1,1,2,1))
plot(tse.ts[,"JS"], ylab="TSE Index")
title("TSE Index")
plot(tse.ts[,"VAL.S"], ylab="TSE Trading Value")
title("Trading Value")
plot(tse.ts[,"VOL.S"], ylab="TSE Trading Volume")
title("Trading Volume")
plot(tse.ts[,"TRA.S"], ylab="TSE # of Transaction")
title("# of Transaction")
mtext(outer=T,"Taiwan Stock Exchange", cex=2)

# The quantmod Package
install.packages ("quantmod") 
# install the package, only required once  (the 1st time)
library(quantmod) # Load the package
getSymbols("2330.TW",from="2016-01-02", to=Sys.Date())
TSMC<-get("2330.TW") #Avoid using numbers to start an object name.
dim(TSMC) # dimension
head(TSMC,3) # Show the first 3 rows
tail(TSMC,3) # Show last 3 rows
colnames(TSMC) #variables

chartSeries(TSMC,theme="white")
chartSeries(TSMC,theme="white")

# CBOE Volatility Index: VIX from FRED
getSymbols("VIXCLS",src="FRED")
VIXCLS2<-window(VIXCLS, start = "2016-02-01", end = Sys.Date())
chartSeries(VIXCLS2,theme="white")

# Japan / U.S. Foreign Exchange Rate from FRED
getSymbols("DEXJPUS",src="FRED")
start(DEXJPUS)
end(DEXJPUS)
chartSeries(DEXJPUS,theme="white")


install.packages("dplyr")
install.packages("magrittr")
library("dplyr")
library("magrittr")
a_f <- function(x){x^2 + 2*x+1}
b_f <- function(y){2*y}
b_f(y=2)
2 %>% b_f() # equal to b_f(y=2)
a_f(b_f(y=2)) # F(G(x=3))
2 %>% b_f() %>% a_f() # equal to a_f(b_f(y=2))






  