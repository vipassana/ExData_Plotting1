#Reading data for 1/2/2007 and 2/2/2007 only 

data_file <- file("./household_power_consumption.txt",'r')
ip_data <- read.table(text = grep("^?[1,2]/2/2007", readLines(data_file), value=TRUE), sep=';', skip=0)

#include new column with date and time appended
ip_data$NewDate <- as.POSIXct(paste(ip_data[,1], ip_data[,2]), format = "%d/%m/%Y %T")

#Split plot into 4 section
par(mfrow=c(2,2))

#Plot the Global Active power against time
plot(ip_data$NewDate,ip_data[,3], type = "l", ylab="Global Active Power (kilowatts)", xlab=" ")

#Plot the Voltage against time
plot(ip_data$NewDate,ip_data[,5], type = "l", ylab="Voltage", xlab="datetime")


#Plotting and then annotating
plot(ip_data$NewDate,ip_data[,7], type = "l", ylab="Energy sub metering", xlab=" ")
lines(ip_data$NewDate,ip_data[,8], col="red")
lines(ip_data$NewDate,ip_data[,9], col="blue")

#Including Legend
legend("topright", col = c("black", "red", "blue"), cex = 0.3, lty = 1,bty = "n", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#Plot the Global Reactive Power against time
plot(ip_data$NewDate,ip_data[,4], type = "l", ylab="Voltage", xlab="datetime")

#save as png
dev.copy(png, file = "plot4.png")
dev.off()


