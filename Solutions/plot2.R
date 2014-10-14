#Reading data for 1/2/2007 and 2/2/2007 only 

data_file <- file("./household_power_consumption.txt",'r')
ip_data <- read.table(text = grep("^?[1,2]/2/2007", readLines(data_file), value=TRUE), sep=';', skip=0)

#include new column with date and time appended
ip_data$NewDate <- as.POSIXct(paste(ip_data[,1], ip_data[,2]), format = "%d/%m/%Y %T")


plot(ip_data$NewDate,ip_data[,3], type = "l", ylab="Global Active Power (kilowatts)", xlab=" ")

#save as png
dev.copy(png, file = "plot2.png")
dev.off()
