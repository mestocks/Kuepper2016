pdf("fig1abcd.pdf", width = 8, height = 10)

data1b <- read.table("fig1b.csv", header = T, sep = ",")
data1c <- read.table("fig1c.csv", header = T, sep = ",")
data1d <- read.table("fig1d.csv", header = T, sep = ",")

general.blue <- "lightsteelblue3"

# b, l, t, r - default: c(5, 4, 4, 2) + 0.1
par(mfrow = c(4, 3), mar = c(3, 4, 2, 2) + 0.1)

## Figure a

plot(0, 0, type = 'n', bty = 'n', xaxt = 'n', yaxt = 'n', xlab = "", ylab = "")
mtext("a", font = 2, line = 0.25, cex = 1.4,
        at = par("usr")[1] - 0.5)

plot(0, 0, type = 'n', bty = 'n', xaxt = 'n', yaxt = 'n', xlab = "", ylab = "")
plot(0, 0, type = 'n', bty = 'n', xaxt = 'n', yaxt = 'n', xlab = "", ylab = "")


## Figure b

ymaxB <- c(0, 30)
xlabelB <- "PC1"
ylabelB <- "Frequency"
mgpB <- c(2.25, 1, 0)

barplot(data1b$Ind, ylim = ymaxB, xlab = xlabelB, ylab = ylabelB,
        axes = FALSE, axisnames = TRUE, mgp = mgpB,
        col = general.blue, border = TRUE)

axis(1, 
     labels = seq(-3.2, 3.2, 1.6), at = seq(3.1, 23.8, 4.8))
axis(2, las = 2)

mtext("b", font = 2, line = 0.25, cex = 1.4,
        at = par("usr")[1] - 5.5)

barplot(data1b$Sat, ylim = ymaxB, xlab = xlabelB, ylab = ylabelB,
        axes = FALSE, axisnames = TRUE, mgp = mgpB,
        col = general.blue, border = TRUE)

axis(1, 
     labels = seq(-3.2, 3.2, 1.6), at = seq(3.1, 23.8, 4.8))
axis(2, las = 2)

barplot(data1b$Fad, ylim = ymaxB, xlab = xlabelB, ylab = ylabelB,
        axes = FALSE, axisnames = TRUE, mgp = mgpB,
        col = general.blue, border = TRUE)

axis(1, 
     labels = seq(-3.2, 3.2, 1.6), at = seq(3.1, 23.8, 4.8))
axis(2, las = 2)

# Figure c

agg <- data.frame(Morph = data1c$MORPH,
                  Phenotype = rep("Aggression", length(data1c$RuffID)),
                  Value = data1c$Aggression)

dis <- data.frame(Morph = data1c$MORPH,
                  Phenotype = rep("Display", length(data1c$RuffID)),
                  Value = data1c$Display)

pro <- data.frame(Morph = data1c$MORPH,
                  Phenotype = rep("Proximity", length(data1c$RuffID)),
                  Value = data1c$Proximity)

ale <- data.frame(Morph = data1c$MORPH,
                  Phenotype = rep("Alert stance", length(data1c$RuffID)),
                  Value = data1c$Alert.Stance)

df1c <- rbind(agg, dis, pro, ale)
colors <- c("grey40", "indianred", "tan2", "darkolivegreen4")

indC <- df1c[df1c$Morph == "1RES", ]
satC <- df1c[df1c$Morph == "2SAT", ]
faeC <- df1c[df1c$Morph == "3Faeder", ]

xlabC <- ""
xlimitC <- c(0.5, 4.5)
ylimitC <- c(-2, 2)

plot(0, 0, type = 'n', bty = 'n', xaxt = 'n', yaxt = 'n',
     xlim = xlimitC, ylim = ylimitC,
     xlab = xlabC, 
     ylab = "Standardized scores",
     mgp = mgpB)
abline(h = 0, lty = 2, col = "grey46")
boxplot(indC$Value ~ as.factor(indC$Phenotype),
        frame = FALSE, axes = FALSE, add = TRUE, outline = FALSE, col = colors)
axis(2, las = 2, at = seq(-2, 2, 1))

mtext("c", font = 2, line = 0.25, cex = 1.4,
        at = par("usr")[1] - 1)

plot(0, 0, type = 'n', bty = 'n', xaxt = 'n', yaxt = 'n',
     xlim = xlimitC, ylim = ylimitC,
     xlab = xlabC, 
     ylab = "Standardized scores",
     mgp = mgpB)
abline(h = 0, lty = 2, col = "grey46")
boxplot(satC$Value ~ as.factor(satC$Phenotype),
        frame = FALSE, axes = FALSE, add = TRUE, outline = FALSE, col = colors)
axis(2, las = 2, at = seq(-2, 2, 1))

plot(0, 0, type = 'n', bty = 'n', xaxt = 'n', yaxt = 'n',
     xlim = xlimitC, ylim = ylimitC,
     xlab = xlabC, 
     ylab = "Standardized scores",
     mgp = mgpB)
abline(h = 0, lty = 2, col = "grey46")
boxplot(faeC$Value ~ as.factor(faeC$Phenotype), 
        frame = FALSE, axes = FALSE, add = TRUE, outline = FALSE, col = colors)
axis(2, las = 2, at = seq(-2, 2, 1))


# Figure d

indD <- data1d[data1d$MORPH == "Independent", ]
satD <- data1d[data1d$MORPH == "Satellite", ]
faeD <- data1d[data1d$MORPH == "Faeder", ]

xlabD <- ""
ylabD <- expression("Residual testes volume ("*"mm"^3*")")
xlimitD <- c(0.4, 1.6)
ylimitD <- c(-2, 2)

plot(0, 0, type = 'n', bty = 'n', xaxt = 'n', yaxt = 'n',
     xlim = xlimitD, ylim = ylimitD, xlab = xlabD, ylab = ylabD,
     mgp = mgpB)
abline(h = 0, lty = 2, col = "grey46")
boxplot(indD$RESIDUAL.testes.volume, frame = FALSE, add = TRUE,
        col = general.blue, border = TRUE, axes = FALSE, outline = FALSE)
axis(2, las = 2, at = seq(-2, 2, 1))

mtext("d", font = 2, line = 0.25, cex = 1.4,
        at = par("usr")[1] - 0.3)

plot(0, 0, type = 'n', bty = 'n', xaxt = 'n', yaxt = 'n',
     xlim = xlimitD, ylim = ylimitD, xlab = xlabD, ylab = ylabD,
     mgp = mgpB)
abline(h = 0, lty = 2, col = "grey46")
boxplot(satD$RESIDUAL.testes.volume, frame = FALSE, add = TRUE,
        col = general.blue, border = TRUE, axes = FALSE, outline = FALSE)
axis(2, las = 2, at = seq(-2, 2, 1))

plot(0, 0, type = 'n', bty = 'n', xaxt = 'n', yaxt = 'n',
     xlim = xlimitD, ylim = ylimitD, xlab = xlabD, ylab = ylabD,
     mgp = mgpB)
abline(h = 0, lty = 2, col = "grey46")
boxplot(faeD$RESIDUAL.testes.volume, frame = FALSE, add = TRUE,
        col = general.blue, border = TRUE, axes = FALSE, outline = FALSE)
axis(2, las = 2, at = seq(-2, 2, 1))

dev.off()
