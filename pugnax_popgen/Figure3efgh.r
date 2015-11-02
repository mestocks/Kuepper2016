fae.col <- "tomato3"
sat.col <- "steelblue"

FI.col <- "goldenrod"
FS.col <- "tomato3"
SI.col <- "steelblue"

arrow.lwd <- 2.5
arrow.len <- 0.05

lwidth <- 3

dxy.ylim <- c(0, 0.02)

contigs <- c("3357", "1270", "1270", "1270")
contig.adjs <- c(3712, 42, 5830, 6544)
contig.letters <- c("e", "f", "g", "h")
xmins <- c(540000, 0, 630000, 750000)
xmaxs <- c(660000, 100000, 710000, 850000)

gene.names1 <- c("PLCG2", "SDR42E1", "HSD17B2")
gene.names2 <- c("ZFPM1")
gene.names3 <- c("TCF25", "MC1R", "GAS8")
gene.names4 <- c("CYB5B")

gene.start1 <- c(542795, 597364, 618128)
gene.start2 <- c(554)
gene.start3 <- c(663189, 676152, 691183)
gene.start4 <- c(798473)

gene.end1 <- c(590127, 600788, 629243)
gene.end2 <- c(6565)
gene.end3 <- c(673684, 677096, 698352)
gene.end4 <- c(809553)

genes <- data.frame(panel = c(rep(1, length(gene.names1)),
                      rep(2, length(gene.names2)),
                      rep(3, length(gene.names3)),
                      rep(4, length(gene.names4))),
                    name = c(gene.names1, gene.names2, gene.names3, gene.names4),
                    start = c(gene.start1, gene.start2, gene.start3, gene.start4),
                    end = c(gene.end1, gene.end2, gene.end3, gene.end4),
		    xadj = c(0, -5000, 0, 0, -2500, 2500, 0, 0),
                    yadj = c(0, 0, 0, 0, 0, 0, 0, 0))

ylabel <- "Dxy"
ylimit <- c(0, 0.045)
yaxis.at <- c(0, 0.01, 0.02, 0.03)
yaxis.line <- 0
yaxis.textline <- 3.75

gene.ypos <- ylimit[2] - 0.005
genetext.ypos <- ylimit[2] - 0.0025

lwin <- "10k"
nsteps <- "1k"

######

i <- 1

for (i in seq(1, length(contigs))) {

  contig <- contigs[i]
  contig.adj <- contig.adjs[i]

  ##

  dxy.fs <- read.table(paste("pg01/Contig", contig, "dxy_fs_", lwin, nsteps, ".txt", sep = ""), header = F)
  dxy.rf <- read.table(paste("pg01/Contig", contig, "dxy_rf_", lwin, nsteps, ".txt", sep = ""), header = F)
  dxy.rs <- read.table(paste("pg01/Contig", contig, "dxy_rs_", lwin, nsteps, ".txt", sep = ""), header = F)

  xlimit <- c(xmins[i], xmaxs[i])
  xlabel <- paste("Position on contig ", contig, " (bp)", sep = "")

  plot(0, 0, bty = 'n', type = 'n', xaxt = 'n', yaxt = 'n',
       xlab = "", ylab = "", xlim = xlimit, ylim = ylimit)

  mtext(xlabel, side = 1, line = 3, cex = 1.5)
  mtext(ylabel, side = 2, line = yaxis.textline, cex = 1.5)
  
  lines(dxy.fs$V1 - contig.adj, dxy.fs$V2,
        col = FS.col,
        lwd = lwidth)
  
  lines(dxy.rs$V1 - contig.adj, dxy.rs$V2,
        col = SI.col,
        lwd = lwidth)
  
  lines(dxy.rf$V1 - contig.adj, dxy.rf$V2,
        col = FI.col,
        lwd = lwidth)

	if (i == 2) {
            axis(1, at = c(0, 20000, 40000, 60000, 80000, 100000),
                 labels = c("0", "20000", "40000", "60000", "80000", "100000")) }
        else { axis(1) }

  axis(2, las = 2, line = yaxis.line,
       at = yaxis.at, labels = yaxis.at)

  ##

  subst.file <- paste("pg01/Contig", contig, "altsnps.txt", sep = "")
  subst.data <- read.table(subst.file, header = F)

  ffae <- subst.data[(subst.data$V7 + subst.data$V8) == 2 & (subst.data$V4 + subst.data$V5 + subst.data$V6) == 0, ]
  fsat <- subst.data[(subst.data$V5 + subst.data$V6) == 2 & (subst.data$V4 + subst.data$V7 + subst.data$V8) == 0, ]

  points(ffae$V2 - contig.adj, rep(ylimit[2] - 0.0065,
                                   length(ffae$V2)), pch = 20, col = fae.col)
  points(fsat$V2 - contig.adj, rep(ylimit[2] - 0.0085,
                                   length(fsat$V2)), pch = 20, col = sat.col)

  if (contig.letters[i] == "e") {
      mtext(contig.letters[i], side = 2, line = 2, cex = 2, font = 2, at = 0.045, las = 1) }
  #mtext(contig.letters[i], font = 2, line = 0.25, cex = 1.4,
  #      at = par("usr")[1] + 0.005 * diff(par("usr")[1:2]))

  subgenes <- genes[genes$panel == i, ]
  for (j in seq(1, length(subgenes$name))) {
      lines(c(subgenes$start[j], subgenes$end[j]), c(gene.ypos + subgenes$yadj[j], gene.ypos + subgenes$yadj[j]),
            lwd = lwidth, col = "grey25")
      text(subgenes$start[j] + ((subgenes$end[j] - subgenes$start[j]) / 2) + subgenes$xadj[j], genetext.ypos + subgenes$yadj[j],
           labels = subgenes$name[j], cex = 1.2)
  }

  if (i == 1) {
    arrows(575250, 0.03, 575250, 0.026, length = arrow.len, col = "grey25", lwd = arrow.lwd)
    arrows(612000, 0.03, 612000, 0.026, length = arrow.len, col = "grey25", lwd = arrow.lwd)
    arrows(642000, 0.03, 642000, 0.026, length = arrow.len, col = "grey25", lwd = arrow.lwd)
  }

  #if (i == 4) {
  #  legend(822000, 0.037, c("fae-sat", "fae-ind", "sat-ind"), col = c("tomato3", "goldenrod", "steelblue"), lwd = lwidth, bty = 'n', cex = 1.5)
  #}
  
}

#dev.off()
