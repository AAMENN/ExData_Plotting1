## The dataset is manually downloaded into a zip file and the text file is extracted to household_power_consumption.txt.
## The household_power_consumption.txt file is read using fread() and the data is stored into powerdata. Only the required subset of data is read 
## to enhance the speed of reading of data. Subsetting is done by manually calculating the number of rows and columns.
library(data.table);
powerdata<-fread("/home/amann/R/household_power_consumption.txt",sep=";",skip=66637,nrows=69517-66637);

##Graphic device is opened to avoid any resizing issue.
png(file="plot4.png");

##To create 4 plots in a same device we need a grid of 4 cell. It is created below
par(mfrow=c(2,2));

## 1st plot is created. Topleft plot in the plot4.png
plot(date,powerdata$Global_active_power,type="l",ylab="Global Active Power",xlab="");

## 2nd plot is created. Topright plot in plot4.png.
plot(date,powerdata$Voltage,type="l",ylab="Voltage",xlab="datetime");

## 3rd plot is created. Bottomleft plot in plot4.png
plot(date,powerdata$Sub_metering_1,type="l",col='black',ylab="Energy Sub metering",xlab="");
lines(date,powerdata$Sub_metering_2,type="l",col='red');
lines(date,powerdata$Sub_metering_3,type="l",col="blue");
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd=1,col=c("black","red","blue"));

##4th plot is created. Bottomright plot in plot4.png
plot(date,powerdata$Global_reactive_power,type="l",ylab="Global Reactive Power",xlab="datetime");

##The graphic device is shut down.
dev.off()

