#Exploratory Data Analysis: Course Project - plot1 R script

#Reading data from the file using read.table, there is more than enough memory for the data.
power_data <- read.table(file = "household_power_consumption.txt", header = TRUE, fill = TRUE, sep = ";", na.strings = "?")

#Converting the date and time columns to their respective data types.
power_data$Date <- as.Date(x = power_data$Date, format = "%d/%m/%Y")
power_data$Time <- strptime(x = power_data$Time, format = "%H:%M:%S")

#This removes the date part from the time values.
power_data$Time <- format(power_data$Time, "%H:%M:%S")

#Subset data only for the dates 2007-02-01 and 2007-02-02.
power_data_subset <- power_data[power_data$Date == as.Date(x = "1/2/2007", format = "%d/%m/%Y") | power_data$Date == as.Date(x = "2/2/2007", format = "%d/%m/%Y"), ]

#print(head(power_data))
#print(head(power_data_subset))

#We now create and save the plot, which in this case is a histogram.
png(file = "plot1.png", width = 480, height = 480)
hist(power_data_subset$Global_active_power, main = "Global Active Power", col = "red", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
dev.off()
