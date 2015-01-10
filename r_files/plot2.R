Sys.setlocale("LC_ALL","en_US.utf8")
fileName <- 'household_power_consumption.txt'

dateFormat <- '%d/%m/%Y'
timeFormat <- '%X'
startDate <- strptime('31/1/2007', dateFormat)
endDate <- strptime('3/2/2007', dateFormat) 

m1 <- read.table(fileName, sep = ';', header = TRUE, stringsAsFactors = FALSE)
m1.sub <- subset(m1, strptime(m1$Date, dateFormat) > startDate & strptime(m1$Date, dateFormat) < endDate)
m1.sub$Date_Time <- strptime(mapply(paste, m1.sub$Date, m1.sub$Time), mapply(paste, dateFormat, timeFormat))

png('plot2.png', bg = 'transparent')
plot(x = m1.sub$Date_Time,
     y = as.numeric(m1.sub$Global_active_power),
     xlab = NA,
     ylab = 'Global Active Power (kilowatts)',
     type = 'l'
)

dev.off()