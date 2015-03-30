pdf("meanBpsVreadscore.pdf")

reads <- read.table("meanBpsPerRun.txt", header = F)
bps <- read.table("meanReadScorePerRun.txt", header = F)

data <- merge(reads, bps, by = "V1")
colnames(data) <- c("runName", "meanBps", "readScore")

plot(data$meanBps, data$readScore,
     xlab = "Mean bps",
     ylab = "Read score",
     yaxt = 'n')

axis(2, las = 2)

dev.off()
