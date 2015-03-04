source("gwas_functions.r")

args <- commandArgs(trailingOnly = TRUE)

pval.in <- args[1]
sig.in <- args[2]
plot.out <- args[3]

pvals <- read.table(pval.in, header = T)
svals <- read.table(sig.in, header = T)

pvals$point.colors <- "grey65"
pvals$point.colors[svals$emp1 < 0.0005] <- "tomato3"

png(plot.out, width = 700, height = 480)

plot.manhatten(pvals$gpos, pvals$DOM, pvals$point.colors)

dev.off()
