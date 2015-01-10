# Unzip the contents of Electric power consumption. Create a Data folder in the working directory and store the household_power_consumption.txt file in it.
# Read the records from household_power_consumption.txt. First line contains the column names. Missing values are encoded as "?".
full_data <- read.table("./Data/household_power_consumption.txt",header=TRUE, sep=";", na.strings = "?", stringsAsFactors=FALSE)

# Create a subset of data for only two dates of February - 1/2/2007 and 2/2/2007 and store it in subData data frame.
subData <- subset(full_data, Date == "1/2/2007" | Date == "2/2/2007")

# Create a new column called DateTime in subData that contains concatenated values from Date and Time columns and set the formatting to "%d/%m/%Y %H:%M:%S"
subData$DateTime <- as.POSIXct(paste(subData$Date, subData$Time), format="%d/%m/%Y %H:%M:%S") 

# PLOT 2
# Check the margins set in the environment and make changes if necessary.
# par("mar")
# par(mar = c(2,2,2,2))

# Use Graphics device for png format and save the plot to plot2.png. plot2.png will be created in the current working directory.
# Set the width and height of the device as 480 as per the project instructions. Note: For exact match, set the height and width to 504. 
# By default the background is white. 
# Set the background to transparent. On the white background(as Coursera's), it will appear white and on github, it will be transparent with a pattern (as seen in the original rdpeng's github repo).
# units = "px" (pixels) is set by default.
png("plot2.png", width=480, height=480, bg = "transparent")

# with is used to evaluate an expression in an environment constructed from "subData" in this case.
# The plot is created for the newly created DateTime column and Global_active_power. 
# Instead of using plot with type = "n", followed by lines function, by setting type = "l", line is plotted. 
# Set label for y axis to "Global Active Power (kilowatts)". Set the label for x axis to "".
with(subData, plot(DateTime, Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = ""))

# Ensure that the device is turned off.
dev.off()
