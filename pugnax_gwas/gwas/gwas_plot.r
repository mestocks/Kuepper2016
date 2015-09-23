fo.data <- read.table("GenABEL2/fo_qtibs_RUFFv0.2_dp6.txt", header = T)
si.data <- read.table("GenABEL2/si_qtibs_RUFFv0.2_dp6.txt", header = T)

##
fo3357.min <- min(fo.data[fo.data$Chromosome == 3357, "GenomePosition"])
fo3357.max <- max(fo.data[fo.data$Chromosome == 3357, "GenomePosition"])

fo3047.min <- min(fo.data[fo.data$Chromosome == 3047, "GenomePosition"])
fo3047.max <- max(fo.data[fo.data$Chromosome == 3047, "GenomePosition"])
si3047.min <- min(si.data[si.data$Chromosome == 3047, "GenomePosition"])
si3047.max <- max(si.data[si.data$Chromosome == 3047, "GenomePosition"])

fo4111.min <- min(fo.data[fo.data$Chromosome == 4111, "GenomePosition"])
fo4111.max <- max(fo.data[fo.data$Chromosome == 4111, "GenomePosition"])
si4111.min <- min(si.data[si.data$Chromosome == 4111, "GenomePosition"])
si4111.max <- max(si.data[si.data$Chromosome == 4111, "GenomePosition"])

fo3208.min <- min(fo.data[fo.data$Chromosome == 3208, "GenomePosition"])
fo3208.max <- max(fo.data[fo.data$Chromosome == 3208, "GenomePosition"])
si3208.min <- min(si.data[si.data$Chromosome == 3208, "GenomePosition"])
si3208.max <- max(si.data[si.data$Chromosome == 3208, "GenomePosition"])

fo3750.min <- min(fo.data[fo.data$Chromosome == 3750, "GenomePosition"])
fo3750.max <- max(fo.data[fo.data$Chromosome == 3750, "GenomePosition"])
si3750.min <- min(si.data[si.data$Chromosome == 3750, "GenomePosition"])
si3750.max <- max(si.data[si.data$Chromosome == 3750, "GenomePosition"])

fo4944.min <- min(fo.data[fo.data$Chromosome == 4944, "GenomePosition"])
fo4944.max <- max(fo.data[fo.data$Chromosome == 4944, "GenomePosition"])

fo2063.min <- min(fo.data[fo.data$Chromosome == 2063, "GenomePosition"])
fo2063.max <- max(fo.data[fo.data$Chromosome == 2063, "GenomePosition"])

fo1270.min <- min(fo.data[fo.data$Chromosome == 1270, "GenomePosition"])
fo1270.max <- max(fo.data[fo.data$Chromosome == 1270, "GenomePosition"])

fo3913.min <- min(fo.data[fo.data$Chromosome == 3913, "GenomePosition"])
fo3913.max <- max(fo.data[fo.data$Chromosome == 3913, "GenomePosition"])

fo9013.min <- min(fo.data[fo.data$Chromosome == 9013, "GenomePosition"])
fo9013.max <- max(fo.data[fo.data$Chromosome == 9013, "GenomePosition"])

## reverse contig order
fo.data[fo.data$Chromosome == 3047, "GenomePosition"] <- fo3047.min + (fo3047.max - fo.data[fo.data$Chromosome == 3047, "GenomePosition"] + 1)
si.data[si.data$Chromosome == 3047, "GenomePosition"] <- si3047.min + (si3047.max - si.data[si.data$Chromosome == 3047, "GenomePosition"] + 1)

fo.data[fo.data$Chromosome == 3208, "GenomePosition"] <- fo3208.min + (fo3208.max - fo.data[fo.data$Chromosome == 3208, "GenomePosition"] + 1)
si.data[si.data$Chromosome == 3208, "GenomePosition"] <- si3208.min + (si3208.max - si.data[si.data$Chromosome == 3208, "GenomePosition"] + 1)

fo.data[fo.data$Chromosome == 4111, "GenomePosition"] <- fo4111.min + (fo4111.max - fo.data[fo.data$Chromosome == 4111, "GenomePosition"] + 1)
si.data[si.data$Chromosome == 4111, "GenomePosition"] <- si4111.min + (si4111.max - si.data[si.data$Chromosome == 4111, "GenomePosition"] + 1)

fo.data[fo.data$Chromosome == 3750, "GenomePosition"] <- fo3750.min + (fo3750.max - fo.data[fo.data$Chromosome == 3750, "GenomePosition"] + 1)
si.data[si.data$Chromosome == 3750, "GenomePosition"] <- si3750.min + (si3750.max - si.data[si.data$Chromosome == 3750, "GenomePosition"] + 1)

