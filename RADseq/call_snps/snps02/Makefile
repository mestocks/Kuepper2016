###### ######

USR = $(shell echo $$USER)
PTH = /data/$(USR)/ruff/pugnax_gwas/RADseq/

ASS = $(PTH)assemblies/
RAD = $(PTH)raw_rads/
PRO = $(PTH)processed_rads/s002/
MAP = $(PTH)mapped_rads/m002/
ALN = $(PTH)alignments/
POP = $(PTH)pop/

PST = $(PTH)pstacks/
CST = $(PTH)cstacks/

###### ######
# Stacks

tlib = 2014025_TBLib1.pools 2014025_TBLib2.pools
tpol = pooltags.txt
bar = tag_pools.txt

BLOC = $(PRO)barcodes/

TLIB = $(addprefix $(BLOC),$(tlib))
TPOL = $(addprefix $(BLOC),$(tpol))
BAR = $(addprefix $(BLOC),$(bar))

# ( ACACGACA-TCATTGAG CAGTGTGT-TCATTGAG )
UTAG = $(shell while read p; do cat $(TLIB) | awk -F$$'\t' -v P=$$p -- ' { print $$2"-"P } ' ; done < $(TPOL))

# ( ACACGACA CAGTGTGT )
ULIB = $(shell awk -F$$'\t' ' { print $$2 } ' $(TLIB))

URUNS = $(shell ls -1 $(RAD)*1.sanfastq.gz | awk ' { gsub("$(RAD)","",$$0); gsub("_1.sanfastq.gz","",$$0); print $$0 } ')

R1 = $(addsuffix _1.sanfastq.gz,$(URUNS))
R2 = $(addsuffix _2.sanfastq.gz,$(URUNS))
gz = $(R1) $(R2)
GZ = $(addprefix $(RAD),$(gz))

STO = $(addprefix $(PRO)sout,$(URUNS))

tag1 = $(addsuffix .1.fq,$(UTAG))
tag2 = $(addsuffix .2.fq,$(UTAG))
tagRem1 = $(addsuffix .rem.1.fq,$(UTAG))
tagRem2 = $(addsuffix .rem.2.fq,$(UTAG))

stag = $(tag1) $(tag2) $(tagRem1) $(tagRem2)
STAG = $(addprefix $(PRO)allout/sample_,$(stag))

###### ######
# Mapping

ref = RUFFv0.2.fa ref = RUFFv0.2alt.fa
#ref = Charadrius_vociferus.fa
#ref = KILDEER.fa
#ref = all_contigs.fa
gal = GALLUS.fa

refnam = $(subst .fa,,$(ref))
galnam = $(subst .fa,,$(gal))

# Get unique de-multiplexed names (i.e. unique tags)
# UIND = ( sample_ACACGACA-TCATTGAG )
UIND = $(addprefix sample_,$(ULIB))

#UIND = $(shell ls -1 $(PRO)allout/sample_*.fq | grep ".rem" -v | awk -v r=$(PRO) ' { gsub(r,"",$$0); gsub(".fq","",$$0); print $$0 } ' | sort | uniq)

# Use list of unique names to create names for each paired-read
# IND12 = ( sample_ACACGACA-TCATTGAG.1 sample_ACACGACA-TCATTGAG.2 )
IND1 = $(addsuffix .1,$(UIND))
IND2 = $(addsuffix .2,$(UIND))
IND12 = $(IND1) $(IND2)

# Add extensions for different file types
# fq =  ( sample_ACACGACA-TCATTGAG.1.fq sample_ACACGACA-TCATTGAG.2.fq ) 
# sai = ( sample_ACACGACA-TCATTGAG.1.sai sample_ACACGACA-TCATTGAG.2.sai )
# bam = ( sample_ACACGACA-TCATTGAG.bam )
# bai = ( sample_ACACGACA-TCATTGAG.bam.bai )
pfq = $(addsuffix .fq,$(IND12))

REFind12 = $(subst sample_,$(refnam)_,$(IND12))
REFuind = $(subst sample_,$(refnam)_,$(UIND))

GALind12 = $(subst sample_,$(galnam)_,$(IND12))
GALuind = $(subst sample_,$(galnam)_,$(UIND))

ind12 = $(REFind12) $(GALind12)
uind = $(REFuind) $(GALuind)

#ind12 = $(REFind12)
#ind12 = $(GALind12)
#uind = $(REFuind)
#uind = $(GALuind)

mfq = $(addsuffix .fq,$(ind12))
sai = $(addsuffix .sai,$(ind12))

rmfq = $(addsuffix .fq,$(REFind12))
rsai = $(addsuffix .sai,$(REFind12))

rbam = $(addsuffix .bam,$(REFuind))
rbai = $(addsuffix .bai,$(rbam))
rfbam = $(addsuffix .txt,$(REFuind))

