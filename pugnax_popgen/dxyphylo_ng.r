source("png_functions.r")

contigs <- c("2548", "3357", "3047", "3208", "3750",
             "4111", "2063", "1270", "9013", "3913")

win <- "_50k_5k.txt"

colFSI <- "grey45"
colFI <- "goldenrod"
colFS <- "tomato3"
colSI <- "steelblue"

fnameFSI.2548 <- read.table(paste("pg01/dxywinF_SI_2548", win, sep = ""), header = F)
fnameFSI.3357 <- read.table(paste("pg01/dxywinF_SI_3357", win, sep = ""), header = F)
fnameFSI.3047 <- read.table(paste("pg01/dxywinF_SI_3047", win, sep = ""), header = F)
fnameFSI.3208 <- read.table(paste("pg01/dxywinF_SI_3208", win, sep = ""), header = F)
fnameFSI.3750 <- read.table(paste("pg01/dxywinF_SI_3750", win, sep = ""), header = F)
fnameFSI.4111 <- read.table(paste("pg01/dxywinF_SI_4111", win, sep = ""), header = F)
#fnameFSI.4944 <- read.table(paste("pg01/dxywinF_SI_4944", win, sep = ""), header = F)
fnameFSI.2063 <- read.table(paste("pg01/dxywinF_SI_2063", win, sep = ""), header = F)
fnameFSI.1270 <- read.table(paste("pg01/dxywinF_SI_1270", win, sep = ""), header = F)
fnameFSI.9013 <- read.table(paste("pg01/dxywinF_SI_9013", win, sep = ""), header = F)
fnameFSI.3913 <- read.table(paste("pg01/dxywinF_SI_3913", win, sep = ""), header = F)

fnameFS.2548 <- read.table(paste("pg01/dxywinF_S_2548", win, sep = ""), header = F)
fnameFS.3357 <- read.table(paste("pg01/dxywinF_S_3357", win, sep = ""), header = F)
fnameFS.3047 <- read.table(paste("pg01/dxywinF_S_3047", win, sep = ""), header = F)
fnameFS.3208 <- read.table(paste("pg01/dxywinF_S_3208", win, sep = ""), header = F)
fnameFS.3750 <- read.table(paste("pg01/dxywinF_S_3750", win, sep = ""), header = F)
fnameFS.4111 <- read.table(paste("pg01/dxywinF_S_4111", win, sep = ""), header = F)
#fnameFS.4944 <- read.table(paste("pg01/dxywinF_S_4944", win, sep = ""), header = F)
fnameFS.2063 <- read.table(paste("pg01/dxywinF_S_2063", win, sep = ""), header = F)
fnameFS.1270 <- read.table(paste("pg01/dxywinF_S_1270", win, sep = ""), header = F)
fnameFS.9013 <- read.table(paste("pg01/dxywinF_S_9013", win, sep = ""), header = F)
fnameFS.3913 <- read.table(paste("pg01/dxywinF_S_3913", win, sep = ""), header = F)

fnameSI.2548 <- read.table(paste("pg01/dxywinS_I_2548", win, sep = ""), header = F)
fnameSI.3357 <- read.table(paste("pg01/dxywinS_I_3357", win, sep = ""), header = F)
fnameSI.3047 <- read.table(paste("pg01/dxywinS_I_3047", win, sep = ""), header = F)
fnameSI.3208 <- read.table(paste("pg01/dxywinS_I_3208", win, sep = ""), header = F)
fnameSI.3750 <- read.table(paste("pg01/dxywinS_I_3750", win, sep = ""), header = F)
fnameSI.4111 <- read.table(paste("pg01/dxywinS_I_4111", win, sep = ""), header = F)
#fnameSI.4944 <- read.table(paste("pg01/dxywinS_I_4944", win, sep = ""), header = F)
fnameSI.2063 <- read.table(paste("pg01/dxywinS_I_2063", win, sep = ""), header = F)
fnameSI.1270 <- read.table(paste("pg01/dxywinS_I_1270", win, sep = ""), header = F)
fnameSI.9013 <- read.table(paste("pg01/dxywinS_I_9013", win, sep = ""), header = F)
fnameSI.3913 <- read.table(paste("pg01/dxywinS_I_3913", win, sep = ""), header = F)

