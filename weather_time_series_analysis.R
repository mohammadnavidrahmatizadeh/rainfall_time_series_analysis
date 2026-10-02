#data loading

x = c(16.6,1.8,20.2,
      31.6,0.2,0,0,0,0,0,12.5,3.2,18,2.1,10.3,18.8,0,0,0,0,0,0,0,
      68.4,32.8,15.3,0.3,31.1,0,0,0,0,0,0,0,2,9,0,0,0,4.1,0,0,0,0,0,16.4,102.3,21.1
      ,17.4,0,37,0.4,0,0,0,0,0,4.2,31.6,13.8,16.5,43.1,29.6,20.1,9.6,0.8,10,0,0.4,2
      ,18.5,7.1,0.4,0,11.3,0,0,0,0,0,6.5,10.8,3.2,9.8,45.7,16.8,29.6,6,1.1,0,0,1.8,0.1,
      30.7,42.8,14.5,28.9,26.1,22.4,6.7,0,0,41,2,0,3,0.2,11.3,8.2,20.2,6,14,0,0,0,18,0
      ,94.4,0,1.3,38.2,13,55.2,7.1,3,0,0,0,13.4,53.4,54.6,3.1,1.2,29.7,17.5,19,0,0.3,
      0,0,0.1,20.5,0.4,26.3,4.9,67.4,65.5,0.5,3.1,0,3,0,7.4,16.3,1.2,0,9.7,32.8,7.5,21.9
      ,2,12.9,0,0.2,4.6,1.1,10.1)

ts = ts(x,start=c(2002,1),end=c(2015,12),frequency = 12)
library(TSstudio)
library(forecast)

#exploratory data

ts_info(ts) #info about time series
ts_plot(ts) #plot time series
ts_cor(ts) #ACF & PACF
ts_decompose(ts) #trend & seasonal & noise
ts_lags(ts) #lags
ts_ma(ts)
ts_polar(ts)
ts_seasonal(ts)


#predicting

train = window(ts,start=c(2002,1),end=c(2014,12))
test = window(ts,start=c(2015,1),end=c(2015,12))

model = auto.arima(train)
forecast = forecast(model,length(test))

par(mfrow=c(1,2))
plot(forecast,xlab = 'time (year) ',ylab=' rain (mm)')
lines(test,col='red')
plot(ts,col='blue',xlab = 'time (year)',ylab='rain (mm)')


# project end is here

