#Exploratory Data Analysis: Course Project - plot4 R script

#Reading data from the file using read.table, there is more than enough memory for the data.
power_data <- read.table(file = "household_power_consumption.txt", header = TRUE, fill = TRUE, sep = ";", na.strings = "?")

#Converting the date and time columns to their respective data types.
power_data$Date <- as.Date(x = power_data$Date, format = "%d/%m/%Y")
power_data$Time <- strptime(x = power_data$Time, format = "%H:%M:%S")

#This removes the date part from the time values.
power_data$Time <- format(power_data$Time, "%H:%M:%S")

#Subset data only for the dates 2007-02-01 and 2007-02-02.
power_data_subset <- power_data[power_data$Date == as.Date(x = "1/2/2007", format = "%d/%m/%Y") | power_data$Date == as.Date(x = "2/2/2007", format = "%d/%m/%Y"), ]

#For the subset only, we add a new column representing the combined date and time. We will need it for all the plots that we set up here.
power_data_subset$DateAndTime <- paste(power_data_subset$Date, power_data_subset$Time)
power_data_subset$DateAndTime <- strptime(x = power_data_subset$DateAndTime, format = "%Y-%m-%d %H:%M:%S")

#print(head(power_data))
#print(head(power_data_subset))

png(file = "plot4.png", width = 480, height = 480)

#We now create the plots in a 2 by 2 area that we set up using par.
par(mfrow = c(2, 2))

#The first plot will be very similar to the one in plot2 (global active power vs. datetime).
plot(power_data_subset$DateAndTime, power_data_subset$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")

#The second plot is a voltage vs. datetime line graph.
plot(power_data_subset$DateAndTime, power_data_subset$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

#The third plot will be very similar to the one in plot3 (metering types, a line for each in the graph).
plot(power_data_subset$DateAndTime, power_data_subset$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(power_data_subset$DateAndTime, power_data_subset$Sub_metering_2, col = "red")
lines(power_data_subset$DateAndTime, power_data_subset$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c("solid", "solid", "solid"), col = c("black", "red", "blue"), bty = "n")

#The fourth plot is a global reactive power vs. datetime line graph.
plot(power_data_subset$DateAndTime, power_data_subset$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()

