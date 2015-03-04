source("gwas_functions.r")

pfae1<- read.table("/home/mist/current/pugnax_gwas/gwas/fae_region1.txt", header = T)
pfae2 <- read.table("/home/mist/current/pugnax_gwas/gwas/fae_region2.txt", header = T)

psat1<- read.table("/home/mist/current/pugnax_gwas/gwas/sat_region1.txt", header = T)
psat2 <- read.table("/home/mist/current/pugnax_gwas/gwas/sat_region2.txt", header = T)


pdf("/home/mist/current/pugnax_gwas/gwas/manregion_trans.pdf", width = 10)

par(mfrow = c(2, 2))

lwidth <- 1.8

pcol <- "grey65"
pcol.sig <- "tomato3"

max1 <- max(max(pfae1$Position), max(psat1$Position))
max2 <- max(max(pfae2$Position), max(psat2$Position))

pfae1$colors <- "grey65"
pfae2$colors <- "grey65"
psat1$colors <- "grey65"
psat2$colors <- "grey65"

pfae1[pfae1$fq1k.P1df < 0.05, "colors"] <- "goldenrod"
pfae2[pfae2$fq1k.P1df < 0.05, "colors"] <- "goldenrod"
psat1[psat1$sq1k.P1df < 0.05, "colors"] <- "goldenrod"
psat2[psat2$sq1k.P1df < 0.05, "colors"] <- "goldenrod"

plot.manhattan.talk(pfae1$Position, pfae1$fq.P1df, pfae1$colors,
                    ylimit = c(0, 7))
plot.manhattan.talk(pfae2$Position, pfae2$fq.P1df, pfae2$colors,,
                    ylimit = c(0, 7),
                    ylabel = "", yaxis = FALSE, pmar = c(5, 1, 4, 2))

plot.manhattan.talk(psat1$Position, psat1$sq.P1df, psat1$colors,
                    ylimit = c(0, 7))
plot.manhattan.talk(psat2$Position, psat2$sq.P1df, psat2$colors,,
                    ylimit = c(0, 7),
                    ylabel = "", yaxis = FALSE, pmar = c(5, 1, 4, 2))

#plot(0, 0,
#	type = 'n',
#	xaxt = 'n',
#	yaxt = 'n',
#	xlim <- c(0, max1),
#	ylim = c(0, 8),
#	xlab = "Position on contig 47740 (bps)",
#	ylab = "-log10(P)")

#points(pfae1$Position, -log10(pfae1$fe.P1df),
#		       col = pfae1$colors,
#		       pch = 20)

#points(psat1$Position, -log10(psat1$sqi.P1df),
#		       col = psat1$colors,
#		       pch = 20)
	
#axis(1)
#axis(2, las = 2)



#plot(0, 0,
#	type = 'n',
#	xaxt = 'n',
#	yaxt = 'n',
#	xlim <- c(0, max2),
#	ylim = c(0, 8),
#	xlab = "Position on contig 47741 (bps)",
#	ylab = "-log10(P)")

#	points(pfae2$Position, -log10(pfae2$fe.P1df),
#		       col = pfae2$colors,
#		       pch = 20)

	#	points(psat2$Position, -log10(psat2$sqi.P1df),
	#	       col = psat2$colors,
	#	       pch = 20)

#axis(1)
#axis(2, las = 2)

#plot(0, 0,
#	type = 'n',
#	xaxt = 'n',
#	yaxt = 'n',
#	xlim <- c(0, max1),
#	ylim = c(0, 8),
#	xlab = "Position on contig 47740 (bps)",
#	ylab = "-log10(P)")

#points(pfae1$Position, -log10(pfae1$fe.P1df),
#		       col = pfae1$colors,
#		       pch = 20)

#points(psat1$Position, -log10(psat1$se.P1df),
#		       col = psat1$colors,
#		       pch = 20)
	
#axis(1)
#axis(2, las = 2)



#plot(0, 0,
#	type = 'n',
#	xaxt = 'n',
#	yaxt = 'n',
#	xlim <- c(0, max2),
#	ylim = c(0, 8),
#	xlab = "Position on contig 47741 (bps)",
#	ylab = "-log10(P)")

	#points(pfae2$Position, -log10(pfae2$fq.P1df),
	#	       col = pfae2$colors,
	#	       pch = 20)

#		points(psat2$Position, -log10(psat2$se.P1df),
#		       col = psat2$colors,
#		       pch = 20)

#axis(1)
#axis(2, las = 2)


dev.off()
