# Data loading
# Unzip the contents of Electric power consumption. Create a Data folder in the working directory and store the household_power_consumption.txt file in it.
# Read the records from household_power_consumption.txt. First line contains the column names. Missing values are encoded as "?".
full_data <- read.table("./Data/household_power_consumption.txt",header=TRUE, sep=";", na.strings = "?", stringsAsFactors=FALSE)

# Create a subset of data for only two dates of February - 1/2/2007 and 2/2/2007 and store it in subData data frame.
subData <- subset(full_data, Date == "1/2/2007" | Date == "2/2/2007")

# Create a new column called DateTime in subData that contains concatenated values from Date and Time columns and set the formatting to "%d/%m/%Y %H:%M:%S"
subData$DateTime <- as.POSIXct(paste(subData$Date, subData$Time), format="%d/%m/%Y %H:%M:%S") 

# PLOT 3
# Check the margins set in the environment and make changes if necessary.
# par("mar")
# par(mar = c(2,2,2,2))

# Use Graphics device for png format and save the plot to plot3.png. plot3.png will be created in the current working directory.
# Set the width and height of the device as 480 as per the project instructions. Note: For exact match, set the height and width to 504. 
# By default the background is white. 
# Set the background to transparent. On the white background (as Coursera's), it will appear white and on github, it will be transparent with a pattern (as seen in the original rdpeng's github repo).
# units = "px" (pixels) is set by default.
png("plot3.png", width=480, height=480, bg = "transparent")

# with is used to evaluate an expression in an environment constructed from "subData" in this case.
with(subData, {

# Default color is black and by setting type = "l", the first set is plotted for Sub_metering_1.
plot(DateTime, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
# It is followed by lines function for each Sub_metering_2 and Sub_metering_3 in red and blue color respectively.
lines(DateTime, Sub_metering_2, col = "red")
lines(DateTime, Sub_metering_3, col = "blue")
})

# Set appropriate legend properties. The legend will be displayed in the topright corner.
# Sub_metering_1 will appear in black, Sub_metering_2 will appear in red, Sub_metering_3 will appear in blue.
# To show the legend character as line, use lty 1.
legend("topright", lty=1, lwd = 1, col = c("black", "red", "blue"), legend= c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Ensure that the device is turned off.
dev.off()
