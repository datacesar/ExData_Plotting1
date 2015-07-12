library(lubridate)
library(datasets)
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
datetime<-dmy_hms(
        datetime
        )
##create the plot
par(mar= c(4,4,2,1))

plot(
        datetime,
        consumtion$Sub_metering_1,
        type="l",
        xlab="",
        ylab="Energy sub metering"
        )
##add second plot
points(
        datetime,
        consumtion$Sub_metering_2,
        type="l",
        col="Red",
        xlab="" ,
        ylab=""
        )
##add last plot
points(
        datetime,
        consumtion$Sub_metering_3,
        type="l",
        col="Blue",
        xlab="",
        ylab=""
        )
legend(
        "topright",
        col=c("Black","Red","Blue"),
        lty = c(1,1,1),
        legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
        adj = 0,
        cex = 0.7,
        xjust = 0,
        yjust = 0,
        y.intersp = 0.5,
        text.width=50000
)

##Copy the plot to a PNG file
dev.copy(
        png,
        file="plot3.png",
        height=480,
        width=480,
        units="px"
)
dev.off()