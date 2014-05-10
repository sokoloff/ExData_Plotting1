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

#Plot 1
png(filename="plot1.png", width=480,height=480, units="px", bg="transparent",type = "cairo")

hist(subsetdata$Global_active_power,col='red',xlab="Global Active Power (kilowatts)", ylab="Frequency", main="Global Active Power")

dev.off()