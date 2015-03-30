pdf("results/readlengths.pdf", height = 6, width = 10)

data <- read.table("data/readlengthsPrep.txt", header = T)
raw <- hist(data$lenbc, breaks = 500, plot = FALSE)
c6 <- hist(data$c6, breaks = 500, plot = FALSE)
c8 <- hist(data$c8, breaks = 500, plot = FALSE)
c10 <- hist(data$c10, breaks = 500, plot = FALSE)
c12 <- hist(data$c12, breaks = 500, plot = FALSE)

raw_density <- raw$counts / sum(raw$counts)
c6_density <- c6$counts / sum(c6$counts)
c8_density <- c8$counts / sum(c8$counts)
c10_density <- c10$counts / sum(c10$counts)
c12_density <- c12$counts / sum(c12$counts)

raw_color <- "grey30"
c6_color <- "grey30"
c8_color <- "brown"
c10_color <- "tomato3"
c12_color <- "orange"

par(mfrow = c(1, 2))

plot(0, 0, type = "n", xaxt = "n", yaxt = "n", xaxs = "i", bty = 'n',
     xlim = c(0, 20000),
     ylim = c(0, 40000), 
     xlab = "Raw read length (bp)",
     ylab = "Frequency")

lines(raw$mids, raw$counts, col = raw_color, lwd = 1.75, lty = 1)

axis(1, pos = 0)
axis(2, las = 2, cex.axis = 0.8, pos = 0)

qs <- seq(0, 1, 0.01)

plot(0, 0, type = "n", xaxt = "n", yaxt = "n", xaxs = "i", bty = 'n',
     xlim = c(0, 20000),
     ylim = c(0, 1), 
     xlab = "Read length (bp)", 
     ylab = "Cumulative density")

axis(1, pos = 0)
axis(2, las = 2, pos = 0)

raw_df <- data.frame(quan = quantile(data$lenbc, probs = qs, na.rm = TRUE))
c6_df <- data.frame(quan = quantile(data$c6, probs = qs, na.rm = TRUE))
c8_df <- data.frame(quan = quantile(data$c8, probs = qs, na.rm = TRUE))
c10_df <- data.frame(quan = quantile(data$c10, probs = qs, na.rm = TRUE))
c12_df <- data.frame(quan = quantile(data$c12, probs = qs, na.rm = TRUE))

lines(raw_df$quan, qs, col = raw_color, lty = 1, lwd = 1.75)
lines(c6_df$quan, qs, col = c6_color, lty = 2, lwd = 1.75)
lines(c8_df$quan, qs, col = c8_color, lty = 2, lwd = 1.75)
lines(c10_df$quan, qs, col = c10_color, lty = 2, lwd = 1.75)
lines(c12_df$quan, qs, col = c12_color, lty = 2, lwd = 1.75)

legend(13000, 0.6, c("QV > 12", "QV > 10", "QV > 8", "QV > 6", "Raw"), 
	     col = c(c12_color, c10_color, c8_color, c6_color, raw_color), 
	     lty = c(2, 2, 2, 2, 1), lwd = 1.75, bty = 'n')

dev.off()
