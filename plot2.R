library(lubridate)
## read titles of colums
titles<-read.table(
        file="household_power_consumption.txt",
        header=T,
        sep=";",
        na.strings="?",
        nrows=1
        )
columnames<-c(names(titles))
##read the data required
consumtion<-read.table(
        file="household_power_consumption.txt",
        header=T,
        sep=";",
        na.strings="?",
        nrows=2880,
        skip=66636
        )
##add colums names
names(consumtion)<-columnames
##merge date and time, then the format
datetime<-paste(
        consumtion$Date,
        consumtion$Time
        )
datetime<-dmy_hms(datetime)

plot(
        datetime,
        consumtion$Global_active_power,
        type="l",
        xlab="",
        ylab="Global Active Power (killowatts)"
        )
##Copy the plot to a PNG file
dev.copy(
        png,
        file="plot2.png",
        height=480,
        width=480,
        units="px"
)
dev.off()
