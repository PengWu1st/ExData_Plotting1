colclass <- c("character","character","double","double","double","double","double","double","numeric")
powercon <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", 
                       na.strings="?",colClasses=colclass)
powercon$datetime <- as.POSIXlt(paste(powercon$Date, powercon$Time),format="%d/%m/%Y %H:%M:%S")
powerconsubset <- subset(powercon, datetime$year==107 & datetime$mon==1 & (datetime$mday==1 | datetime$mday==2) )

hist(powerconsubset$Global_active_power,xlab = "Global Acitive Power (kilowatts)", col = "red", main = "Global Active Power")
dev.copy(png,"plot1.png")
dev.off()

