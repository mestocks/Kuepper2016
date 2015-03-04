#fi <- read.table("dxyFI.txt", header = F)
#fs <- read.table("dxyFS.txt", header = F)
#si <- read.table("dxySI.txt", header = F)

fi <- read.table("dxyFA.txt", header = F)
fs <- read.table("dxySA.txt", header = F)
si <- read.table("dxyIA.txt", header = F)

pfae1<- read.table("/home/mist/current/pugnax_gwas/gwas/fae_region1.txt", header = T)
pfae2 <- read.table("/home/mist/current/pugnax_gwas/gwas/fae_region2.txt", header = T)

psat1<- read.table("/home/mist/current/pugnax_gwas/gwas/sat_region1.txt", header = T)
psat2 <- read.table("/home/mist/current/pugnax_gwas/gwas/sat_region2.txt", header = T)

#fi <- read.table("dxyRF.txt", header = F)
#fs <- read.table("dxyRS.txt", header = F)
#si <- read.table("dxyRI.txt", header = F)

fi47740 <- fi[fi$V1 == "Contig47740", ]
fs47740 <- fs[fs$V1 == "Contig47740", ]
si47740 <- si[si$V1 == "Contig47740", ]

fi47741 <- fi[fi$V1 == "Contig47741", ]
fs47741 <- fs[fs$V1 == "Contig47741", ]
si47741 <- si[si$V1 == "Contig47741", ]

nwin <- 200

ma <- function(x, n) { filter(x, rep(1/n, n), sides = 2) }

fi1 <- ma(fi47740$V3, n = nwin)
fs1 <- ma(fs47740$V3, n = nwin)
si1 <- ma(si47740$V3, n = nwin)

fi2 <- ma(fi47741$V3, n = nwin)
fs2 <- ma(fs47741$V3, n = nwin)
si2 <- ma(si47741$V3, n = nwin)

pdf("/home/mist/current/pugnax_gwas/gwas/pvalues_pairwiseall_both_eg.pdf", width = 10)

par(mfrow = c(3, 2))

lwidth <- 1.8

pcol <- "grey65"
pcol.sig <- "tomato3"

fi.col <- "tomato3"
fs.col <- "steelblue"
si.col <- "goldenrod"

max.p1 <- max(max(pfae1$Position), max(psat1$Position))
max.p2 <- max(max(pfae2$Position), max(psat2$Position))

max.d1 <- max(max(fi47740$V2), max(fs47740$V2), max(si47740$V2))
max.d2 <- max(max(fi47741$V2), max(fs47741$V2), max(si47741$V2))

max1 <- max(max.p1, max.d1)
max2 <- max(max.p2, max.d2)

pfae1$colors <- "grey65"
pfae2$colors <- "grey65"
psat1$colors <- "grey65"
psat2$colors <- "grey65"

pfae1[pfae1$fe1k.P1df < 0.05, "colors"] <- "tomato3"
pfae2[pfae2$fe1k.P1df < 0.05, "colors"] <- "tomato3"
psat1[psat1$se1k.P1df < 0.05, "colors"] <- "tomato3"
psat2[psat2$se1k.P1df < 0.05, "colors"] <- "tomato3"

plot(0, 0,
	type = 'n',
	xaxt = 'n',
	yaxt = 'n',
	xlim <- c(0, max1),
	ylim = c(0, 8),
	xlab = "Position on contig 47740 (bps)",
	ylab = "-log10(P)")

points(pfae1$Position, -log10(pfae1$fe.P1df),
		       col = pfae1$colors,
		       pch = 20)

#points(psat1$Position, -log10(psat1$sqi.P1df),
#		       col = psat1$colors,
#		       pch = 20)
	
axis(1)
axis(2, las = 2)



plot(0, 0,
	type = 'n',
	xaxt = 'n',
	yaxt = 'n',
	xlim <- c(0, max2),
	ylim = c(0, 8),
	xlab = "Position on contig 47741 (bps)",
	ylab = "-log10(P)")

	points(pfae2$Position, -log10(pfae2$fe.P1df),
		       col = pfae2$colors,
		       pch = 20)

	#	points(psat2$Position, -log10(psat2$sqi.P1df),
	#	       col = psat2$colors,
	#	       pch = 20)

axis(1)
axis(2, las = 2)

plot(0, 0,
	type = 'n',
	xaxt = 'n',
	yaxt = 'n',
	xlim <- c(0, max1),
	ylim = c(0, 8),
	xlab = "Position on contig 47740 (bps)",
	ylab = "-log10(P)")

#points(pfae1$Position, -log10(pfae1$fe.P1df),
#		       col = pfae1$colors,
#		       pch = 20)

points(psat1$Position, -log10(psat1$se.P1df),
		       col = psat1$colors,
		       pch = 20)
	
axis(1)
axis(2, las = 2)



plot(0, 0,
	type = 'n',
	xaxt = 'n',
	yaxt = 'n',
	xlim <- c(0, max2),
	ylim = c(0, 8),
	xlab = "Position on contig 47741 (bps)",
	ylab = "-log10(P)")

	#points(pfae2$Position, -log10(pfae2$fq.P1df),
	#	       col = pfae2$colors,
	#	       pch = 20)

		points(psat2$Position, -log10(psat2$se.P1df),
		       col = psat2$colors,
		       pch = 20)

axis(1)
axis(2, las = 2)


plot(0, 0,
	type = 'n',
	xaxt = 'n',
	yaxt = 'n',
	xlim <- c(0, max1),
	ylim = c(0.1, 0.5),
	xlab = "Position on contig 47740 (bps)",
	ylab = "Dxy")

lines(fi47740$V2, fi1, col = fi.col, lwd = lwidth)
lines(fs47740$V2, fs1, col = fs.col, lwd = lwidth)
lines(si47740$V2, si1, col = si.col, lwd = lwidth)

axis(1)
axis(2, las = 2)

#legend(1750000, 0.52, c("fae-ind", "fae-sat", "sat-ind"), col = c("tomato3", "steelblue", "goldenrod"), bty = "n", lty = 1, cex = 1, lwd = lwidth)

legend(1750000, 0.52, c("faeder", "satellite", "independent"), col = c("tomato3", "steelblue", "goldenrod"), bty = "n", lty = 1, cex = 1, lwd = lwidth)

max2 <- max(max(fi47741$V2), max(fs47741$V2), max(si47741$V2))

plot(0, 0,
	type = 'n',
	xaxt = 'n',
	yaxt = 'n',
	xlim <- c(0, max2),
	ylim = c(0.1, 0.5),
	xlab = "Position on contig 47741 (bps)",
	ylab = "Dxy")

lines(fi47741$V2, fi2, col = "tomato3", lwd = lwidth)
lines(fs47741$V2, fs2, col = "steelblue", lwd = lwidth)
lines(si47741$V2, si2, col = "goldenrod", lwd = lwidth)

axis(1)
axis(2, las = 2)

dev.off()