
library(GenABEL)

args <- commandArgs(trailingOnly = TRUE)

pvalue.in <- args[1]
qq.out <- args[2]
pcolumn <- args[3]

data <- read.table(pvalue.in, header = T)

png(qq.out)

estlambda(data[, pcolumn], plot = T)

dev.off()
