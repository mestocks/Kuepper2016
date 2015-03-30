pdf("results/readScores.pdf")

data <- read.table("data/readScoresPrep.txt", header = F)

readScores <- hist(data$V1, breaks = 400, plot = FALSE)

lineCol <- "grey40"
plot(0, 0, type = "n", xaxt = "n", yaxt = "n",
     xaxs = "i", bty = 'n',
     xlim = c(0, 1),
     ylim = c(0, 80000), 
     xlab = "Read scores",
     ylab = "Frequency")

lines(readScores$mids, readScores$counts, 
      col = lineCol,
      lwd = 1.6,
      lty = 1)

axis(1, pos = 0)
axis(2, las = 2, cex.axis = 0.8, pos = 0)

dev.off()
