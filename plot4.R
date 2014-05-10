#Read dataset with proper column data types
data <- read.csv("household_power_consumption.txt", header=TRUE,sep=";", colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric" ), na.strings = "?")

#Concatenate date and time and set new DateTime column
datetime <- paste(data$Date,data$Time)
data$DateTime <- strptime(datetime, format='%d/%m/%Y %H:%M:%S')
#Convert Date column to Date datatype
dates <- as.Date(data$Date, "%d/%m/%Y")
data$Date <- dates

#Subset only 2007-02-01 to 2007-02-02 
subsetdata <- subset(data, Date >= as.Date('2007-02-01') & Date <= as.Date('2007-02-02'))

#Plot 4
png(filename="plot4.png", width=480,height=480, units="px", bg="transparent",type = "cairo")

par(mfrow=c(2,2),mar=c(5,4,4,2), oma=c(0,0,0,0),cex=0.8)

#4.1
plot(subsetdata$DateTime, subsetdata$Global_active_power, type="l",xlab="",ylab="Global Active Power", main="")
#4.2
plot(subsetdata$DateTime, subsetdata$Voltage, type="l", ylab="Voltage", xlab="datetime")
#4.3
plot(subsetdata$DateTime, subsetdata$Sub_metering_1, type="l",col="black", ylab="Energy sub metering", xlab="")
points(subsetdata$DateTime, subsetdata$Sub_metering_2,type="l", col="red")
points(subsetdata$DateTime, subsetdata$Sub_metering_3,type="l", col="blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1, bty="n")
#4.4
plot(subsetdata$DateTime,subsetdata$Global_reactive_power, type="l", ylab="Global_reactive_power",xlab="datetime")

dev.off()