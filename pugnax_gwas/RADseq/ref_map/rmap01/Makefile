###### ######

USR = $(shell echo $$USER)
PTH = /data/$(USR)/ruff/pugnax_gwas/RADseq/

ASS = $(PTH)assemblies/
RAD = $(PTH)raw_rads/
PRO = $(PTH)processed_rads/s002/
MAP = $(PTH)mapped_rads/m002/
ALN = $(PTH)alignments/
POP = $(PTH)ref_map/rmap01/pop/

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

#ref = RUFFv0.2alt.fa
ref = RUFFv0.2.fa
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

###### ######


#
###### ######

.PHONY:	refmap
refmap:	$(POP)cout2.txt

$(POP)cout2.txt:	$(rBAM)
	ref_map.pl -S -b 1 $(addprefix -s ,$^) -o $(@D)

