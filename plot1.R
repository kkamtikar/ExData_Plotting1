# Unzip the contents of Electric power consumption. Create a Data folder in the working directory and store the household_power_consumption.txt file in it.
# Read the records from household_power_consumption.txt. First line contains the column names. Missing values are encoded as "?".
full_data <- read.table("./Data/household_power_consumption.txt",header=TRUE, sep=";", na.strings = "?", stringsAsFactors=FALSE)

# Create a subset of data for only two dates of February - 1/2/2007 and 2/2/2007 and store it in subData data frame.
subData <- subset(full_data, Date == "1/2/2007" | Date == "2/2/2007")


# PLOT 1
# Check the margins set in the environment and make changes if necessary.
# par("mar")
# par(mar = c(2,2,2,2))

# Use Graphics device for png format and save the plot to plot1.png. plot1.png will be created in the current working directory.
# Set the width and height of the device as 480 as per the project instructions. Note: For exact match, set the height and width to 504. 
# By default the background is white. 
# Set the background to transparent. On the white background (as Coursera's), it will appear white and on github, it will be transparent with a pattern (as seen in the original rdpeng's github repo).
# units = "px" (pixels) is set by default.
png("plot1.png", width=480, height=480, bg = "transparent")

# Use the hist function to compute a histogram for Global Active Power as x axis and frequency will be set as the y axis.
# y axis label is automatically set as Frequency, however set the x axis and Main label.
hist(subData$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

# Ensure that the device is turned off.
dev.off()