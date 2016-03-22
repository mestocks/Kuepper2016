args <- commandArgs(trailingOnly = TRUE)

tped.in <- args[1]
tfam.in <- args[2]
raw.out <- args[3]

library(GenABEL)

convert.snp.tped(tped.in, tfam.in, raw.out)
