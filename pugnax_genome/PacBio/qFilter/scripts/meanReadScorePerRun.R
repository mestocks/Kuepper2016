pdf("meanReadScorePerRun.pdf")

data <- read.table("meanReadScorePerRun.txt", header = F)

barplot(data$V2,
        yaxt = 'n',
        xlab = "PacBio runs",
        ylab = "Mean read score")

axis(2, las = 2)

dev.off()
