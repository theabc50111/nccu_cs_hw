library(quantmod)
#symbols <- stockSymbols()
#symbols <- symbols[,1]
#symbols[11700:11950]
#symbols[8500:8950]
#symbols

getSymbols("^TWII",from="1980-01-01", to=Sys.Date(), src = "yahoo")
TWII = get("TWII")
dim(TWII)
head(TWII) # earliest data of TSE data can you get from the Yahoo Finance: 1997-07-02
chartSeries(TWII,theme="white")