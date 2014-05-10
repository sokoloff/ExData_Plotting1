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

#Plot 3
png(filename="plot3.png", width=480,height=480, units="px", bg="transparent",type = "cairo")

plot(subsetdata$DateTime, subsetdata$Sub_metering_1, type="l",col="black", ylab="Energy sub metering", xlab="")
points(subsetdata$DateTime, subsetdata$Sub_metering_2,type="l", col="red")
points(subsetdata$DateTime, subsetdata$Sub_metering_3,type="l", col="blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1)

dev.off()