pdf("meanBpsPerRun.pdf")

data <- read.table("meanBpsPerRun.txt", header = F)

barplot(data$V2,
        yaxt = 'n',
        xlab = "PacBio runs",
        ylab = "Mean bps (kb)")

axis(2, las = 2,
     at = c(0, 1000, 2000, 3000, 4000, 5000),
     labels = c("0", "1", "2", "3", "4", "5"))

dev.off()
