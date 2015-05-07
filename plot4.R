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
png(file = "plot4.png", width=480, height = 480)

par(mfrow=c(2,2))
with(powercons, {

  #(1,1) graph 1
  plot(Global_active_power ~ date_time, type = 'n', ylab = 'Global Active Power',xlab = '')
  lines(x=date_time, y=Global_active_power, type = "l")
  
  #(2,1) graph 2
  plot(Voltage ~ date_time, type="n", xlab = 'datetime')
  lines(Voltage ~ date_time)
  
  #(1,2) graph 3
  plot(Sub_metering_1 ~ date_time, type = 'n', ylab = 'Energy sub metering',xlab = '')
  lines(x=date_time, y=Sub_metering_1, type = "l",col = "black")
  lines(x=date_time, y=Sub_metering_2, type = "l",col = "red")
  lines(x=date_time, y=Sub_metering_3, type = "l",col = "blue")
  legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black","red","blue"), lty = c(1, 1, 1))
  
  #(2,2) graph 4
  plot(Global_reactive_power ~ date_time, type="n", xlab = 'datetime')
  lines(Global_reactive_power ~ date_time)
  
  
})

dev.off()