rpstsnps = $(addsuffix .snps.tsv.gz,$(REFuind))

gbam = $(addsuffix .bam,$(GALuind))
gbai = $(addsuffix .bai,$(gbam))
gfbam = $(addsuffix .txt,$(GALuind))

bam = $(addsuffix .bam,$(uind))
bai = $(addsuffix .bai,$(bam))
fbam = $(addsuffix .txt,$(uind))

# Add prefixes
GAL = $(addprefix $(ASS),$(gal))
REF = $(addprefix $(ASS),$(ref))
PFQ = $(addprefix $(PRO),$(pfq))

MFQ = $(addprefix $(MAP),$(mfq))
SAI = $(addprefix $(MAP),$(sai))

rMFQ = $(addprefix $(MAP),$(rmfq))
rSAI = $(addprefix $(MAP),$(rsai))

rBAM = $(addprefix $(MAP),$(rbam))
rBAI = $(addprefix $(MAP),$(rbai))
rFBAM = $(addprefix $(MAP)filter_stats_,$(rfbam))

urBAM = $(addprefix $(MAP)unsorted_,$(rbam))

rawBAM = $(addprefix $(MAP)raw_,$(rbam))
rawBAI = $(addprefix $(MAP)raw_,$(rbai))

r1BAM = $(addprefix $(MAP)r1_,$(rbam))
r1BAI = $(addprefix $(MAP)r1_,$(rbai))

r1usBAM = $(addprefix $(MAP)r1us_,$(rbam))
r1usBAI = $(addprefix $(MAP)r1us_,$(rbai))

r2BAM = $(addprefix $(MAP)r2_,$(rbam))
r2BAI = $(addprefix $(MAP)r2_,$(rbai))

r2usBAM = $(addprefix $(MAP)r2us_,$(rbam))
r2usBAI = $(addprefix $(MAP)r2us_,$(rbai))

gBAM = $(addprefix $(MAP),$(gbam))
gBAI = $(addprefix $(MAP),$(gbai))
gFBAM = $(addprefix $(MAP)filter_stats_,$(gfbam))

BAM = $(addprefix $(MAP),$(bam))
BAI = $(addprefix $(MAP),$(bai))
FBAM = $(addprefix $(MAP)filter_stats_,$(fbam))

rPSTsnps = $(addprefix $(PST),$(rpstsnps))
rPSTcin = $(addprefix $(PST),$(REFuind))

rmdBAM = $(subst .bam,_rmd.bam,$(rBAM))
rmdBAI = $(subst .bam.bai,_rmd.bam.bai,$(rBAI))

rmd1BAM = $(subst .bam,_rmd.bam,$(r1usBAM))
rmd1BAI = $(subst .bam.bai,_rmd.bam.bai,$(r1usBAI))

rmd2BAM = $(subst .bam,_rmd.bam,$(r2usBAM))
rmd2BAI = $(subst .bam.bai,_rmd.bam.bai,$(r2usBAI))

###### ######

.PHONY:	mpileup
mpileup:	$(ALN)all_r1us_$(refnam)_rmd.vcf.gz

#mpileup:	$(ALN)$(refnam).vcf.gzrmdBAM = $(subst .bam,_rmd.bam,$(rBAM))
#rmdBAI = $(subst .bam.bai,_rmd.bam.bai,$(rBAI))

# add -b if I want bcf compressed output
#$(ALN)$(refnam).vcf.gz:	$(rBAM)
#	samtools mpileup -f $(REF) -DSg $^ | bcftools view -v -g - | gzip > $@

$(ALN)all_r1us_$(refnam)_rmd.vcf.gz:	$(rmd1BAM)
	samtools mpileup -f $(REF) -DSg $^ | bcftools view -g - | gzip > $@

$(ALN)r2us_$(refnam)_rmd.vcf.gz:	$(rmd1BAM)
	samtools mpileup -f $(REF) -DSg $^ | bcftools view -v -g - | gzip > $@

#$(ALN)$(refnam)_rmd.vcf.gz:	$(rmdBAM)
#	samtools mpileup -f $(REF) -DSg $^ | bcftools view -v -g - | gzip > $@

###### ######

#$(rmdBAM) $(rmdBAI) 

.PHONY:	sampe-rmd
sampe-rmd:	$(rmd1BAM) $(rmd1BAI) $(rmd2BAM) $(rmd2BAI)

$(MAP)%_rmd.bam.bai:	$(MAP)%_rmd.bam
	samtools index $^

$(MAP)%_rmd.bam:	$(MAP)unsorted_%_rmd.bam
	samtools sort $^ $(MAP)$*_rmd

$(MAP)unsorted_%_rmd.bam:	$(MAP)%.bam
	samtools rmdup $^ $@

#


###### ######

.PHONY:	sampe-filt
sampe-filt:	$(rBAM) $(rBAI) $(rFBAM)

