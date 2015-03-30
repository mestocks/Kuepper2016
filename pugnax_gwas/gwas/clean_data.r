
library(GenABEL)

source("gwas_functions.r")

args <- commandArgs(trailingOnly = TRUE)

phe.in <- args[1]
gen.in <- args[2]
phe.out <- args[3]
gen.out <- args[4]

data <- load_and_qc(phe.in, gen.in, qc = FALSE)

quality <- check.marker(data, 
                        call = 0.5, 
                        p.level = 1e-5, 
                        perid.call = 0, 
                        extr.call = 0, 
                        extr.perid.call = 0, 
                        maf = 0, 
                        ibs.exclude = "none")

data.clean <- data[quality$idok, quality$snpok]

save.gwaa.data(data.clean, phenofile = phe.out, genofile = gen.out)
