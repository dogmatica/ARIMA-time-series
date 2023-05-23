# ARIMA-time-series
## Time series forecasting in R using ARIMA on daily revenue observations.

My data set for this time series forecasting exercise includes data on a teleco company’s revenue
measured daily. Data analysis performed on the dataset will be aimed with this research question
in mind: can a time series model be used to forecast future revenue values, and if so, how 
accurately?

Conclusions gleaned from the analysis of this data can benefit stakeholders by revealing information 
and insights on expected revenue increases and decreases over upcoming time periods. My goal 
will be to determine how accurately a time series forecast might be able to predict this data.
A time series can be defined as “a sequence of various data points that occurred in a successive 
orderfor a given period of time” (Pandian, 2023). In my specific case, I have been given a sequence 
of revenue values, measured daily over a period of 731 days.

The one assumption of time series modeling is that the data in the time series is stationary over 
time. Stationarity is one of multiple measures that can be used to evaluate a time series, and for 
the purpose of time series forecasting it is assumed that the point in time at which you begin your 
forecast will not matter statistically. In more common terms, when the time series is visualized it 
should appear as though you can draw a straight horizontal line through the middle,ratherthan a 
diagonal line (indicative of a trending time series) or a wavy line (may be indicative of a seasonal 
time series).

In addition to stationarity, the auto-correlation function of a time series is also critical to time series 
analysis. Analyzing the auto-correlation function plot for a time series can help detect patterns and 
data exhibiting a trend, as well as confirming the lack of randomness in the data. It is a comparison 
of a time series with a “lagged” version of itself, helping to determine any correlation between a 
current data point and previous data points. For a time series that is stationary and non-random, 
we would expect to see an ACF plot’s range narrow significantly when read from left to right, with 
points along the plot displaying positive and negative variance within a shown confidence interval 
(Monigatti, 2022).

![image](https://github.com/dogmatica/arima-time-series/assets/60594771/f6de1089-b338-4f0b-ba18-568e1dddff7b)

![image](https://github.com/dogmatica/arima-time-series/assets/60594771/0db8b27e-696a-4944-a714-1e06fa531811)

![image](https://github.com/dogmatica/arima-time-series/assets/60594771/50436f76-1fe4-4821-8fb0-8ed3b0c6d4b5)
