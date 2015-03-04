library(GenABEL)

source("gwas_functions.r")

args <- commandArgs(trailingOnly = TRUE)

gen.in <- args[1]
phe.in <- args[2]
pvalues.out <- args[3]
trait.col <- args[4]
model <- args[5]

gwa.data <- load.gwaa.data(phe = phe.in, gen = gen.in, force = TRUE)

trait.type <- "binomial"

frm <- as.formula(paste(trait.col, " ~ 1"))

snps <- mlreg(frm,
                data = gwa.data,
                trait.type = trait.type,
                gtmode = model)

write.pvalues(snps, pvalues.out)
