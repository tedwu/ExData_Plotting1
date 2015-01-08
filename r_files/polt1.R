fileName <- 'household_power_consumption.txt'

dateFormat <- '%d/%m/%Y'
timeFormat <- '%X'
startDate <- strptime('31/1/2007', dateFormat)
endDate <- strptime('3/2/2007', dateFormat) 

m1 <- read.table(fileName, sep = ';', header = TRUE, stringsAsFactors = FALSE)
m1.sub <- subset(m1, strptime(m1$Date, dateFormat) > startDate & strptime(m1$Date, dateFormat) < endDate)

png('polt1.png')
hist(as.numeric(m1.sub$Global_active_power), xlab = 'Global Active Power (kilowatts)' , ylab = 'Frenqucy', 
        col = 'red', main = 'Global Active Power')

dev.off()