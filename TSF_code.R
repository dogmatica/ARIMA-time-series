# set working directory
setwd('D:/Logos/Dev/Rdata/d213t1scratch')

# import libraries
library(tseries)
library(forecast)
library(readr)
library(ggplot2)
library(zoo)

# import dataset
teleco_time_series_ <- read_csv("teleco_time_series .csv")

View(teleco_time_series_)

# checking for null values
sum(is.na(teleco_time_series_))

# convert to a time series
teleco_ts <- ts(teleco_time_series_$Revenue)

# plot visualization (part C1)
plot(teleco_ts, ylab = "Revenue", xlab = "Days")

# automatic detection of outliers
teleco_ts_out = tsoutliers(teleco_ts)
teleco_ts_out

# checking time step formatting
time(teleco_ts)

# differencing the time series
teleco_ts_diff <- diff(teleco_ts)
autoplot(teleco_ts_diff)

# Augmented Dickey-Fuller test for stationarity
adf.test(teleco_ts_diff)

# auto correlation function
ggAcf(teleco_ts_diff) + ggtitle("teleco_ts auto correlation function")

# spectral density plot
spectrum(teleco_ts_diff)

# Time Series Decomp using mstl()
teleco_comp <- mstl(teleco_ts_diff)
autoplot(teleco_comp)

# check for seasonality using ets()
ets(teleco_ts_diff)

# train set and test set split
teleco_ts_train <- window(teleco_ts_diff,start=2,end=585)
teleco_ts_test <- window(teleco_ts_diff,start=586,end=731)

# Export train and test sets to csv
write.csv(teleco_ts_train, file="train.csv")
write.csv(teleco_ts_test, file="test.csv")

# create arima model
teleco_model <- auto.arima(teleco_ts_train)
teleco_model

# create and plot forecast
forecast <- forecast(teleco_model, h = 146)
autoplot(forecast)

# plot forecast with test data overlay
autoplot(forecast) +
  geom_line(
    aes(
      x = as.numeric(time(teleco_ts_test)),
      y = as.numeric(teleco_ts_test)
    ),
    col = "red"
  )

# model statistics
summary(teleco_model)

# fit arima model to test set
test_model <- arima(teleco_ts_test, order = c(1,0,0))
summary(test_model)
