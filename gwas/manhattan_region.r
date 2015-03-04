
source("gwas_functions.r")

args <- commandArgs(trailingOnly = TRUE)

pval.in <- args[1]
sig.in <- args[2]
plot.col <- args[3]
sig.col <- args[4]
plot.out <- args[5]

pvals <- read.table(pval.in, header = T)
sigvals <- read.table(sig.in, header = T)



pvals$point.colors <- "grey65"
pvals$point.colors[sigvals[, sig.col] < 0.05] <- "tomato3"

png(plot.out, width = 700, height = 480)

plot.manhatten(pvals$GenomePosition, pvals[, plot.col], pvals$point.colors)


dev.off()
