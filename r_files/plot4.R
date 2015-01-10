Sys.setlocale("LC_ALL","en_US.utf8")
fileName <- 'household_power_consumption.txt'

dateFormat <- '%d/%m/%Y'
timeFormat <- '%X'
startDate <- strptime('31/1/2007', dateFormat)
endDate <- strptime('3/2/2007', dateFormat) 

m1 <- read.table(fileName, sep = ';', header = TRUE, stringsAsFactors = FALSE)
m1.sub <- subset(m1, strptime(m1$Date, dateFormat) > startDate & strptime(m1$Date, dateFormat) < endDate)
m1.sub$Date_Time <- strptime(mapply(paste, m1.sub$Date, m1.sub$Time), mapply(paste, dateFormat, timeFormat))

png('plot4.png', bg = 'transparent')

#make a 2 * 2 filed to draw plot that fill col first
par(mfcol = c(2, 2))

#Top left plot
plot(x = m1.sub$Date_Time,
     y = as.numeric(m1.sub$Global_active_power),
     xlab = NA,
     ylab = 'Global Active Power (kilowatts)',
     type = 'l'
)

#Bottom left plot
plot(x = m1.sub$Date_Time,
     y = m1.sub$Sub_metering_1,
     xlab = NA,
     ylab = 'Energy sub metering',
     type = 'l'
)
lines(x = m1.sub$Date_Time, y = m1.sub$Sub_metering_2 , col= 'red')
lines(x = m1.sub$Date_Time, y = m1.sub$Sub_metering_3 , col= 'blue')
legend('topright', lty = 1, bty = 'n',
       col = c('black', 'red', 'blue'),
       legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3') 
)

#Top right plot
plot(x = m1.sub$Date_Time,
     y = as.numeric(m1.sub$Voltage),
     xlab = "datetime",
     ylab = 'Voltage',
     type = 'l'
)

#Bottom right plot
plot(x = m1.sub$Date_Time,
     y = as.numeric(m1.sub$Global_reactive_power),
     xlab = "datetime",
     ylab = 'Global_reactive_power',
     type = 'l'
)

dev.off()