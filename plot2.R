#reading the dataset without date and time
powercons<-read.table(file="household_power_consumption.txt",sep = ';', header = TRUE,na.strings = '?', colClasses = c(rep("NULL", 2), rep("numeric",7)))
#reading the columns Date and Time as a temporary data frame
date_time_str <-read.table(file="household_power_consumption.txt",sep = ';', header = TRUE,na.strings = '?', colClasses = c(rep("character", 2), rep("NULL",7)))
#converting the 2 columns in 1 column POSIXlt - new temporary data frame
date_time <- strptime(paste(date_time_str$Date, date_time_str$Time), '%d/%m/%Y %H:%M:%S')
#removing temporary date/time  data frame
rm(date_time_str)
#binding the POSIXlt column to the main data frame
powercons <- cbind(date_time, powercons)
#removing temporary data_time data frame
rm(date_time)
#subsetting main data frame to restrict it to the period of 2007-02-01 to 2007-02-02
powercons <- powercons[which(powercons$date_time>='2007-02-01' & powercons$date_time < '2007-02-03'),]

#plotting
png(file = "plot2.png", width=480, height = 480)
plot(powercons$Global_active_power ~ powercons$date_time, type = 'n', ylab = 'Global Active Power (kilowatts)',xlab = '')
lines(x=powercons$date_time, y=powercons$Global_active_power, type = "l")
dev.off()