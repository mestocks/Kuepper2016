
library(GenABEL)

source("gwas_functions.r")

args <- commandArgs(trailingOnly = TRUE)

gen.in <- args[1]
phe.in <- args[2]
pvalues.out <- args[3]
trait.col <- args[4]
nprems <- as.integer(args[5])
do.ibs <- as.logical(args[6])

gwa.data <- load.gwaa.data(phe = phe.in, gen = gen.in, force = TRUE)

trait.type <- "binomial"

frm <- as.formula(paste(trait.col, " ~ 1"))

if (do.ibs == TRUE) {

  gkin <- ibs(gwa.data, w = "no")
  mds <- cmdscale(as.dist(0.5 - gkin))
  frm <- as.formula(paste(trait.col, " ~ mds[, 1] + mds[, 2]"))

}

snps <- qtscore(frm,
                data = gwa.data,
                trait = trait.type,
                times = nprems)

write.pvalues(snps, pvalues.out)
