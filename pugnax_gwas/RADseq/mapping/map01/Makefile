###### ######

USR = $(shell echo $$USER)
PTH = /data/$(USR)/ruff/pugnax_gwas/RADseq/mapping/

ASS = $(PTH)assemblies/
PRO = $(PTH)processed_rads/
MAP = $(PTH)mapped_rads/

ref = RUFFv0.2alt.fa KILDEER.fa

###### ######
# Stacks

tlib = 2014025_TBLib1.pools 2014025_TBLib2.pools
tpol = pooltags.txt
bar = tag_pools.txt

BLOC = $(PRO)barcodes/

TLIB = $(addprefix $(BLOC),$(tlib))
TPOL = $(addprefix $(BLOC),$(tpol))
BAR = $(addprefix $(BLOC),$(bar))

# ( ACACGACA CAGTGTGT )
ULIB = $(shell awk -F$$'\t' ' { print $$2 } ' $(TLIB))

###### ######
# Mapping

# Get unique de-multiplexed names (i.e. unique tags)
# UIND = ( sample_ACACGACA-TCATTGAG )
UIND = $(addprefix sample_,$(ULIB))

# Use list of unique names to create names for each paired-read
# IND12 = ( sample_ACACGACA-TCATTGAG.1 sample_ACACGACA-TCATTGAG.2 )
IND1 = $(addsuffix .1,$(UIND))
IND2 = $(addsuffix .2,$(UIND))
IND12 = $(IND1) $(IND2)

# Add extensions for different file types
# pfq =  ( sample_ACACGACA.1.fq sample_ACACGACA.2.fq ) 
# mfq =  ( $(refnam)_ACACGACA.1.fq $(refnam)_ACACGACA.2.fq ) 
# sai = ( $(refnam)_ACACGACA.1.sai $(refnam)_ACACGACA.2.sai )
# bam = ( $(refnam)_ACACGACA.bam )
# bai = ( $(refnam)_ACACGACA.bam.bai )

pfq = $(addsuffix .fq,$(IND12))

# REFLIB = ( RUFFv0.2_ACACGACA KILDEER_ACACGACA )
refnam = $(subst .fa,,$(ref))
REFLIB = $(foreach r,$(refnam),$(addprefix $(r)_,$(ULIB)))

rind1 = $(addsuffix .1,$(REFLIB))
rind2 = $(addsuffix .2,$(REFLIB))
rind12 = $(rind1) $(rind2)

mfq = $(addsuffix .fq,$(rind12))
sai = $(addsuffix .sai,$(rind12))
bam = $(addsuffix .bam,$(REFLIB))
bai = $(addsuffix .bai,$(bam))
fbam = $(addsuffix .txt,$(REFLIB))

# Add prefixes
REF = $(addprefix $(ASS),$(ref))
PFQ = $(addprefix $(PRO),$(pfq))

MFQ = $(addprefix $(MAP),$(mfq))
SAI = $(addprefix $(MAP),$(sai))

uBAM = $(addprefix $(MAP)unsorted_,$(bam))

BAM = $(addprefix $(MAP),$(bam))
BAI = $(addprefix $(MAP),$(bai))
FBAM = $(addprefix $(MAP)filter_stats_,$(fbam))


############# #############
##
## Map rads to reference and filters
##
##
## Input:     assemblies/RUFFv0.2.fa
##            processed_rads/s002/sample_*.1.fq
##            processed_rads/s002/sample_*.2.fq
##
## Output:    mapped_rads/m002/RUFFv0.2_*.bam[.bai]
##
## Stats:     mapped_rads/m002/RUFFv0.2_bamstats.txt
##
## Programs:  bwa v0.7.10-r789
##            samtools v0.1.19-44428cd
##            stampy v1.0.23 (r2059)
##
## Scripts:   -
##
############# #############


###### ######

.PHONY:	sampe
sampe:	$(uBAM)

$(MAP)unsorted_$(refnam)_%.bam:	$(MAP)$(refnam)_%.1.sai $(MAP)$(refnam)_%.2.sai $(MAP)$(refnam)_%.1.fq $(MAP)$(refnam)_%.2.fq
	bwa sampe $(REF) $^ | samtools view -Sb - > $@


###### ######


.PHONY:	aln
aln:	$(SAI)

$(MAP)$(refnam)_%.sai:	$(MAP)$(refnam)_%.fq
	bwa aln $(REF) $^ > $@


###### ######


.PHONY:	alt-name
alt-name:	$(MFQ)

$(MAP)$(refnam)_%.1.fq:	$(PRO)sample_%.1.fq
	awk ' { if ($$0 ~ "^@.*_1$$") { $$0=substr($$0, 0, length($$0)-2) } print $$0 } ' $^ > $@

$(MAP)$(refnam)_%.2.fq:	$(PRO)sample_%.2.fq
	awk ' { if ($$0 ~ "^@.*_2$$") { $$0=substr($$0, 0, length($$0)-2) } print $$0 } ' $^ > $@


###### ######


.PHONY:	index
index:	$(REF).amb

$(ASS)%.fa.amb:	$(ASS)%.fa
	bwa index $^

