#plot 4
#loads entire data set, specifies classes
household <- read.table(file, header=T, sep=";", colClasses = c("character", "character", rep("numeric",7)), na = "?")

##subsets data only dates needed
subset <- household[household$Date %in% c("1/2/2007","2/2/2007") ,]
##converts Date/Time classes 
datetime <- strptime(paste(subset$Date, subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

##creates plot 4
par(mfrow=c(2,2))
with(subset, {
        plot(datetime, subset$Global_active_power,  ylab= "Global Active Powers(kilowatts)", xlab="",type="l")
        plot(datetime, subset$Voltage, ylab="voltage", xlab="datetime", type="l")
        
        plot(datetime, subset$Sub_metering_1, col = "black", type = "l", ylab="Energy sub metering", xlab="")
        lines(datetime, subset$Sub_metering_2, col = "red")
        lines(datetime, subset$Sub_metering_3, col= "blue")
        legend("topright", col = c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, cex = 0.7)
        
        plot(datetime, subset$Global_reactive_power, ylab="Global_reactive_power", xlab="datetime", type="l")
})
png(filename="plot4", width=480, height=480)
dev.off()