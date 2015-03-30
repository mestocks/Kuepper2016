pdf("results/removeLowReadScores.pdf")

data <- read.table("data/removeLowReadScoresPrep.txt", header = F)
flt <- hist(data$V2, breaks = 500, plot = FALSE)

plot(0, 0, type = "n", xaxt = "n", yaxt = "n", xaxs = "i", bty = 'n',
     xlim = c(0, 20000),
     ylim = c(0, 40000), 
     xlab = "Raw read length (bp)",
     ylab = "Frequency")

lines(flt$mids, flt$counts, lwd = 1.75, lty = 1)

axis(1, pos = 0)
axis(2, las = 2, cex.axis = 0.8, pos = 0)

dev.off()
