pdf("results/meanVarPerRead.pdf")

data <- read.table("data/meanVarPerReadPrep.txt", header = F)

colnames(data) <- c("position", "run", "n", "mean", "var")
data$sd <- sqrt(data$var)

pointCol <- "grey80"
lineCol <- "black"
sdCol <- "tomato3"

plot(data$position, data$mean,
     xaxt = 'n',
     yaxt = 'n',
     xaxs = 'i',
     col = pointCol,
     pch = 20,
     xlim = c(-1000, 34000),
     xlab = "Read base",
     ylab = "Mean Quality Value")

axis(1)
axis(2, las = 2)

lines(loess.smooth(data$position, data$mean, span = 0.04),
      col = lineCol,
      lty = 2,
      lwd = 2)

lines(loess.smooth(data$position,
                   data$mean + (1.96 * (data$sd/sqrt(data$n))),
                   span = 0.04),
      lwd = 2.5,
      lty = 2,
      col = sdCol)

lines(loess.smooth(data$position,
                   data$mean - (1.96 * (data$sd/sqrt(data$n))),
                   span = 0.04),
      lwd = 2.5,
      lty = 2,
      col = sdCol)

dev.off()
