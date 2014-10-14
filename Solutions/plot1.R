#Reading data for 1/2/2007 and 2/2/2007 only 

data_file <- file("./household_power_consumption.txt",'r')
ip_data <- read.table(text = grep("^?[1,2]/2/2007", readLines(data_file), value=TRUE), sep=';', skip=0)

#Display the required histogram
hist(ip_data[,3], col='red',main="Global Active Power",xlab="Global Active Power (kilowatts)")

#save as png
dev.copy(png, file = "plot1.png")
dev.off()


