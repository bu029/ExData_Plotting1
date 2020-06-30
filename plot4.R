#set working directory
setwd("C:/Users/HP-i5/Desktop/peer/ExData_Plotting1")
#reading the data set
fulldata <- read.csv("C:/Users/HP-i5/Desktop/peer/ExData_Plotting1/household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
#extract data from 1/2/2007" to "2/2/2007"
sub_data1 <- subset(fulldata, Date %in% c("1/2/2007","2/2/2007"))
#formatting date
sub_data1$Date <- as.Date(sub_data1$Date, format="%d/%m/%Y")

date_time <- paste(as.Date(sub_data1$Date), sub_data1$Time)
sub_data1$datetime <- as.POSIXct(date_time)
#make four plots together using mfrow
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
#plotting four plots
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(sub_data1, {
  plot(Global_active_power~datetime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  plot(Voltage~datetime, type="l", 
       ylab="Voltage (volt)", xlab="")
  plot(Sub_metering_1~datetime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~datetime,col='Red')
  lines(Sub_metering_3~datetime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("sub_metering_1", "sub_metering_2", "sub_metering_3"))
  plot(Global_reactive_power~datetime, type="l", 
       ylab="Global Rective Power (kilowatts)",xlab="")
})
## Save file to png
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()