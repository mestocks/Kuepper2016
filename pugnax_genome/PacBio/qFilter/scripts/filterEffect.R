pdf("results/filterEffect.pdf")

data <- read.table("data/readScoresPrep.txt", header = F)
raw <- hist(data$V2, breaks = 500, plot = FALSE)

plot(0, 0, type = "n", xaxt = "n", yaxt = "n", xaxs = "i", bty = 'n',
     xlim = c(0, 20000),
     ylim = c(0, 40000), 
     xlab = "Raw read length (bp)",
     ylab = "Frequency")

lines(raw$mids, raw$counts, lwd = 1.75, lty = 1, col = "grey30")

filtered <- data[data$V1 >= 0.75 & data$V2 >= 100, ]
filt <- hist(filtered$V2, breaks = 500, plot = FALSE)

lines(filt$mids, filt$counts, lwd = 1.75, lty = 1, col = "grey40")
polygon(c(filt$mids, rev(filt$mids)), c(rep(0, length(filt$counts)), rev(filt$counts)), col = "grey70", border = NA)

axis(1, pos = 0)
axis(2, las = 2, cex.axis = 0.8, pos = 0)

dev.off()
