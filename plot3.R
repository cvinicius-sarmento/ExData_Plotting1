powercons<-read.table(file="household_power_consumption.txt",sep = ';', header = TRUE,na.strings = '?', colClasses = c(rep("NULL", 2), rep("numeric",7)))
date_time_str <-read.table(file="household_power_consumption.txt",sep = ';', header = TRUE,na.strings = '?', colClasses = c(rep("character", 2), rep("NULL",7)))
date_time <- strptime(paste(date_time_str$Date, date_time_str$Time), '%d/%m/%Y %H:%M:%S')
rm(date_time_str)
powercons <- cbind(date_time, powercons)
powercons <- powercons[which(powercons$date_time>='2007-02-01' & powercons$date_time < '2007-02-03'),]
png(file = "plot3.png", width=480, height = 480)
plot(powercons$Sub_metering_1 ~ powercons$date_time, type = 'n', ylab = 'Energy sub metering',xlab = '')
lines(x=powercons$date_time, y=powercons$Sub_metering_1, type = "l",col = "black")
lines(x=powercons$date_time, y=powercons$Sub_metering_2, type = "l",col = "red")
lines(x=powercons$date_time, y=powercons$Sub_metering_3, type = "l",col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black","red","blue"), lty = c(1, 1, 1))
dev.off()

