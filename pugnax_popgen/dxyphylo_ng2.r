source("png_functions.r")

contig.space <- 30000

contigs <- c("3357", "3047", "4111", "3208",
             "3750", "2063", "1270", "9013", "3913")
	     
contig.size <- c(914367, 964776, 258428, 577021,
	    112104, 881023, 848140, 146468, 575835)

contig.reverse <- c(FALSE, TRUE, TRUE, TRUE, TRUE, FALSE, FALSE, FALSE, FALSE)

sumpos <- sum(contig.size) + (length(contig.size) * contig.space)

add.line <- function(contig.name, n, sumpos, text.ypos, text.cex, lwidth, contig.size, reverse, text.adj) {

	 line.cols <- c("steelblue", "tomato3", "goldenrod")
	 line.names <- c("sat-ind", "fae-sat", "fae-ind")

	 if (contig.name == "3357") {
	    lines(c(185694 + n, 185694 + n), c(0, 0.02), lty = 2, lwd = lwidth, col = "grey45")
	    }
	 if (contig.name == "1270") {
	    lines(c(821901 + n, 821901 + n), c(0, 0.02), lty = 2, lwd = lwidth, col = "grey45")
	    }

	 win <- "_50k_5k.txt"
	 #FSI.name <- paste("pg01/dxywinF_SI_", contig.name, win, sep = "")
	 FI.name <- paste("pg01/dxywinF_I_", contig.name, win, sep = "")
	 FS.name <- paste("pg01/dxywinF_S_", contig.name, win, sep = "")
	 SI.name <- paste("pg01/dxywinS_I_", contig.name, win, sep = "")

	 #dataFSI <- read.table(FI.name, header = F)
	 dataFI <- read.table(FI.name, header = F)
	 dataFS <- read.table(FS.name, header = F)
	 dataSI <- read.table(SI.name, header = F)

	 adj <- 15000
	 dataFS$V1 <- dataFS$V1 + (adj)
	 dataFI$V1 <- dataFI$V1 + (2 * adj)

	 lines(c(n, n + contig.size), c(0, 0), lwd = lwidth)
	 text((contig.size / 2) + n, text.ypos + text.adj, labels = paste("Contig", contig.name, sep = ""), cex = text.cex)

	 if (reverse == FALSE) {
	    lines(dataSI$V1 + n, dataSI$V2, col = line.cols[1], lwd = lwidth)
	    lines(dataFS$V1 + n, dataFS$V2, col = line.cols[2], lwd = lwidth)
	    lines(dataFI$V1 + n, dataFI$V2, col = line.cols[3], lwd = lwidth)
	    } else {
	      lines((contig.size - dataSI$V1) + n + 1, dataSI$V2, col = line.cols[1], lwd = lwidth)
	      lines((contig.size - dataFS$V1) + n + 1, dataFS$V2, col = line.cols[2], lwd = lwidth)
	      lines((contig.size - dataFI$V1) + n + 1, dataFI$V2, col = line.cols[3], lwd = lwidth)

	 }
}

# b, l, t, r
# default c(5, 4, 4, 2) + 0.1

png("dxyphylo_ng2.png", width = 720, height = 720)

par(mfrow = c(4, 1), mar = c(2, 4, 2, 2) + 0.1)

ylimit <- c(-0.004, 0.025)

lwidth <- 2
text.cex <- 1.5
text.ypos <- ylimit[1] + 0.002
text.adj <- 0.00225

text.adjs <- c(0, 0, -text.adj, 0,
	 -text.adj, 0, 0, -text.adj, 0)

png.plot("", "Dxy", c(0, sumpos), ylimit, 2.5)
png.yaxis(c(0, 0.01, 0.02), c(0, 0.01, 0.02), -2)

# plot breakpoints
#lines(c(185694, 185694), c(0, 0.016), lty = 2, lwd = lwidth, col = "grey45")
#lines(c(821901 + n, 821901 + n), c(0, 0.016), lty = 2, lwd = lwidth, col = "grey45")

n = 0
for (i in seq(1, length(contigs))) {
    contig.name <- contigs[i]
    add.line(contig.name, n, sumpos, text.ypos, text.cex, lwidth, contig.size[i], contig.reverse[i], text.adjs[i])
    n = n + contig.size[i] + contig.space
}

line.cols <- c("steelblue", "tomato3", "goldenrod")
line.names <- c("sat-ind", "fae-sat", "fae-ind")

legend(4740000, 0.021, line.names, col = line.cols, bty = 'n', cex = 1.5, lwd = lwidth)

arrows(500000, 0.02, 1000000, 0.02, code = 3, angle = 90, length = 0.05, lwd = 2)
text(750000, 0.0175, labels = "0.5 Mbp", cex = 1.5)
text(-35000, -0.00475, labels = "a", font = 2, cex = 1.5)


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
