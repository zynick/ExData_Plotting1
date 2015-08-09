
# read data
dat <- read.table('household_power_consumption.txt', header=TRUE, sep=';')
datreq <- dat[dat$Date %in% c('1/2/2007', '2/2/2007'), ]

# convert columns
datetime <- paste(datreq$Date, datreq$Time)
datreq$DateTime <- strptime(datetime, '%d/%m/%Y %H:%M:%S')
datreq$Global_active_power <- as.numeric(as.character(datreq$Global_active_power))
datreq$Voltage <- as.numeric(as.character(datreq$Voltage))
datreq$Sub_metering_1 <- as.numeric(as.character(datreq$Sub_metering_1))
datreq$Sub_metering_2 <- as.numeric(as.character(datreq$Sub_metering_2))
datreq$Sub_metering_3 <- as.numeric(as.character(datreq$Sub_metering_3))
datreq$Global_reactive_power <- as.numeric(as.character(datreq$Global_reactive_power))

# plot
par(mfrow=c(2,2), lwd=0.8, cex=0.7)
plot(datreq$DateTime, datreq$Global_active_power, type='l', xlab='', ylab='Global Active Power')
plot(datreq$DateTime, datreq$Voltage, type='l', xlab='datetime', ylab='Voltage')
plot(datreq$DateTime, datreq$Sub_metering_1, type='l', xlab='', ylab='Energy sub metering')
lines(datreq$DateTime, datreq$Sub_metering_2, type='l', col='red')
lines(datreq$DateTime, datreq$Sub_metering_3, type='l', col='blue')
legend('topright', cex=0.8, legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), col=c('black', 'red', 'blue'), lty=1, bty='n')
plot(datreq$DateTime, datreq$Global_reactive_power, type='l', xlab='datetime', ylab='Global Reactive Power')

# create png
dev.copy(png, file='plot4.png')
dev.off()
