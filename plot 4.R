
powerdata<-read.table("household_power_consumption.txt",sep=";",header=TRUE)
x<-paste(powerdata$Date,powerdata$Time)
newcol<-strptime(x,"%d/%m/%Y %H:%M:%S")
newdata<-cbind(powerdata,newcol)
powerdata2<-subset(newdata,newcol>="2007-02-01")
powerdata3<-subset(powerdata2,newcol<"2007-02-03")
powerdata3[,7]<-as.numeric(as.character(powerdata3[,7]))
powerdata3[,8]<-as.numeric(as.character(powerdata3[,8]))
powerdata3[,9]<-as.numeric(as.character(powerdata3[,9]))
powerdata3[,3]<-as.numeric(as.character(powerdata3[,3]))
powerdata3[,5]<-as.numeric(as.character(powerdata3[,5]))
powerdata3[,4]<-as.numeric(as.character(powerdata3[,4]))

par(mfrow=c(2,2))

with(powerdata3,{
	plot(newcol,Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
	plot(newcol,Voltage,type="l",xlab="datatime",ylab="Voltage")
	plot(newcol,Sub_metering_1,ylim=range(c(Sub_metering_1,Sub_metering_2,Sub_metering_3)),type="l",ylab="Energy Sub Metering",xlab="")
	lines(newcol,Sub_metering_3,col="blue")
	lines(newcol,Sub_metering_2,col="red")
	legend("topright",pch="___",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
	plot(newcol,Global_reactive_power,type="l",xlab="datatime",ylab="Global_reactive_power")
})

dev.copy(png,file="plot 4.png",width=480,height=480)
dev.off()