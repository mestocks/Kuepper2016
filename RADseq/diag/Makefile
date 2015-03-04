USR = $(shell echo $$USER)
PTH = /data/$(USR)/ruff/pugnax_gwas/RADseq/diag/

ASS = $(PTH)assemblies/
DAG = $(PTH)diag01/

ref = RUFFv0.2.fa
REF = $(ASS)$(ref)

###### ######

.PHONY:	diag-ped
diag-ped:	$(DAG)all_fae_batch_2b.bed $(DAG)all_sat_batch_2b.bed

$(DAG)all_fae_batch_2b.bed:	$(DAG)batch_2bsstats.txt
	awk -F"\t" ' BEGIN { OFS="\t" }; { if ($$14 == "fae" && $$4 + $$7 > 5 && $$5 + $$8 > 5 && $$6 + $$9 > 5) print $$1,$$2,$$3,"FAE="$$4","$$7";SAT="$$5","$$8";IND="$$6","$$9 } ' $^ > $@

$(DAG)all_sat_batch_2b.bed:	$(DAG)batch_2bsstats.txt
	awk -F"\t" ' BEGIN { OFS="\t" }; { if ($$14 == "sat" && $$5 + $$8 > 5 && $$6 + $$9 > 5) print $$1,$$2,$$3,"FAE="$$4","$$7";SAT="$$5","$$8";IND="$$6","$$9 } ' $^ > $@


###### ######


.PHONY:	diag-snps
diag-snps:	$(DAG)fae_1k_r1bm_RUFFv0.2.bed $(DAG)sat_1k_r1bm_RUFFv0.2.bed $(DAG)fae_rsdist_r1bm_RUFFv0.2.bed $(DAG)sat_rsdist_r1bm_RUFFv0.2.bed $(DAG)fae_r1bm_RUFFv0.2.bed $(DAG)sat_r1bm_RUFFv0.2.bed


$(DAG)fae_1k_r1bm_RUFFv0.2.bed:	$(DAG)fae_rsdist_r1bm_RUFFv0.2.bed
	awk ' { if ($$8 < 1000) print $$0 } ' $^ > $@

$(DAG)sat_1k_r1bm_RUFFv0.2.bed:	$(DAG)sat_rsdist_r1bm_RUFFv0.2.bed
	awk ' { if ($$8 < 1000) print $$0 } ' $^ > $@


$(DAG)fae_rsdist_r1bm_RUFFv0.2.bed:	$(DAG)fae_r1bm_RUFFv0.2.bed $(DAG)rsites.bed
	bedtools closest -a $(word 1,$^) -b $(word 2,$^) -d > $@


$(DAG)sat_rsdist_r1bm_RUFFv0.2.bed:	$(DAG)sat_r1bm_RUFFv0.2.bed $(DAG)rsites.bed
	bedtools closest -a $(word 1,$^) -b $(word 2,$^) -d > $@


$(DAG)fae_r1bm_RUFFv0.2.bed:	$(DAG)r1bm_RUFFv0.2sstats.txt
	awk -F"\t" ' BEGIN { OFS="\t" }; { if ($$1 == "Contig1270" || $$1 == "Contig2063" || $$1 == "Contig3047" || $$1 == "Contig3208" || $$1 == "Contig3357" || $$1 == "Contig3750" || $$1 == "Contig3913" || $$1 == "Contig4111" || $$1 == "Contig4944" || $$1 == "Contig9013") { if ($$14 == "fae" && $$4 + $$7 > 5 && $$5 + $$8 > 5 && $$6 + $$9 > 5) print $$1,$$2,$$3,"FAE="$$4","$$7";SAT="$$5","$$8";IND="$$6","$$9 } } ' $^ > $@

$(DAG)sat_r1bm_RUFFv0.2.bed:	$(DAG)r1bm_RUFFv0.2sstats.txt
	awk -F"\t" ' BEGIN { OFS="\t" }; { if ($$1 == "Contig1270" || $$1 == "Contig2063" || $$1 == "Contig3047" || $$1 == "Contig3208" || $$1 == "Contig3357" || $$1 == "Contig3750" || $$1 == "Contig3913" || $$1 == "Contig4111" || $$1 == "Contig4944" || $$1 == "Contig9013") { if ($$14 == "sat" && $$5 + $$8 > 5 && $$6 + $$9 > 5) print $$1,$$2,$$3,"FAE="$$4","$$7";SAT="$$5","$$8";IND="$$6","$$9 } } ' $^ > $@


#$(DAG)all_r1bm_RUFFv0.2.bed:	$(DAG)batch_2bsstats.txt
#	awk -F"\t" ' BEGIN { OFS="\t" }; { if ($$14 == "fae" && $$4 + $$7 > 5 && $$5 + $$8 > 5 && $$6 + $$9 > 5) print $$1,$$2,$$3,"FAE="$$4","$$7";SAT="$$5","$$8";IND="$$6","$$9 } ' $^ > $@

#$(DAG)all_sat_r1bm_RUFFv0.2.bed:	$(DAG)batch_2bsstats.txt
#	awk -F"\t" ' BEGIN { OFS="\t" }; { if ($$14 == "sat" && $$5 + $$8 > 5 && $$6 + $$9 > 5) print $$1,$$2,$$3,"FAE="$$4","$$7";SAT="$$5","$$8";IND="$$6","$$9 } ' $^ > $@

###### ######

Sbf1 = CCTGCAGG GGACGTCC

rsite = $(addprefix $(DAG),$(Sbf1))
RSITE = $(addsuffix .bed,$(rsite))

.PHONY:	res-sites
res-sites:	$(DAG)rsites.bed $(RSITE)

$(DAG)rsites.bed:	$(RSITE)
	cat $^ | sort -k 1,1 -k 2,2n > $@

$(DAG)%.bed:	$(REF)
	gstawk -c "$*" $^ | awk -F"\t" ' { if ($$1 == "Contig1270" || $$1 == "Contig2063" || $$1 == "Contig3047" || $$1 == "Contig3208" || $$1 == "Contig3357" || $$1 == "Contig3750" || $$1 == "Contig3913" || $$1 == "Contig4111" || $$1 == "Contig4944" || $$1 == "Contig9013") print $$0 } ' > $@

