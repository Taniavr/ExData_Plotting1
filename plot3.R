##plot3
#loads entire data set, specifies classes
household <- read.table(file, header=T, sep=";", colClasses = c("character", "character", rep("numeric",7)), na = "?")

##subsets data only dates needed
subset <- household[household$Date %in% c("1/2/2007","2/2/2007") ,]
##converts Date/Time classes 
datetime <- strptime(paste(subset$Date, subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

##creates plot 3
plot(datetime, subset$Sub_metering_1, col = "black", type = "l", ylab="Energy sub metering", xlab="")
lines(datetime, subset$Sub_metering_2, col = "red")
lines(datetime, subset$Sub_metering_3, col= "blue")
legend("topright", col = c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, )
       
png(filename= "plot3.png", width=500, height=500)
dev.off()