fnameFI.2548 <- read.table(paste("pg01/dxywinF_I_2548", win, sep = ""), header = F)
fnameFI.3357 <- read.table(paste("pg01/dxywinF_I_3357", win, sep = ""), header = F)
fnameFI.3047 <- read.table(paste("pg01/dxywinF_I_3047", win, sep = ""), header = F)
fnameFI.3208 <- read.table(paste("pg01/dxywinF_I_3208", win, sep = ""), header = F)
fnameFI.3750 <- read.table(paste("pg01/dxywinF_I_3750", win, sep = ""), header = F)
fnameFI.4111 <- read.table(paste("pg01/dxywinF_I_4111", win, sep = ""), header = F)
#fnameFI.4944 <- read.table(paste("pg01/dxywinF_I_4944", win, sep = ""), header = F)
fnameFI.2063 <- read.table(paste("pg01/dxywinF_I_2063", win, sep = ""), header = F)
fnameFI.1270 <- read.table(paste("pg01/dxywinF_I_1270", win, sep = ""), header = F)
fnameFI.9013 <- read.table(paste("pg01/dxywinF_I_9013", win, sep = ""), header = F)
fnameFI.3913 <- read.table(paste("pg01/dxywinF_I_3913", win, sep = ""), header = F)

##

contig.space <- 30000

sumpos <- sum(max(fnameFSI.2548$V1), max(fnameFSI.3357$V1), max(fnameFSI.3047$V1), max(fnameFSI.3208$V1),
              max(fnameFSI.3750$V1), max(fnameFSI.4111$V1), max(fnameFSI.2063$V1),
              max(fnameFSI.1270$V1), max(fnameFSI.9013$V1), max(fnameFSI.3913$V1)) + (8 * contig.space)

# b, l, t, r
# default c(5, 4, 4, 2) + 0.1

png("dxyphylo_ng.png", width = 720, height = 720)

par(mfrow = c(4, 1), mar = c(2, 4, 2, 2) + 0.1)

ylimit <- c(-0.004, 0.025)

lwidth <- 3
text.cex <- 1.5
text.ypos <- ylimit[1] + 0.002
text.adj <- 0.00225

png.plot("", "Dxy", c(0, sumpos), ylimit, 2.5)

png.yaxis(c(0, 0.01, 0.02), c(0, 0.01, 0.02), -2)

## 2548

n = 0

lines(c(n, max(fnameFS.2548$V1)), c(0, 0), lwd = lwidth)
text((max(fnameFS.2548$V1) - n) / 2, text.ypos, labels = "Contig2548", cex = text.cex)

lines(fnameFS.2548$V1, fnameFS.2548$V2, col = colFS, lwd = lwidth)
lines(fnameFI.2548$V1, fnameFI.2548$V2, col = colFI, lwd = lwidth)
lines(fnameSI.2548$V1, fnameSI.2548$V2, col = colSI, lwd = lwidth)

## 3357

lines(c(185694, 185694), c(0, 0.016), lty = 2, lwd = lwidth, col = "grey45")

n = max(fnameFSI.2548$V1) + contig.space

lines(c(n, max(fnameFS.3357$V1)), c(0, 0), lwd = lwidth)
text((max(fnameFS.3357$V1) - n) / 2, text.ypos, labels = "Contig3357", cex = text.cex)

lines(fnameFS.3357$V1, fnameFS.3357$V2, col = colFS, lwd = lwidth)
lines(fnameFI.3357$V1, fnameFI.3357$V2, col = colFI, lwd = lwidth)
lines(fnameSI.3357$V1, fnameSI.3357$V2, col = colSI, lwd = lwidth)

## 3047

n = max(fnameFSI.3357$V1) + contig.space

lines(c(n, n + max(fnameFS.3047$V1)), c(0, 0), lwd = lwidth)
text((max(fnameFS.3047$V1) / 2) + n, text.ypos, labels = "Contig3047", cex = text.cex)

lines((max(fnameFS.3047$V1) - fnameFS.3047$V1) + n + 1, fnameFS.3047$V2, col = colFS, lwd = lwidth)
lines((max(fnameFI.3047$V1) - fnameFI.3047$V1) + n + 1, fnameFI.3047$V2, col = colFI, lwd = lwidth)
lines((max(fnameSI.3047$V1) - fnameSI.3047$V1) + n + 1, fnameSI.3047$V2, col = colSI, lwd = lwidth)

