## Load ##

#Takes care of loading in all the data required. 
#Typically this is a short file, reading in data from files, URLs and/or ODBC.
#Depending on the project at this point I'll either write out the workspace
#using save() or just keep things in memory for the next step.

## laod in packages (quant)

#install.packages("quantmod")
#install.packages("jsonlite")
#install.packages("Quandl")
#install.packages("ggplot2")
#install.packages("caTools")
#install.packages("data.table")
#install.packages("TTR")
#install.packages("vars")
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
library("vars")

Quandl.api_key("7z5ifJjJ4baqE2u5eyg2")
# set input data

begin_date <- "2003-01-01"
end_date <- "2013-01-01"


# get list of instrument uids
tickers <- c("MXN","JPY","INR","GBP","EUR","CAD","AUD")
tickers

# Retrieve timeseries from instrument uics

# Function to fetch major currency rates
codes <- paste("CUR/",tickers,sep="")

sample_return <- Quandl(codes,start_date="2003-01-01",end_date="2013-06-07", collapse = "weekly" )

str(sample_return)

for(i in 2:length(sample_return)) {
plot(sample_return[,1],sample_return[,2], main = paste(colnames(sample_return)[i]))
  message(i)
  message(
  paste(colnames(sample_return)[i])
)
  }


## clean part
cleaned_sample_return <- na.omit(sample_return)
cleaned_sample_return$DATE <- as.character(cleaned_sample_return$DATE,"%Y-%m-%d")

rownames(cleaned_sample_return) <- cleaned_sample_return$DATE
cleaned_sample_return$DATE <- NULL

cleaned_sample_return_matrix <- as.matrix(cleaned_sample_return)

## assume all data is correct and do return calculation, to stationarise data
stationary_ret_matrix <- diff(cleaned_sample_return_matrix)/
  cleaned_sample_return_matrix[-nrow(cleaned_sample_return_matrix),]

# plot data
for(i in 1:ncol(stationary_ret_matrix)){
  plot(as.Date(row.names(stationary_ret_matrix)),stationary_ret_matrix[,i],
       main = colnames(stationary_ret_matrix)[i])
  message(i)
}

# using 8 weeks back
VARselect(stationary_ret_matrix, lag.max = 8, type = "none")

var2sample <- VAR(stationary_ret_matrix, p = 8, type = "const")

summary(var2sample)
graphics.off()

## figure out how to access sample
plot(var2sample)

# restricted VaR, where coefficent with only significant p-values are keept)
var2c.ser <- restrict(var2sample, method = "ser", thresh = 3)
var2c.ser$restrictions

# next week prediction..... basicly the forecast, but how to keep residuals?)
forecast <- predict(var2c.ser, n.ahead = 1, ci = 0.95)

sapply(temp$model, class)
methods(class = class(temp$model))

methods(class = class(var2c.ser))

str(var2c.ser)

str(
residuals(var2c.ser)
)

str(
  residuals(temp$model)
)

plot(as.vector(residuals(temp$model)))


test <- residuals(temp$model)[,2]
str(test)


str(residuals(temp$model)[,2])

residuals(temp$model) - residuals(var2c.ser)

temp$
methods(class = class(temp))


summary(temp)

str(temp)
temp$model$datamat
attributes(temp)
methods(temp)
class(var2c.ser)
?varest

class(temp)
str(temp)
summary(var2c.ser)

# eventually we want to determine :weights in currency pair now... using residual and optimization

# get errors!




graphics.off()
plot(var2c.ser)
summary(var2c.ser)
B(var2c.ser)
Bcoef(var2c.ser)
help("B-deprecated")
# use restrictions to recalculate var ?

# how to get errors out from forecast...

# do forecast




#mydata <- Quandl("OPEC/ORB", start_date="2003-01-01", end_date = "2013-01-01")
#data <- Quandl("OPEC/ORB", start_date="2003-01-01", end_date = "2013-01-01", 
#               collapse = "daily", type = "raw")

#mydata <- Quandl(tickers, start_date="2003-01-01", end_date = "2013-01-01")
#data <- Quandl("CUR/JPY", start_date="2003-01-01", end_date = "2013-01-01", 
#               collapse = "daily", type = "raw")

data <- as.data.table(data)


## do moving average

plot(data)

## do exponential moving average

plot(data)

L_fast <- 16
L_slow <- 4*L_fast

raw_forecast <- EMA(data,L_fast) - EMA(data,L_slow)
plot(raw_forecast)

## do gg plot of this version... 
xxx 

plot(as.xts(data))
plot(EMA(data,L_fast))
plot(EMA(data,L_slow))

#forecast
plot(EMA(data,4)-EMA(data,128))

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



