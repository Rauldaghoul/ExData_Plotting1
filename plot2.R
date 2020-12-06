#Exploratory Data Analysis: Course Project - plot2 R script

#Reading data from the file using read.table, there is more than enough memory for the data.
power_data <- read.table(file = "household_power_consumption.txt", header = TRUE, fill = TRUE, sep = ";", na.strings = "?")

#Converting the date and time columns to their respective data types.
power_data$Date <- as.Date(x = power_data$Date, format = "%d/%m/%Y")
power_data$Time <- strptime(x = power_data$Time, format = "%H:%M:%S")

#This removes the date part from the time values.
power_data$Time <- format(power_data$Time, "%H:%M:%S")

#Subset data only for the dates 2007-02-01 and 2007-02-02.
power_data_subset <- power_data[power_data$Date == as.Date(x = "1/2/2007", format = "%d/%m/%Y") | power_data$Date == as.Date(x = "2/2/2007", format = "%d/%m/%Y"), ]

#For the subset only, we add a new column representing the combined date and time. We will need it for this plot.
power_data_subset$DateAndTime <- paste(power_data_subset$Date, power_data_subset$Time)
power_data_subset$DateAndTime <- strptime(x = power_data_subset$DateAndTime, format = "%Y-%m-%d %H:%M:%S")

#print(head(power_data))
#print(head(power_data_subset))

#We now create and save the plot, which in this case is a line graph.
png(file = "plot2.png", width = 480, height = 480)
plot(power_data_subset$DateAndTime, power_data_subset$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()