## 4111

n = n + max(fnameFSI.3047$V1) + contig.space

lines(c(n, n + max(fnameFS.4111$V1)), c(0, 0), lwd = lwidth)
text((max(fnameFS.4111$V1) / 2) + n, text.ypos - text.adj, labels = "Contig4111", cex = text.cex)

lines((max(fnameFS.4111$V1) - fnameFS.4111$V1) + n + 1, fnameFS.4111$V2, col = colFS, lwd = lwidth)
lines((max(fnameFI.4111$V1) - fnameFI.4111$V1) + n + 1, fnameFI.4111$V2, col = colFI, lwd = lwidth)
lines((max(fnameSI.4111$V1) - fnameSI.4111$V1) + n + 1, fnameSI.4111$V2, col = colSI, lwd = lwidth)

## 3208

n = n + max(fnameFSI.4111$V1) + contig.space

lines(c(n, n + max(fnameFS.3208$V1)), c(0, 0), lwd = lwidth)
text((max(fnameFS.3208$V1) / 2) + n, text.ypos, labels = "Contig3208", cex = text.cex)

lines((max(fnameFS.3208$V1)- fnameFS.3208$V1) + n + 1, fnameFS.3208$V2, col = colFS, lwd = lwidth)
lines((max(fnameFI.3208$V1) - fnameFS.3208$V1) + n + 1, fnameFI.3208$V2, col = colFI, lwd = lwidth)
lines((max(fnameSI.3208$V1) - fnameFS.3208$V1) + n + 1, fnameSI.3208$V2, col = colSI, lwd = lwidth)

## 3750

n = n + max(fnameFSI.3208$V1) + contig.space

lines(c(n, n + max(fnameFS.3750$V1)), c(0, 0), lwd = lwidth)
text((max(fnameFS.3750$V1) / 2) + n, text.ypos - text.adj, labels = "Contig3750", cex = text.cex)

lines((max(fnameFS.3750$V1)- fnameFS.3750$V1) + n + 1, fnameFS.3750$V2, col = colFS, lwd = lwidth)
lines((max(fnameFI.3750$V1) - fnameFS.3750$V1) + n + 1, fnameFI.3750$V2, col = colFI, lwd = lwidth)
lines((max(fnameSI.3750$V1) - fnameFS.3750$V1) + n + 1, fnameSI.3750$V2, col = colSI, lwd = lwidth)

## 2063

n = n + max(fnameFSI.3750$V1) + contig.space

lines(c(n, n + max(fnameFS.2063$V1)), c(0, 0), lwd = lwidth)
text((max(fnameFS.2063$V1) / 2) + n, text.ypos, labels = "Contig2063", cex = text.cex)

#lines(fnameFSI.2063$V1 + n, fnameFSI.2063$V2, col = colFSI)
lines(fnameFS.2063$V1 + n, fnameFS.2063$V2, col = colFS, lwd = lwidth)
lines(fnameFI.2063$V1 + n, fnameFI.2063$V2, col = colFI, lwd = lwidth)
lines(fnameSI.2063$V1 + n, fnameSI.2063$V2, col = colSI, lwd = lwidth)

## 1270

n = n + max(fnameFSI.2063$V1) + contig.space

#lines(c(810000 + n, 810000 + n), c(0, 0.016), lty = 2, lwd = lwidth, col = "grey45")
#lines(c(840000 + n, 840000 + n), c(0, 0.016), lty = 2, lwd = lwidth, col = "grey45")
lines(c(821901 + n, 821901 + n), c(0, 0.016), lty = 2, lwd = lwidth, col = "grey45")

lines(c(n, n + max(fnameFS.1270$V1)), c(0, 0), lwd = lwidth)
text((max(fnameFS.1270$V1) / 2) + n, text.ypos, labels = "Contig1270", cex = text.cex)

#lines(fnameFSI.1270$V1 + n, fnameFSI.1270$V2, col = colFSI)
lines(fnameFS.1270$V1 + n, fnameFS.1270$V2, col = colFS, lwd = lwidth)
lines(fnameFI.1270$V1 + n, fnameFI.1270$V2, col = colFI, lwd = lwidth)
lines(fnameSI.1270$V1 + n, fnameSI.1270$V2, col = colSI, lwd = lwidth)

