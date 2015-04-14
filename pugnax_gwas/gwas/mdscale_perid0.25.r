library(GenABEL)
source("gwas_functions.r")

args <- commandArgs(trailingOnly = TRUE)

gen.in <- args[1]
phe.in <- args[2]
man.out <- args[3]

ruff <- load_and_qc(phe.in, gen.in, maf = 0, call = 0, perid.call = 0.25)
#ruff <- load.gwaa.data(phe = phe.in, gen = gen.in, force = T)

ruff.gkin <- ibs(ruff, weight = "freq")
ruff.dist <- as.dist(0.5 - ruff.gkin)
ruff.cmd <- cmdscale(ruff.dist)

mcolors <- phdata(ruff)$colour

png(man.out)

plot(ruff.cmd, col = mcolors, pch = 20, cex = 1.5)

dev.off()
