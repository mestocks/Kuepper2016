###### ######

USR = $(shell echo $$USER)
PTH = /data/$(USR)/ruff/pugnax_gwas/RADseq/bamstats/

PRO = $(PTH)processed_rads/
MAP = $(PTH)mapped_rads/
FBAM = $(PTH)filtered_bam/

BLOC = $(PRO)barcodes/

###### ######

tlib = 2014025_TBLib1.pools 2014025_TBLib2.pools
TLIB = $(addprefix $(BLOC),$(tlib))
ULIB = $(shell awk -F$$'\t' ' { print $$2 } ' $(TLIB))

###### ######

ref = RUFFv0.2.fa
#RUFFv0.2alt.fa
#KILDEER.fa

refnam = $(subst .fa,,$(ref))
REFLIB = $(foreach r,$(refnam),$(addprefix $(r)_,$(ULIB)))






######

#.PHONY:	ndp7
#ndp7:	$(MAP)$(refnam)_rmd.ndp7 $(MAP)r1us_$(refnam)_rmd.ndp7 $(MAP)r2us_$(refnam)_rmd.ndp7 $(MAP)raw_$(refnam).ndp7 $(MAP)r1_$(refnam).ndp7 $(MAP)r2_$(refnam).ndp7

#$(MAP)%.ndp7:	$(MAP)%.ninds
#	awk -F"\t" ' { if ($$3 != 0) a++ }; END { print a } ' $^ > $@ 


#.PHONY:	ninds
#ninds:	$(MAP)$(refnam)_rmd.ninds $(MAP)r1us_$(refnam)_rmd.ninds $(MAP)r2us_$(refnam)_rmd.ninds $(MAP)raw_$(refnam).ninds $(MAP)r1_$(refnam).ninds $(MAP)r2_$(refnam).ninds

#$(MAP)%.ninds:	$(MAP)%.dp
#	awk -F"\t" ' BEGIN { OFS="\t" }; { a=0; for (i=3; i<=NF; i++) { if ($$i > 7) a++ } print $$1,$$2,a } ' $^ > $@



###### ######


#.PHONY:	depth
#depth:	$(MAP)r1_$(refnam).dp $(MAP)r2_$(refnam).dp
#depth:	$(MAP)$(refnam)_rmd.dp $(MAP)r1us_$(refnam)_rmd.dp $(MAP)r2us_$(refnam)_rmd.dp $(MAP)raw_$(refnam).dp $(MAP)r1_$(refnam).dp $(MAP)r2_$(refnam).dp

#$(MAP)r1us_$(refnam)_rmd.dp:	$(rmd1BAM)
#	samtools depth $^ > $@

#$(MAP)r2us_$(refnam)_rmd.dp:	$(rmd2BAM)
#	samtools depth $^ > $@

#$(MAP)r1_$(refnam).dp:	$(r1BAM)
#	samtools depth $^ > $@

#$(MAP)r2_$(refnam).dp:	$(r2BAM)
#	samtools depth $^ > $@

#$(MAP)$(refnam)_rmd.dp:	$(rmdBAM)
#	samtools depth $^ > $@

#$(MAP)raw_$(refnam).dp:	$(rawBAM)
#	samtools depth $^ > $@
