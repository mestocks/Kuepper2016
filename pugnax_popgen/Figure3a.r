contig.space <- 30000

contigs <- c("3357", "3047", "4111", "3208",
             "3750", "2063", "1270", "9013", "3913")
	     
contig.size <- c(914367, 964776, 258428, 577021,
	    112104, 881023, 848140, 146468, 575835)

contig.reverse <- c(FALSE, TRUE, TRUE, TRUE, TRUE, FALSE, FALSE, FALSE, FALSE)

sumpos <- sum(contig.size) + (length(contig.size) * contig.space)

add.line <- function(contig.name, n, sumpos,
                     text.ypos, text.cex, lwidth, contig.size, reverse, text.adj) {

	 line.cols <- c("steelblue", "tomato3", "goldenrod")
	 line.names <- c("sat-ind", "fae-sat", "fae-ind")

	 if (contig.name == "3357") {
             lines(c(185694 + n, 185694 + n), c(0, 0.02),
                   lty = 2, lwd = lwidth, col = "grey45") }
	 if (contig.name == "1270") {
             lines(c(821901 + n, 821901 + n), c(0, 0.02),
                   lty = 2, lwd = lwidth, col = "grey45") }

	 win <- "_50k_5k.txt"
	 FI.name <- paste("pg01/dxywinF_I_", contig.name, win, sep = "")
	 FS.name <- paste("pg01/dxywinF_S_", contig.name, win, sep = "")
	 SI.name <- paste("pg01/dxywinS_I_", contig.name, win, sep = "")

	 dataFI <- read.table(FI.name, header = F)
	 dataFS <- read.table(FS.name, header = F)
	 dataSI <- read.table(SI.name, header = F)

	 adj <- 15000
	 dataFS$V1 <- dataFS$V1 + (adj)
	 dataFI$V1 <- dataFI$V1 + (2 * adj)

	 lines(c(n, n + contig.size), c(0, 0), lwd = lwidth)
	 text((contig.size / 2) + n, text.ypos + text.adj,
              labels = paste("Contig", contig.name, sep = ""), cex = text.cex)

	 if (reverse == FALSE) {
	    lines(dataSI$V1 + n, dataSI$V2, col = line.cols[1], lwd = lwidth)
	    lines(dataFS$V1 + n, dataFS$V2, col = line.cols[2], lwd = lwidth)
	    lines(dataFI$V1 + n, dataFI$V2, col = line.cols[3], lwd = lwidth) }
         else {
            lines((contig.size - dataSI$V1) + n + 1, dataSI$V2,
                  col = line.cols[1], lwd = lwidth)
            lines((contig.size - dataFS$V1) + n + 1, dataFS$V2,
                  col = line.cols[2], lwd = lwidth)
            lines((contig.size - dataFI$V1) + n + 1, dataFI$V2,
                  col = line.cols[3], lwd = lwidth) } }

xlimit <- c(0, sumpos)
ylimit <- c(-0.004, 0.025)

axis.at <- c(0, 0.01, 0.02)
axis.labels <- c(0, 0.01, 0.02)
axis.line <- -2

lwidth <- 2
text.cex <- 1.1
text.ypos <- ylimit[1] + 0.002
text.base <- 0#-0.0001
text.adj <- 0.002

text.adjs <- c(text.base, text.base, text.base, text.base,
	 text.base-text.adj, text.base, text.base, text.base-text.adj, text.base)

plot(0, 0, bty = 'n', type = 'n', xaxt = 'n', yaxt = 'n',
       xlab = "", ylab = "", xlim = xlimit, ylim = ylimit)#,

mtext("Dxy", side = 2, line = 2.5, cex = 1.75)
axis(2, las = 2, line = axis.line,
     at = axis.at, labels = axis.labels) 

n = 0
for (i in seq(1, length(contigs))) {
    contig.name <- contigs[i]
    add.line(contig.name, n, sumpos,
             text.ypos, text.cex,
             lwidth, contig.size[i], contig.reverse[i], text.adjs[i])
    n = n + contig.size[i] + contig.space }

line.cols <- c("steelblue", "tomato3", "goldenrod")
line.names <- c("sat-ind", "fae-sat", "fae-ind")

legend(5000000, 0.025, line.names,
       col = line.cols, bty = 'n', cex = 1.5, lwd = lwidth)

arrows(500000, 0.02, 1000000, 0.02, code = 3, angle = 90, length = 0.05, lwd = 2)
text(750000, 0.0175, labels = "0.5 Mbp", cex = 1.5)
#text(-35000, -0.00475, labels = "a", font = 2, cex = 1.5)
#text(-200000, 0.024, labels = "a", font = 2, cex = 2)
mtext("a", side = 2, line = 2.5, cex = 2, font = 2, at = 0.025, las = 1)
