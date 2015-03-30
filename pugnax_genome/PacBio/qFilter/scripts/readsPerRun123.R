library(lattice)

#theData <- read.table("readsPerRun123.txt", header = F)
#theData <- read.table("meanBpsPerRun123.txt", header = F)
theData <- read.table("meanReadScorePerRun123.txt", header = F)

byMean <- tapply(theData$V3, theData$V1, mean)
dfMean <- data.frame(runName = row.names(byMean), readMean = byMean)

newData <- merge(theData, dfMean, by.x = "V1", by.y = "runName")
orderData <- newData[order(newData$readMean, newData$V2), ]
orderData$order <- seq(1, length(orderData$V1))

#myplot <- xyplot(orderData$V3 ~ orderData$order)
myplot <- xyplot(orderData$V3 ~ orderData$V2 | orderData$V1)

print(myplot)
