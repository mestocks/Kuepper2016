library(ape)

k3357out <- read.tree("KRISSFF3357_150000_160000_alnUPGMA.ph")
k3357in <- read.tree("KR3357_280000_290000_aln.ph")


k3357out.boot <- read.tree("RAxML_bestTree.KRISSFF3357_150000_160000.ph")
k3913out.boot <- read.tree("RAxML_bestTree.KRISSFF3913_150000_160000.ph")
k3357in.boot <- read.tree("RAxML_bestTree.KR3357_280000_290000.ph")
k3208.boot <- read.tree("RAxML_bestTree.KRISSFF3208.ph")

xlimit <- 0.15
ylimit <- c(0, 7)

black <- "grey25"
tip.cex <- 1.4
adj.tree <- -0.2
lwidth <- 1.4

plot(k3913out.boot, x.lim = xlimit, y.lim = ylimit, show.tip.label = FALSE, edge.width = lwidth, edge.color = black)
                                        #, x.lim = xlimit)
tiplabels(c("independent1",
            "Faeder2",
            "Faeder1",
            "Satellite1",
            "independent2",
            "Satellite2",
            "Killdeer"),
          frame = "none",
          adj = adj.tree,
          cex = tip.cex,
          col = c("goldenrod", "tomato3", "tomato3", "steelblue", "goldenrod", "steelblue", "black"))

#text(-0.001, 1, labels = "b", font = 2, cex = 1.5)
mtext("b", side = 2, line = 2, cex = 2, font = 2, at = 9, las = 1)

plot(k3357in.boot, x.lim = xlimit, y.lim = ylimit, show.tip.label = FALSE, edge.width = lwidth, edge.color = black)

tiplabels(c("independent1",
            "independent2",
            "Satellite1",
            "Satellite2",
            "Faeder1",
            "Faeder2",
            "Killdeer"),
          frame = "none",
          adj = adj.tree,
          cex = tip.cex,
          col = c("goldenrod", "goldenrod", "steelblue", "steelblue", "tomato3", "tomato3", "black"))

#text(-0.001, 1, labels = "c", font = 2, cex = 1.5)
mtext("c", side = 2, line = 2, cex = 2, font = 2, at = 9, las = 1)

plot(k3208.boot, x.lim = xlimit, y.lim = ylimit, show.tip.label = FALSE, edge.width = lwidth, edge.color = black)

tiplabels(c("independent1",
            "Satellite2",
            "Satellite1",
            "independent2",
            "Faeder2",
            "Faeder1",
            "Killdeer"),
          frame = "none",
          adj = adj.tree,
          cex = tip.cex,
          col = c("goldenrod", "steelblue", "steelblue", "goldenrod", "tomato3", "tomato3", "black"))

#text(-0.001, 1, labels = "d", font = 2, cex = 1.5)
mtext("d", side = 2, line = 2, cex = 2, font = 2, at = 9, las = 1)