## region of interest
fo.region <- fo.data[fo.data$GenomePosition > 703000000 & fo.data$GenomePosition < 713000000 , ]

si.region <- si.data[si.data$GenomePosition > 703000000 & si.data$GenomePosition < 713000000 , ]

## colour by contig
colour1 <- "grey75"
colour2 <- "grey35"
colourA1 <- "steelblue"
colourA2 <- "cornflowerblue"

sig.fae <- "tomato3"
sig.sat <- "steelblue"

fo.data$colour <- colour1
#fo.data[fo.data$chrID %% 2 == 0, "colour"] <- colour1
#fo.data[fo.data$chrID %% 2 > 0, "colour"] <- colour2
fo.data[fo.data$p.1k < 0.05, "colour"] <- sig.fae

si.data$colour <- colour1
#si.data[si.data$chrID %% 2 == 0, "colour"] <- colour1
#si.data[si.data$chrID %% 2 > 0, "colour"] <- colour2
si.data[si.data$p.1k < 0.05, "colour"] <- sig.sat

fo.region$colour <- "black"
fo.region[fo.region$chrID %% 2 == 0, "colour"] <- colour1
fo.region[fo.region$chrID %% 2 > 0, "colour"] <- colour2
fo.region[fo.region$p.1k < 0.05, "colour"] <- sig.fae

si.region$colour <- "black"
si.region[si.region$chrID %% 2 == 0, "colour"] <- colour1
si.region[si.region$chrID %% 2 > 0, "colour"] <- colour2
si.region[si.region$p.1k < 0.05, "colour"] <- sig.sat

png("fo_si_all3x1ibsrev_7535_ng.png", width = 580, height = 580)

#mar c(5, 4, 4, 2) + 0.1 - b,l,t,r
par(mfrow = c(3, 1), mar = c(4, 4, 1, 2) + 0.1)

plot(0, 0,
     xlim = c(min(fo.data$GenomePosition), 1200000000),#max(fo.data$GenomePosition)),
     ylim = c(0, 7),
     type = 'n',
     bty = 'n',
     xlab = "",
     cex.lab = 1.25,
     ylab = "-log10(p)",
     xaxt = 'n',
     yaxt = 'n')

xvalues <- c(0, 0.2, 0.4, 0.6, 0.8, 1, 1.2)

axis(1, labels = xvalues, at = xvalues * 1000000000, cex.axis = 1.25)
axis(2, las = 2, cex.axis = 1.25)

mtext(side = 1, text = "Position (Gbp)", line = 2.5)

#abline(v = 703000000, lty = 3, lwd = 1.5, col = colour2)
#abline(v = 713000000, lty = 3, lwd = 1.5, col = colour2)

points(fo.data$GenomePosition, -log10(fo.data$P1df),
     pch = 20, col = fo.data$colour, cex = 1.2)


points(si.data$GenomePosition, -log10(si.data$P1df),
     pch = 20, col = si.data$colour, cex = 1.2)

lines(c(703000000, 703000000), c(0, 4), lty = 2, lwd = 2, col = "grey15")
lines(c(713000000, 713000000), c(0, 4), lty = 2, lwd = 2, col = "grey15")

#lines(c(703000000, 703000000), c(3, 3.1), lwd = 2, col = "grey15")
#lines(c(713000000, 713000000), c(3, 3.1), lwd = 2, col = "grey15")
#lines(c(703000000, 713000000), c(3, 3), lwd = 2, col = "grey15")
#lines(c(703000000, 450000000), c(3, -1), lty = 2, col = "grey15")
#lines(c(713000000, 900000000), c(3, -1), lty = 2, col = "grey15")
#lines(c(708000000, 708000000), c(3, 2.8), lwd = 2)

##

lwidth <- 3
contig.col <- "grey25"

plot(0, 0,
     xlim = c(min(fo.region$GenomePosition), max(fo.region$GenomePosition)),
     ylim = c(-1, 7),
     type = 'n',
     bty = 'n',
     cex.lab = 1.25,
     xlab = "",
     ylab = "-log10(p)",
     xaxt = 'n',
     yaxt = 'n')

points(fo.region$GenomePosition, -log10(fo.region$P1df), col = fo.region$colour, pch = 20, cex = 1.2)

#arrows(703000000, 6.8, 703000000 + 500000, 6.8, code = 3, angle = 90, length = 0.05, lwd = 2)
#text(703000000 + 250000, 6.2, labels = "0.5 Mbp")

#text(c(min3047, max3047), c(-0.2, -0.2), labels = "3047")

