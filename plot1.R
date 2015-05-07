powercons<-read.table(file="household_power_consumption.txt",sep = ';', header = TRUE,na.strings = '?', colClasses = c(rep("NULL", 2), rep("numeric",7)))
date_time_str <-read.table(file="household_power_consumption.txt",sep = ';', header = TRUE,na.strings = '?', colClasses = c(rep("character", 2), rep("NULL",7)))
date_time <- strptime(paste(date_time_str$Date, date_time_str$Time), '%d/%m/%Y %H:%M:%S')
rm(date_time_str)
powercons <- cbind(date_time, powercons)
powercons <- powercons[which(powercons$date_time>='2007-02-01' & powercons$date_time < '2007-02-03'),]
png(file = "plot1.png", width=480, height = 480)
hist(powercons$Global_active_power, main='Global Active Power',col = 'red', xlab = 'Global Active Power (kilowatts)')
dev.off()