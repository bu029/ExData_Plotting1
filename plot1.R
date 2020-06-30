#set working directory
setwd("C:/Users/HP-i5/Desktop/peer/ExData_Plotting1")
#read the dat set
fulldata <- read.csv("C:/Users/HP-i5/Desktop/peer/ExData_Plotting1/household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
#extract data from 1/2/2007" to "2/2/2007"
sub_data1 <- subset(fulldata, Date %in% c("1/2/2007","2/2/2007"))
#formatting date
sub_data1$Date <- as.Date(sub_data1$Date, format="%d/%m/%Y")
#draw a histogram
hist(sub_data1$Global_active_power, main="Global Active Power", 
    ylab="Frequency",  xlab="Global Active Power (kilowatts)", col="Red")
## Save file to png
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()