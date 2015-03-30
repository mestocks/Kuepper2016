
source("gwas_functions.r")

args <- commandArgs(trailingOnly = TRUE)

pval.in <- args[1]
plot.out <- args[2]

pvals <- read.table(pval.in, header = T)

pvals$point.colors <- "grey65"
pvals$point.colors[pvals$emp1 < 0.001] <- "tomato3"

png(plot.out, width = 700, height = 480)

plot.manhatten(pvals$gpos, pvals$pval, pvals$point.colors)

dev.off()
