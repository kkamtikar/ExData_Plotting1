# Unzip the contents of Electric power consumption. Create a Data folder in the working directory and store the household_power_consumption.txt file in it.
# Read the records from household_power_consumption.txt. First line contains the column names. Missing values are encoded as "?".

full_data <- read.table("./Data/household_power_consumption.txt",header=TRUE, sep=";", na.strings = "?", stringsAsFactors=FALSE)

# Create a subset of data for only two dates of February - 1/2/2007 and 2/2/2007 and store it in subData data frame.
subData <- subset(full_data, Date == "1/2/2007" | Date == "2/2/2007")

# Create a new column called DateTime in subData that contains concatenated values from Date and Time columns and set the formatting to "%d/%m/%Y %H:%M:%S"
subData$DateTime <- as.POSIXct(paste(subData$Date, subData$Time), format="%d/%m/%Y %H:%M:%S") 

# PLOT 4
# Check the margins set in the environment and make changes if necessary.
# par("mar")
# par(mar = c(2,2,2,2))

# Use Graphics device for png format and save the plot to plot4.png. plot4.png will be created in the current working directory.
# Set the width and height of the device as 480 as per the project instructions. Note: For exact match, set the height and width to 504. 
# By default the background is white. 
# Set the background to transparent. On the white background (as Coursera's), it will appear white and on github, it will be transparent with a pattern (as seen in the original rdpeng's github repo).
# units = "px" (pixels) is set by default.
png("plot4.png", width=480, height=480, bg = "transparent")

# As mfrow is being set, the graphs will be plotted row-wise.
par(mfrow=c(2,2))
with(subData, {

# Plot 1 - First row left (first) column  
plot(DateTime, Global_active_power, xlab = "", ylab = "Global Active Power", type = "l")

# Plot 2 - First row right (second) column
plot(DateTime, Voltage, xlab = "datetime", ylab = "Voltage", type = "l")

# Plot 3 - Second row left (first) column
plot(DateTime, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(DateTime, Sub_metering_2, col = "red")
lines(DateTime, Sub_metering_3, col = "blue")

# Set appropriate legend properties. The legend will be displayed in the topright corner.
# Sub_metering_1 will appear in black, Sub_metering_2 will appear in red, Sub_metering_3 will appear in blue.
# To show the legend character as line, use lty 1. Setting bty = "n" will remove the legend boundary and cex will set the scale.
legend("topright", lty=1, lwd = 1, col = c("black", "red", "blue"), legend= c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n", cex=0.95)

# Plot 4 - Second row right (second) column
plot(DateTime, Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", type= "l")

})

# Ensure that the device is turned off.
dev.off()
