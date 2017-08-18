## Load ##

#Takes care of loading in all the data required. 
#Typically this is a short file, reading in data from files, URLs and/or ODBC.
#Depending on the project at this point I'll either write out the workspace
#using save() or just keep things in memory for the next step.

## laod in packages (quant)

install.packages("quantmod")
install.packages("jsonlite")
install.packages("Quandl")
install.packages("ggplot2")
install.packages("caTools")
install.packages("data.table")
install.packages("TTR")

#   ________________________________________________________
#   Load in data                                            ####
# this is a level 1 section. l1 sections are are high-level 
# blocks.
library("jsonlite")
library("quantmod")
library(Quandl)
library("ggplot2")
library("caTools")
library("data.table")
library("TTR")

Quandl.api_key("7z5ifJjJ4baqE2u5eyg2")
# set input data

begin_date <- "2003-01-01"
end_date <- "2013-01-01"

# get list of instrument uids

# Retrieve timeseries from instrument uics
mydata <- Quandl("OPEC/ORB", start_date="2003-01-01", end_date = "2013-01-01")
data <- Quandl("OPEC/ORB", start_date="2003-01-01", end_date = "2013-01-01", 
               collapse = "daily", type = "raw")

data <- as.data.table(data)


## do moving average

plot(data)


## or alternatively stationize series and do a version of ar

## 

plot(diff(data$Value))

#and do ar process on this, perhaps with longer lags, like -1, -2 ... up to -10.




datahead(data)
tail(data)
describe(data)
summary(data)

class(data)
str(data)
plot(data)



## load in various time series, and etf should have +5 years data, weekly



## do a forecast at a time ## perhaps for all timeseries simultaniously

## just do ewmac signal with running window perhaps.

## load in timeseries (S&P)

## clean: modify the format 

## func: functions, should include a

## do

## perform forecasting for a given time t

## combine forecasting for strategy A and B,
##to give weights 45% and 55% perhaps with induced leveraging



