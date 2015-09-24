library(jpeg)

#tiff("fig1abcd.tiff", width = 4, height = 5, units = "in",
#     res = 400, pointsize = 5)

jpeg.plot <- function(infile, pic.text, xlower = 0, ylower = 0, xupper = 1, yupper = 1) {
    pic <- readJPEG(infile)
    res <- dim(pic)[1:2]
    plot(0, 0, xlim = c(0, 1), ylim = c(0, 1),
         type = 'n', bty = 'n', xaxt = 'n', yaxt = 'n', xlab = "", ylab = "")
    rasterImage(pic, xlower, ylower, xupper, yupper)
    text(0.5, 0.95, pic.text, cex = 2, font = 2)
}

data1b <- read.table("fig1b.csv", header = T, sep = ",")
data1c <- read.table("fig1c.csv", header = T, sep = ",")
data1d <- read.table("fig1d.csv", header = T, sep = ",")

general.blue <- "lightsteelblue3"
allcex.axis <- 1.3
allcex.lab <- 1.5

# b, l, t, r - default: c(5, 4, 4, 2) + 0.1
#par(mfrow = c(4, 3), mar = c(3.5, 4, 2, 2) + 0.1,
#    cex.lab = allcex.lab, cex.axis = allcex.axis)

## Figure a
pos.indsat <- c(-0.025, -0.1, 1.025, 0.9)
pos.fae <- c(0.2, 0.15, 0.8, 0.65)

jpeg.plot("independent.jpg", "Independent", xlower = pos.indsat[1], ylower = pos.indsat[2], xupper = pos.indsat[3], yupper = pos.indsat[4])

mtext("a", font = 2, line = 0, cex = 1.4,
        at = par("usr")[1] - 0.02)

jpeg.plot("satellite2.jpg", "Satellite", xlower = pos.indsat[1], ylower = pos.indsat[2], xupper = pos.indsat[3], yupper = pos.indsat[4])
jpeg.plot("faeder.jpg", "Faeder", xlower = pos.fae[1], ylower = pos.fae[2], xupper = pos.fae[3], yupper = pos.fae[4])

## Figure b

ymaxB <- c(0, 30)
xlabelB <- "PC1"
ylabelB <- "Frequency"
mgpB <- c(2.5, 1, 0)

barplot(data1b$Ind, ylim = ymaxB, xlab = xlabelB, ylab = ylabelB,
        axes = FALSE, axisnames = TRUE, mgp = mgpB,
        col = general.blue, border = TRUE, space = 0)

axis(1, at = seq(2, 19, 4) + 0.5, labels = seq(-3.2, 3.2, 1.6))
axis(2, las = 2)

mtext("b", font = 2, line = 1.5, cex = 1.4,
        at = par("usr")[1] - 0.5)

barplot(data1b$Sat, ylim = ymaxB, xlab = xlabelB, ylab = ylabelB,
        axes = FALSE, axisnames = TRUE, mgp = mgpB,
        col = general.blue, border = TRUE, space = 0)

axis(1, at = seq(2, 19, 4) + 0.5, labels = seq(-3.2, 3.2, 1.6))
axis(2, las = 2)

barplot(data1b$Fad, ylim = ymaxB, xlab = xlabelB, ylab = ylabelB,
        axes = FALSE, axisnames = TRUE, mgp = mgpB,
        col = general.blue, border = TRUE, space = 0)

axis(1, at = seq(2, 19, 4) + 0.5, labels = seq(-3.2, 3.2, 1.6))
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
ylimitC <- c(-2.2, 2.2)

plot(0, 0, type = 'n', bty = 'n', xaxt = 'n', yaxt = 'n',
     xlim = xlimitC, ylim = ylimitC,
     xlab = xlabC, 
     ylab = "Standardized scores",
     mgp = mgpB)
abline(h = 0, lty = 2, col = "grey46")
boxplot(indC$Value ~ as.factor(indC$Phenotype),
        frame = FALSE, axes = FALSE, add = TRUE, outline = FALSE, col = colors)
