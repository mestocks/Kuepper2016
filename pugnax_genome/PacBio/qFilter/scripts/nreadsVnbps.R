pdf("nreadsVnbps.pdf")

reads <- read.table("readsPerRun.txt", header = F)
bps <- read.table("bpsPerRun.txt", header = F)

data <- merge(reads, bps, by = "V1")
colnames(data) <- c("runName", "nreads", "bps")

plot(data$bps, data$nreads,
     xlab = "Total bps",
     ylab = "Number of reads (kb)",
     yaxt = 'n')

axis(2,
     las = 2,
     at = c(50000, 60000, 70000, 80000, 90000, 100000),
     labels = c("50", "60", "70", "80", "90", "100"))

dev.off()
