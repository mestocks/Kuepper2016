pdf("bpsPerRun.pdf")

data <- read.table("bpsPerRun.txt", header = F)

barplot(data$V2,
        yaxt = 'n',
        xlab = "PacBio runs",
        ylab = "Total bps (in millions of bps)")

axis(2, las = 2,
     at = c(0, 100000000, 200000000, 300000000, 400000000, 500000000),
     labels = c("0", "100", "200", "300", "400", "500"))

dev.off()
