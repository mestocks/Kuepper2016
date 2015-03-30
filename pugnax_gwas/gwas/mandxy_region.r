pdf("mandxy_region.pdf", height = 3.5, width = 10)

source("gwas_functions.r")

ma <- function(x, n) { filter(x, rep(1/n, n), sides = 2) }

Dfi <- read.table("/home/mist/repos/Evolib/dxyFI.txt", header = F)
Dfs <- read.table("/home/mist/repos/Evolib/dxyFS.txt", header = F)
Dsi <- read.table("/home/mist/repos/Evolib/dxySI.txt", header = F)


Dfi.47740 <- Dfi[Dfi$V1 == "Contig47740", ]
Dfi.47741 <- Dfi[Dfi$V1 == "Contig47741", ]

Dfs.47740 <- Dfs[Dfs$V1 == "Contig47740", ]
Dfs.47741 <- Dfs[Dfs$V1 == "Contig47741", ]

Dsi.47740 <- Dsi[Dsi$V1 == "Contig47740", ]
Dsi.47741 <- Dsi[Dsi$V1 == "Contig47741", ]


nwin <- 200

Dfi.47740.y <- ma(Dfi.47740$V3, nwin)
Dfi.47741.y <- ma(Dfi.47741$V3, nwin)

Dfs.47740.y <- ma(Dfs.47740$V3, nwin)
Dfs.47741.y <- ma(Dfs.47741$V3, nwin)

Dsi.47740.y <- ma(Dsi.47740$V3, nwin)
Dsi.47741.y <- ma(Dsi.47741$V3, nwin)


Dmax.47740.x <- max(c(Dfi.47740$V2, Dfs.47740$V2, Dsi.47740$V2))
Dmax.47741.x <- max(c(Dfi.47741$V2, Dfs.47741$V2, Dsi.47741$V2))


xlim.47740 <- c(0, Dmax.47740.x)
ylim.47740 <- c(0.1, 0.5)

xlim.47741 <- c(0, Dmax.47741.x)
ylim.47741 <- c(0.1, 0.5)

lwidth <- 1.8

xlabel <- "Position (bps)"
ylabel <- "Dxy"

fi.col <- "tomato3"
fs.col <- "steelblue"
si.col <- "goldenrod"

all.names <- c("faeder-independent", "faeder-satellite", "satellite-independent")
all.cols <- c(fi.col, fs.col, si.col)

talk.cols <- rgb(249, 242, 215, maxColorValue = 255)


par(mfrow = c(1, 2))
par(mar = c(5, 5, 4, 1) + 0.1)

empty.plot(xlabel = xlabel, ylabel = ylabel, xlimit = xlim.47740, ylimit = ylim.47740, lab.color = talk.cols, lab.size = 1.5)

axis(1,
     col = talk.cols,
     col.axis = talk.cols,
     cex.axis = 1.5,
     lwd = 2)

axis(2,
     las = 2,
     col = talk.cols,
     col.axis = talk.cols,
     cex.axis = 1.5,
     lwd = 2)

lines(Dfi.47740$V2, Dfi.47740.y, col = fi.col, lwd = lwidth)
lines(Dfs.47740$V2, Dfs.47740.y, col = fs.col, lwd = lwidth)
lines(Dsi.47740$V2, Dsi.47740.y, col = si.col, lwd = lwidth)

legend(0, 0.275, all.names,
       col = all.cols,
       bty = "n",
       lty = 1,
       cex = 1,
       lwd = lwidth,
       text.col = talk.cols)

par(mar = c(5, 1, 4, 2) + 0.1)

empty.plot(xlabel = xlabel, ylabel = "", xlimit = xlim.47741, ylimit = ylim.47741, lab.color = talk.cols, lab.size = 1.5)

axis(1,
     col = talk.cols,
     col.axis = talk.cols,
     cex.axis = 1.5,
     lwd = 2)

lines(Dfi.47741$V2, Dfi.47741.y, col = fi.col, lwd = lwidth)
lines(Dfs.47741$V2, Dfs.47741.y, col = fs.col, lwd = lwidth)
lines(Dsi.47741$V2, Dsi.47741.y, col = si.col, lwd = lwidth)

dev.off()