axis(2, las = 2, at = seq(-2, 2, 1))
text(seq(1,4), rep(-2.2, 4), c("Aggr.", "Disp.", "Prox.", "Alert"), cex = 1.4)
mtext("c", font = 2, line = 1, cex = 1.4,
        at = par("usr")[1] - 0.04)

plot(0, 0, type = 'n', bty = 'n', xaxt = 'n', yaxt = 'n',
     xlim = xlimitC, ylim = ylimitC,
     xlab = xlabC, 
     ylab = "Standardized scores",
     mgp = mgpB)
abline(h = 0, lty = 2, col = "grey46")
boxplot(satC$Value ~ as.factor(satC$Phenotype),
        frame = FALSE, axes = FALSE, add = TRUE, outline = FALSE, col = colors)
axis(2, las = 2, at = seq(-2, 2, 1))
text(seq(1,4), rep(-2.2, 4), c("Aggr.", "Disp.", "Prox.", "Alert"), cex = 1.4)

plot(0, 0, type = 'n', bty = 'n', xaxt = 'n', yaxt = 'n',
     xlim = xlimitC, ylim = ylimitC,
     xlab = xlabC, 
     ylab = "Standardized scores",
     mgp = mgpB)
abline(h = 0, lty = 2, col = "grey46")
boxplot(faeC$Value ~ as.factor(faeC$Phenotype), 
        frame = FALSE, axes = FALSE, add = TRUE, outline = FALSE, col = colors)
axis(2, las = 2, at = seq(-2, 2, 1))
text(seq(1,4), rep(-2.2, 4), c("Aggr.", "Disp.", "Prox.", "Alert"), cex = 1.4)

# Figure d

indD <- data1d[data1d$MORPH == "Independent", ]
satD <- data1d[data1d$MORPH == "Satellite", ]
faeD <- data1d[data1d$MORPH == "Faeder", ]

xlabD <- ""
ylabD <- expression("Residual testes volume ("*"log mm"^3*")")
xlimitD <- c(0.4, 1.6)
ylimitD <- c(-2, 2)

mgpD <- c(2, 1, 0)

plot(0, 0, type = 'n', bty = 'n', xaxt = 'n', yaxt = 'n',
     xlim = xlimitD, ylim = ylimitD, xlab = xlabD, ylab = ylabD,
     mgp = mgpD)
abline(h = 0, lty = 2, col = "grey46")
boxplot(indD$RESIDUAL.testes.volume, frame = FALSE, add = TRUE,
        col = general.blue, border = TRUE, axes = FALSE, outline = FALSE)
axis(2, las = 2, at = seq(-2, 2, 1))

mtext("d", font = 2, line = 1, cex = 1.4,
        at = par("usr")[1] - 0.02)

plot(0, 0, type = 'n', bty = 'n', xaxt = 'n', yaxt = 'n',
     xlim = xlimitD, ylim = ylimitD, xlab = xlabD, ylab = ylabD,
     mgp = mgpD)
abline(h = 0, lty = 2, col = "grey46")
boxplot(satD$RESIDUAL.testes.volume, frame = FALSE, add = TRUE,
        col = general.blue, border = TRUE, axes = FALSE, outline = FALSE)
axis(2, las = 2, at = seq(-2, 2, 1))

plot(0, 0, type = 'n', bty = 'n', xaxt = 'n', yaxt = 'n',
     xlim = xlimitD, ylim = ylimitD, xlab = xlabD, ylab = ylabD,
     mgp = mgpD)
abline(h = 0, lty = 2, col = "grey46")
boxplot(faeD$RESIDUAL.testes.volume, frame = FALSE, add = TRUE,
        col = general.blue, border = TRUE, axes = FALSE, outline = FALSE)
axis(2, las = 2, at = seq(-2, 2, 1))

#dev.off()
