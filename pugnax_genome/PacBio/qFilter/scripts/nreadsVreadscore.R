pdf("nreadsVreadscore.pdf")

reads <- read.table("readsPerRun.txt", header = F)
bps <- read.table("meanReadScorePerRun.txt", header = F)

data <- merge(reads, bps, by = "V1")
colnames(data) <- c("runName", "nreads", "readScore")

plot(data$nreads, data$readScore,
     xlab = "Number of reads",
     ylab = "Read score",
     yaxt = 'n')

axis(2, las = 2)

dev.off()
