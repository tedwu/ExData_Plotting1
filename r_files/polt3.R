Sys.setlocale("LC_ALL","en_US.utf8")
fileName <- 'household_power_consumption.txt'

dateFormat <- '%d/%m/%Y'
timeFormat <- '%X'
startDate <- strptime('31/1/2007', dateFormat)
endDate <- strptime('3/2/2007', dateFormat) 

m1 <- read.table(fileName, sep = ';', header = TRUE, stringsAsFactors = FALSE)
m1.sub <- subset(m1, strptime(m1$Date, dateFormat) > startDate & strptime(m1$Date, dateFormat) < endDate)
m1.sub$Date_Time <- strptime(mapply(paste, m1.sub$Date, m1.sub$Time), mapply(paste, dateFormat, timeFormat))

png('polt3.png', bg = 'transparent')
plot(x = m1.sub$Date_Time,
     y = m1.sub$Sub_metering_1,
     xlab = NA,
     ylab = 'Energy sub metering',
     type = 'l'
)
lines(x = m1.sub$Date_Time, y = m1.sub$Sub_metering_2 , col= 'red')
lines(x = m1.sub$Date_Time, y = m1.sub$Sub_metering_3 , col= 'blue')
legend('topright', lty = 1, col = c('black', 'red', 'blue'),
       legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3') 
)

dev.off()