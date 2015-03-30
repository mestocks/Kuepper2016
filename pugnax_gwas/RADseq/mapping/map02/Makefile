###### ######

USR = $(shell echo $$USER)
PTH = /data/$(USR)/ruff/pugnax_gwas/RADseq/mapping/map02/

ASS = $(PTH)assemblies/
PRO = $(PTH)processed_rads/
MAP = $(PTH)mapped_rads/
BLOC = $(PRO)barcodes/

ref = RUFFv0.2.fa
ref = RUFFv0.2.fa RUFFv0.2alt.fa
#KILDEER.fa

###### ######

tlib = 2014025_TBLib1.pools 2014025_TBLib2.pools

TLIB = $(addprefix $(BLOC),$(tlib))

# ( ACACGACA CAGTGTGT )
ULIB = $(shell awk -F$$'\t' ' { print $$2 } ' $(TLIB))

###### ######

refnam = $(subst .fa,,$(ref))
REFLIB = $(foreach r,$(refnam),$(addprefix $(r)_,$(ULIB)))

rind1 = $(addsuffix .1,$(REFLIB))
rind2 = $(addsuffix .2,$(REFLIB))
rind12 = $(rind1) $(rind2)

mfq = $(addsuffix .fq,$(rind12))
sai = $(addsuffix .sai,$(rind12))
bam = $(addsuffix .bam,$(REFLIB))
bai = $(addsuffix .bai,$(REFLIB))

# Add prefixes
REF = $(addprefix $(ASS),$(ref))
MFQ = $(addprefix $(MAP),$(mfq))
SAI = $(addprefix $(MAP),$(sai))
BAM =  $(addprefix $(MAP)raw_,$(bam))
mBAM =  $(addprefix $(MAP)mraw_,$(bam))
mBAI =  $(addprefix $(MAP)mraw_,$(bai))
BAI =  $(addprefix $(MAP)raw_,$(bai))
uBAM = $(addprefix $(MAP)unsorted_,$(bam))

iREF = $(addsuffix .amb,$(REF))

############# #############
##
## Map rads to reference and filters
##
##
## Input:     assemblies/RUFFv0.2.fa
##            processed_rads/s002/sample_*.1.fq
##            processed_rads/s002/sample_*.2.fq
##
## Output:    mapped_rads/m002/raw_RUFFv0.2_*.bam[.bai]
##
## #Stats:     mapped_rads/m002/RUFFv0.2_bamstats.txt
##
## Programs:  bwa v0.7.10-r789
##            samtools v0.1.19-44428cd
##
## Scripts:   -
##
############# #############

.PHONY:	sampe2
sampe2:	$(mBAM) $(mBAI)

$(MAP)mraw_%.bai:	$(MAP)mraw_%.bam
	samtools index $^

$(MAP)mraw_%.bam:	$(MAP)mem_%.bam
	samtools sort $^ $(MAP)mraw_$*

$(MAP)mem_%.bam:	$(MAP)%.1.fq $(MAP)%.2.fq
	bwa mem $(ASS)$(word 1,$(subst _, ,$*)).fa $^ | samtools view -Sb - > $@

###### ######

.PHONY:	sampe
sampe:	$(uBAM) $(BAM) $(BAI)

$(MAP)raw_%.bai:	$(MAP)raw_%.bam
	samtools index $^

$(MAP)raw_%.bam:	$(MAP)unsorted_%.bam
	samtools sort $^ $(MAP)raw_$*

$(MAP)unsorted_%.bam:	$(MAP)%.1.sai $(MAP)%.2.sai $(MAP)%.1.fq $(MAP)%.2.fq
	bwa sampe $(ASS)$(word 1,$(subst _, ,$*)).fa $^ | samtools view -Sb - > $@


###### ######

.PHONY:	aln
aln:	$(SAI)

$(MAP)%.sai:	$(MAP)%.fq
	bwa aln $(ASS)$(word 1,$(subst _, ,$*)).fa $^ > $@


###### ######

.PHONY:	alt-name
alt-name:	$(MFQ)

$(MAP)RUFFv0.2_%.1.fq:	$(PRO)sample_%.1.fq
	awk ' { if ($$0 ~ "^@.*_1$$") { $$0=substr($$0, 0, length($$0)-2) } print $$0 } ' $^ > $@

$(MAP)RUFFv0.2_%.2.fq:	$(PRO)sample_%.2.fq
	awk ' { if ($$0 ~ "^@.*_2$$") { $$0=substr($$0, 0, length($$0)-2) } print $$0 } ' $^ > $@

$(MAP)RUFFv0.2alt_%.1.fq:	$(PRO)sample_%.1.fq
	awk ' { if ($$0 ~ "^@.*_1$$") { $$0=substr($$0, 0, length($$0)-2) } print $$0 } ' $^ > $@

$(MAP)RUFFv0.2alt_%.2.fq:	$(PRO)sample_%.2.fq
	awk ' { if ($$0 ~ "^@.*_2$$") { $$0=substr($$0, 0, length($$0)-2) } print $$0 } ' $^ > $@

$(MAP)KILDEER_%.1.fq:	$(PRO)sample_%.1.fq
	awk ' { if ($$0 ~ "^@.*_1$$") { $$0=substr($$0, 0, length($$0)-2) } print $$0 } ' $^ > $@

$(MAP)KILDEER_%.2.fq:	$(PRO)sample_%.2.fq
	awk ' { if ($$0 ~ "^@.*_2$$") { $$0=substr($$0, 0, length($$0)-2) } print $$0 } ' $^ > $@


###### ######

.PHONY:	index
index:	$(iREF)

$(ASS)%.fa.amb:	$(ASS)%.fa
	bwa index $^

