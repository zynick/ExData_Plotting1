
# read data
dat <- read.table('household_power_consumption.txt', header=TRUE, sep=';')
datreq <- dat[dat$Date %in% c('1/2/2007', '2/2/2007'), ]

# conver columns
datreq$Global_active_power <- as.numeric(as.character(datreq$Global_active_power))

# plot
hist(datreq$Global_active_power, main='Global Active Power', xlab='Global Active Power (kilowatts)', col='red')

# create png
dev.copy(png, file='plot1.png')
dev.off()