$(MAP)%.bam.bai:	$(MAP)%.bam
	samtools index $^

$(MAP)%.bam:	$(MAP)filtered_unsorted_%.bam
	samtools sort $^ $(MAP)$*

$(MAP)filtered_unsorted_%.bam:	$(MAP)raw_%.bam
	samtools view -h -f 3 -F 12 $^ | awk ' { if ($$6 ~ "S$$") a=1; else print $$0 } ' | grep "XT:A:U\|^@" | samtools view -Sb - > $@

###### ######

.PHONY:	sampe-filt2
sampe-filt2:	$(r1usBAM) $(r1usBAI) $(r2usBAM) $(r2usBAI)


$(MAP)r1us_%.bam.bai:	$(MAP)r1us_%.bam
	samtools index $^

$(MAP)r1us_%.bam:	$(MAP)unsorted_r1us_%.bam
	samtools sort $^ $(MAP)r1us_$*

$(MAP)unsorted_r1us_%.bam:	$(MAP)r1_%.bam
	samtools view -h $^ | awk ' { if ($$6 ~ "S$$") a=1; else print $$0 } ' | grep "XT:A:U\|^@" | samtools view -Sb - > $@


$(MAP)r2us_%.bam.bai:	$(MAP)r2us_%.bam
	samtools index $^

$(MAP)r2us_%.bam:	$(MAP)unsorted_r2us_%.bam
	samtools sort $^ $(MAP)r2us_$*

$(MAP)unsorted_r2us_%.bam:	$(MAP)r2_%.bam
	samtools view -h $^ | awk ' { if ($$6 ~ "S$$") a=1; else print $$0 } ' | grep "XT:A:U\|^@" | samtools view -Sb - > $@

###### ######

.PHONY:	sampe-filt-r12
sampe-filt-r12:	$(r1BAM) $(r2BAM) $(r1BAI) $(r2BAI)

# Index
$(MAP)r1_%.bam.bai:	$(MAP)r1_%.bam
	samtools index $^

$(MAP)r2_%.bam.bai:	$(MAP)r2_%.bam
	samtools index $^

# Sort
$(MAP)r1_%.bam:	$(MAP)unsr1_%.bam
	samtools sort $^ $(MAP)r1_$*

$(MAP)r2_%.bam:	$(MAP)unsr2_%.bam
	samtools sort $^ $(MAP)r2_$*

# Filter: properly paired & mapped, but split into 1st & 2nd reads
$(MAP)unsr1_%.bam:	$(MAP)raw_%.bam
	samtools view -b -f 67 -F 12 $^ > $@
#
$(MAP)unsr2_%.bam:	$(MAP)raw_%.bam
	samtools view -b -f 131 -F 12 $^ > $@

###### ######
#
#
#
###### ######

.PHONY:	basic-filt
basic-filt:	$(bmBAM) $(bmBAI)


$(MAP)bm_%.bam.bai:	$(MAP)bm_%.bam
	samtools index $^

$(MAP)bm_%.bam:	$(MAP)ubm_%.bam
	samtools sort $^ $(MAP)$*

$(MAP)ubm_%.bam:	$(MAP)exc_%.txt $(MAP)upm_%.bam
	samtools view -h $(word 2,$^) | grep -v -f $(word 1,$^) | samtools view -Sb - > $@

# Create a list of read ids to exclude. This is to ensure that the read and its
# mate is removed, and ensuring that we still have pairs of reads present. 

$(MAP)exc_%.txt:	$(MAP)nuniq_%.txt $(MAP)badq_%.txt $(MAP)talign_%.txt
	cat $^ > $@

# Get ids of reads that are not uniquely mapped
$(MAP)nuniq_%.txt:	$(MAP)upm_%.bam
	grep "XT:A:U" -v $^ | awk ' { print $$1 } ' > $@

# Ids of reads with mapq < 30
$(MAP)badq_%.txt:	$(MAP)upm_%.bam
	awk ' { if ($$5 < 30) print $$1 } ' $^ > $@

# Ids of reads with terminal alignments (bad for stacks)
$(MAP)talign_%.txt:	$(MAP)upm_%.bam
	awk ' { if ($$6 ~ "S$$") print $$1 } ' $^ > $@

# The filtering seems to work on an AND basis, so
# there should not be any -f 4, or -f 8 present
$(MAP)upm_%.bam:	$(MAP)mraw_%.bam
	samtools view -b -f 3 -F 12 $^ > $@


###### ######
#
#
###### ######

.PHONY:	deprecated
deprecated:	$(rawBAM) $(rawBAI)


$(MAP)raw_%.bam.bai:	$(MAP)raw_%.bam
	samtools index $^

$(MAP)raw_%.bam:	$(MAP)uraw_%.bam
	samtools sort $^ $(MAP)raw_$*
