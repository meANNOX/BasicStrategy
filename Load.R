## Load ##

#Takes care of loading in all the data required. 
#Typically this is a short file, reading in data from files, URLs and/or ODBC.
#Depending on the project at this point I'll either write out the workspace
#using save() or just keep things in memory for the next step.

## laod in packages (quant)

install.packages("quantmod")
install.packages("jsonlite")

library("jsonlite")
library("quantmod")

?getSymbols
getFX("EUR/USD")
EURUSD


<- getSymbols("MSFT")
getFX("EURUSD")


class(EURUSD)

plot(EURUSD)
## load in timeseries (S&P)

## clean: modify the format 

## func: functions, should include a

## do

## perform forecasting for a given time t

## combine forecasting for strategy A and B,
##to give weights 45% and 55% perhaps with induced leveraging



