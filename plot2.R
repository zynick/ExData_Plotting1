
# read data
dat <- read.table('household_power_consumption.txt', header=TRUE, sep=';')
datreq <- dat[dat$Date %in% c('1/2/2007', '2/2/2007'), ]

# convert columns
datetime <- paste(datreq$Date, datreq$Time)
datreq$DateTime <- strptime(datetime, '%d/%m/%Y %H:%M:%S')
datreq$Global_active_power <- as.numeric(as.character(datreq$Global_active_power))

# plot
plot(datreq$DateTime, datreq$Global_active_power, type='l', xlab='', ylab='Global Active Power (kilotwatts)')

# create png
dev.copy(png, file='plot2.png')
dev.off()