## 9013

n = n + max(fnameFSI.1270$V1) + contig.space

lines(c(n, n + max(fnameFS.9013$V1)), c(0, 0), lwd = lwidth)
text((max(fnameFS.9013$V1) / 2) + n, text.ypos - text.adj, labels = "Contig9013", cex = text.cex)

lines(fnameFS.9013$V1 + n, fnameFS.9013$V2, col = colFS, lwd = lwidth)
lines(fnameFI.9013$V1 + n, fnameFI.9013$V2, col = colFI, lwd = lwidth)
lines(fnameSI.9013$V1 + n, fnameSI.9013$V2, col = colSI, lwd = lwidth)

## 3913

n = n + max(fnameFSI.9013$V1) + contig.space

lines(c(n, n + max(fnameFS.3913$V1)), c(0, 0), lwd = lwidth)
text((max(fnameFS.3913$V1) / 2) + n, text.ypos, labels = "Contig3913", cex = text.cex)

lines(fnameFS.3913$V1 + n, fnameFS.3913$V2, col = colFS, lwd = lwidth)
lines(fnameFI.3913$V1 + n, fnameFI.3913$V2, col = colFI, lwd = lwidth)
lines(fnameSI.3913$V1 + n, fnameSI.3913$V2, col = colSI, lwd = lwidth)

####

legend(4740000, 0.021, c("fae-ind", "fae-sat", "sat-ind"), col = c(colFI, colFS, colSI), bty = 'n', cex = 1.5, lwd = lwidth)

arrows(0, 0.02, 500000, 0.02, code = 3, angle = 90, length = 0.05, lwd = 2)
text(250000, 0.0175, labels = "0.5 Mbp", cex = 1.5)

text(-35000, -0.00475, labels = "a", font = 2, cex = 1.5)

#dev.off()


library(ape)

k3357out <- read.tree("KRISSFF3357_150000_160000_alnUPGMA.ph")
k3357in <- read.tree("KR3357_280000_290000_aln.ph")


k3357out.boot <- read.tree("RAxML_bestTree.KRISSFF3357_150000_160000.ph")
k3913out.boot <- read.tree("RAxML_bestTree.KRISSFF3913_150000_160000.ph")
k3357in.boot <- read.tree("RAxML_bestTree.KR3357_280000_290000.ph")
k3208.boot <- read.tree("RAxML_bestTree.KRISSFF3208.ph")

#par(mfrow = c(3, 1))

xlimit <- 0.12

black <- "grey25"
tip.cex <- 2

plot(k3913out.boot, x.lim = xlimit, cex = 1.3, show.tip.label = FALSE, edge.width = lwidth, edge.color = black)
                                        #, x.lim = xlimit)
tiplabels(c("independent1",
            "Faeder2",
            "Faeder1",
            "Satellite1",
            "independent2",
            "Satellite2",
            "Killdeer"),
          frame = "none",
          adj = -0.2,
          cex = tip.cex,
          col = c("goldenrod", "tomato3", "tomato3", "steelblue", "goldenrod", "steelblue", "black"))

text(-0.001, 1, labels = "b", font = 2, cex = 1.5)

plot(k3357in.boot, x.lim = xlimit, cex = 1.3, show.tip.label = FALSE, edge.width = lwidth, edge.color = black)

tiplabels(c("independent1",
            "independent2",
            "Satellite1",
            "Satellite2",
            "Faeder1",
            "Faeder2",
            "Killdeer"),
          frame = "none",
          adj = -0.2,
          cex = tip.cex,
          col = c("goldenrod", "goldenrod", "steelblue", "steelblue", "tomato3", "tomato3", "black"))

text(-0.001, 1, labels = "c", font = 2, cex = 1.5)

plot(k3208.boot, x.lim = xlimit, cex = 1.3, show.tip.label = FALSE, edge.width = lwidth, edge.color = black)

tiplabels(c("independent1",
            "Satellite2",
            "Satellite1",
            "independent2",
            "Faeder2",
            "Faeder1",
            "Killdeer"),
          frame = "none",
          adj = -0.2,
          cex = tip.cex,
          col = c("goldenrod", "steelblue", "steelblue", "goldenrod", "tomato3", "tomato3", "black"))

text(-0.001, 1, labels = "d", font = 2, cex = 1.5)

dev.off()
