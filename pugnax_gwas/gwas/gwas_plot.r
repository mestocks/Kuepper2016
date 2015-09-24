reverse.order <- function(data, contig.name) {
    data.gpos <- data[data$Chromosome == contig.name, "GenomePosition"]
    gpos.min <- min(data.gpos)
    gpos.max <- max(data.gpos)
    data[data$Chromosome == contig.name,
         "GenomePosition"] <- gpos.min + (gpos.max - data.gpos + 1)
    data }

fo.data <- read.table("GenABEL2/fo_qtibs_RUFFv0.2_dp6.txt", header = T)
si.data <- read.table("GenABEL2/si_qtibs_RUFFv0.2_dp6.txt", header = T)

# reverse contig order
rcontigs <- c(3047, 3208, 4111, 3750)
for (rc in rcontigs) {
    fo.data <- reverse.order(fo.data, rc)
    si.data <- reverse.order(si.data, rc) }

# region of interest
roi.lower <- 703000000
roi.upper <- 713000000
fo.region <- fo.data[fo.data$GenomePosition > roi.lower & fo.data$GenomePosition < roi.upper, ]
si.region <- si.data[si.data$GenomePosition > roi.lower & si.data$GenomePosition < roi.upper, ]

# colour by contig
colour1 <- "grey75"
colour2 <- "grey35"
sig.fae <- "tomato3"
sig.sat <- "steelblue"
sig.level <- 0.05

fo.data$colour <- colour1
fo.data[fo.data$p.1k < sig.level, "colour"] <- sig.fae

si.data$colour <- colour1
si.data[si.data$p.1k < sig.level, "colour"] <- sig.sat

fo.region$colour <- "black"
fo.region[fo.region$chrID %% 2 == 0, "colour"] <- colour1
fo.region[fo.region$chrID %% 2 > 0, "colour"] <- colour2
fo.region[fo.region$p.1k < sig.level, "colour"] <- sig.fae

si.region$colour <- "black"
si.region[si.region$chrID %% 2 == 0, "colour"] <- colour1
si.region[si.region$chrID %% 2 > 0, "colour"] <- colour2
si.region[si.region$p.1k < sig.level, "colour"] <- sig.sat

#xlab.cex <- 1.25
#axislab.cex <- 1.25
pt.cex <- 1.8

#png("Figure2c.png", width = 580, height = 580)
# plot 1

# mar c(5, 4, 4, 2) + 0.1 - b,l,t,r
#par(mfrow = c(3, 1), mar = c(4, 4, 1, 2) + 0.1)

plot(0, 0,
     xlim = c(min(fo.data$GenomePosition), 1200000000),
     ylim = c(0, 7),
     type = 'n',
     bty = 'n',
     xlab = "",
     #cex.lab = xlab.cex,
     ylab = "-log10(p)",
     xaxt = 'n',
     yaxt = 'n')

xvalues <- c(0, 0.2, 0.4, 0.6, 0.8, 1, 1.2)

axis(1, labels = xvalues, at = xvalues * 1000000000)#, cex.axis = axislab.cex)
axis(2, las = 2)#, cex.axis = axislab.cex)

mtext(side = 1, text = "Position (Gbp)0", line = 0, cex = 1.75)
mtext(side = 1, text = "Position (Gbp)1", line = 1, cex = 1.75)
mtext(side = 1, text = "Position (Gbp)2", line = 2, cex = 1.75)

points(fo.data$GenomePosition, -log10(fo.data$P1df),
     pch = 20, col = fo.data$colour, cex = pt.cex)

points(si.data$GenomePosition, -log10(si.data$P1df),
     pch = 20, col = si.data$colour, cex = pt.cex)

lines(c(roi.lower, roi.lower), c(0, 4), lty = 2, lwd = 1.5, col = "grey15")
lines(c(roi.upper, roi.upper), c(0, 4), lty = 2, lwd = 1.5, col = "grey15")

# plot 2

lwidth <- 3
contig.col <- "grey25"

plot(0, 0,
     xlim = c(min(fo.region$GenomePosition), max(fo.region$GenomePosition)),
     ylim = c(-1, 7),
     type = 'n',
     bty = 'n',
     #cex.lab = xlab.cex,
     xlab = "",
     ylab = "-log10(p)",
     xaxt = 'n',
     yaxt = 'n')

points(fo.region$GenomePosition, -log10(fo.region$P1df),
       col = fo.region$colour, pch = 20, cex = pt.cex)

zlabs <- c("0.703", "0.705", "0.707", "0.709", "0.711", "0.713")

axis(1, labels = zlabs, at = as.numeric(zlabs) * 1000000000,
     pos = -0.25)#, cex.axis = axislab.cex)
axis(2, las = 2, at = seq(0, 7))#, cex.axis = axislab.cex)
mtext(side = 1, text = "Position (Gbp)", line = 1, cex = 1.75)

text.ypos <- -0.85
text.cex <- 1.2
text.yadj <- 0.25

# plot 3

plot(0, 0,
     xlim = c(min(si.region$GenomePosition), max(si.region$GenomePosition)),
     ylim = c(-1, 7),
     type = 'n',
     bty = 'n',     
     #cex.lab = xlab.cex,
     xlab = "",
     ylab = "-log10(p)",
     xaxt = 'n',
     yaxt = 'n',)

points(si.region$GenomePosition, -log10(si.region$P1df),
       col = si.region$colour, pch = 20, cex = pt.cex)

axis(1, labels = zlabs, at = as.numeric(zlabs) * 1000000000,
     pos = -0.25)#, cex.axis = axislab.cex)
axis(2, las = 2, at = seq(0, 7))#, cex.axis = axislab.cex)
mtext(side = 1, text = "Position (Gbp)", line = 1, cex = 1.75)

#dev.off()