#lines(c(7050000000, 705000000), c())

zlabs <- c("0.703", "0.705", "0.707", "0.709", "0.711", "0.713")

axis(1, labels = zlabs, at = as.numeric(zlabs) * 1000000000, pos = -0.25, cex.axis = 1.25)
axis(2, las = 2, at = seq(0, 7), cex.axis = 1.25)
mtext(side = 1, text = "Position (Gbp)", line = 1)

text.ypos <- -0.85
text.cex <- 1.2
text.yadj <- 0.25

#text(((fo3357.max - fo3357.min) / 2) + fo3357.min, text.ypos,
#     labels = "3357",
#     cex = text.cex)

#text(((fo3047.max - fo3047.min) / 2) + fo3047.min, text.ypos,
#     labels = "3047",
#     cex = text.cex)

#text(((fo3208.max - fo3208.min) / 2) + fo3208.min, text.ypos,
#     labels = "3208",
#     cex = text.cex)

#text(((fo4111.max - fo4111.min) / 2) + fo4111.min, text.ypos - text.yadj,
#     labels = "4111",
#     cex = text.cex)

#text(((fo3750.max - fo3750.min) / 2) + fo3750.min, text.ypos + text.yadj,
#     labels = "3750",
#     cex = text.cex)

#text(((fo2063.max - fo2063.min) / 2) + fo2063.min, text.ypos,
#     labels = "2063",
#     cex = text.cex)

#text(((fo1270.max - fo1270.min) / 2) + fo1270.min, text.ypos,
#     labels = "1270",
#     cex = text.cex)

#text(((fo4944.max - fo4944.min) / 2) + fo4944.min, text.ypos - text.yadj,
#     labels = "4944",
#     cex = text.cex)

#text(((fo9013.max - fo9013.min) / 2) + fo9013.min, text.ypos + text.yadj,
#     labels = "9013",
#     cex = text.cex)

#text(((fo3913.max - fo3913.min) / 2) + fo3913.min + 50000, text.ypos - text.yadj,
#     labels = "3913",
#     cex = text.cex)

plot(0, 0,
     xlim = c(min(si.region$GenomePosition), max(si.region$GenomePosition)),
     ylim = c(-1, 7),
     type = 'n',
     bty = 'n',
     
     cex.lab = 1.25,
     xlab = "",
     ylab = "-log10(p)",
     xaxt = 'n',
     yaxt = 'n',)

points(si.region$GenomePosition, -log10(si.region$P1df), col = si.region$colour, pch = 20, cex = 1.2)

#arrows(703000000, 6.8, 703000000 + 500000, 6.8, code = 3, angle = 90, length = 0.05, lwd = 2)
#text(703000000 + 250000, 6.2, labels = "0.5 Mbp")


axis(1, labels = zlabs, at = as.numeric(zlabs) * 1000000000, pos = -0.25, cex.axis = 1.25)
axis(2, las = 2, at = seq(0, 7), cex.axis = 1.25)
mtext(side = 1, text = "Position (Gbp)", line = 1)

#text(((fo3357.max - fo3357.min) / 2) + fo3357.min, text.ypos,
#     labels = "3357",
#     cex = text.cex)

#text(((fo3047.max - fo3047.min) / 2) + fo3047.min, text.ypos,
#     labels = "3047",
#     cex = text.cex)

#text(((fo3208.max - fo3208.min) / 2) + fo3208.min, text.ypos,
#     labels = "3208",
#     cex = text.cex)

#text(((fo4111.max - fo4111.min) / 2) + fo4111.min, text.ypos - text.yadj,
#     labels = "4111",
#     cex = text.cex)

#text(((fo3750.max - fo3750.min) / 2) + fo3750.min, text.ypos + text.yadj,
#     labels = "3750",
#     cex = text.cex)

#text(((fo2063.max - fo2063.min) / 2) + fo2063.min, text.ypos,
#     labels = "2063",
#     cex = text.cex)

#text(((fo1270.max - fo1270.min) / 2) + fo1270.min, text.ypos,
#     labels = "1270",
#     cex = text.cex)

#text(((fo4944.max - fo4944.min) / 2) + fo4944.min, text.ypos - text.yadj,
#     labels = "4944",
#     cex = text.cex)

#text(((fo9013.max - fo9013.min) / 2) + fo9013.min, text.ypos + text.yadj,
#     labels = "9013",
#     cex = text.cex)

#text(((fo3913.max - fo3913.min) / 2) + fo3913.min + 50000, text.ypos - text.yadj,
#     labels = "3913",
#     cex = text.cex)

dev.off()
