# change this to the proper location for yourself
inputFilename <- "~/Documents/Education/Coursera/DataScience/Course4_EDA/Assignment/household_power_consumption.txt"

# change this to the directory where you want to save the plot output files
outputDir <- "~/Documents/Education/Coursera/DataScience/Course4_EDA/Assignment/ExData_Plotting1/"

# load data
df <- read.table(inputFilename, header=TRUE, sep=";", na.strings=c("?"), 
                 colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
df$Date <- strptime(paste(df$Date, df$Time), format="%d/%m/%Y %H:%M:%S") #convert Date column to datetime
df$Time <- NULL # delete the now redunandat Time column as this is encoded in the Date column now
df <- df[df$Date >= "2007-02-01" & df$Date < "2007-02-03", ] # filter to keep only dates 2007-02-10 & 2007-02-02

#create plot
png(paste(outputDir, "plot2.png", sep=""), width=480, height=480)
plot(df$Date, df$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
