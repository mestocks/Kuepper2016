pdf("readsPerRun.pdf")

data <- read.table("readsPerRun.txt", header = F)

barplot(data$V2,
        yaxt = 'n',
        xlab = "PacBio runs",
        ylab = "Number of reads (kb)")

axis(2, las = 2,
     at = c(0, 20000, 40000, 60000, 80000),
     labels = c("0", "20", "40", "60", "80"))

dev.off()
