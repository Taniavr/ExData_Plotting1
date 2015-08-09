##sets working dir 
if(!file.exists("data4")){dir.create("data4")}
setwd("./data4")

##creates temp file to extract data
if(!file.exists("./household_power_consumption.zip")) {
        temp <- tempfile()
        download.file("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
        file <- unzip(temp)
        unlink(temp)
} 

##loads entire data set, specifies classes
household <- read.table(file, header=T, sep=";",
             colClasses = c("character", "character", rep("numeric",7)), na = "?")

##subsets data only dates needed
subset <- household[household$Date %in% c("1/2/2007","2/2/2007") ,]

##str(subset)
##View(subset)

##converts Date/Time classes 
datetime <- strptime(paste(subset$Date, subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

##creates plot1
hist(subset$Global_active_power, xlab="Global Active Power (kilowatts)", 
     ylab="Frequency", col="Red", main="Global Active Power")
png(filename= "plot1.png", width=480, height=480)
dev.off()