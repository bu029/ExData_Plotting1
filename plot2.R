#set working directory
setwd("C:/Users/HP-i5/Desktop/peer/ExData_Plotting1")
#read the datset
fulldata <- read.csv("C:/Users/HP-i5/Desktop/peer/ExData_Plotting1/household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
#extact dat from 1/2/2007" to "2/2/2007"
sub_data1 <- subset(fulldata, Date %in% c("1/2/2007","2/2/2007"))
#formatting date
sub_data1$Date <- as.Date(sub_data1$Date, format="%d/%m/%Y")
date_time <- paste(as.Date(sub_data1$Date), sub_data1$Time)
#add a new column dta
sub_data1$datetime <- as.POSIXct(date_time)

## Plotting data 2
with(sub_data1, {
  plot(Global_active_power~datetime, type="l",
       ylab="Global Active Power(kilowatts)", xlab="")
})
##save file to png
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()