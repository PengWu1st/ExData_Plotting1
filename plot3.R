colclass <- c("character","character","double","double","double","double","double","double","numeric")
powercon <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", 
                       na.strings="?",colClasses=colclass)
powercon$datetime <- as.POSIXlt(paste(powercon$Date, powercon$Time),format="%d/%m/%Y %H:%M:%S")
powerconsubset <- subset(powercon, datetime$year==107 & datetime$mon==1 & (datetime$mday==1 | datetime$mday==2) )


plot(x=powerconsubset$datetime,y=powerconsubset$Sub_metering_1,xlab="",ylab="Energy sub metering",type="l")
lines(x=powerconsubset$datetime,y=powerconsubset$Sub_metering_2,col="red")
lines(x=powerconsubset$datetime,y=powerconsubset$Sub_metering_3,col="blue")
legend("topright",bty="l",lwd=2,cex=0.75,col=c("black","red","blue"),c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.copy(png,"plot3.png")
dev.off()
