###### ######

USR = $(shell echo $$USER)
PTH = /data/$(USR)/ruff/pugnax_gwas/RADseq/ref_map/rmap02/

ASS = $(PTH)assemblies/
RAD = $(PTH)raw_rads/
PRO = $(PTH)processed_rads/
MAP = $(PTH)mapped_rads/
ALN = $(PTH)alignments/
POP = $(PTH)pop/

BLOC = $(PRO)barcodes/

###### ######

tlib = 2014025_TBLib1.pools 2014025_TBLib2.pools
TLIB = $(addprefix $(BLOC),$(tlib))
ULIB = $(shell awk -F$$'\t' ' { print $$2 } ' $(TLIB))

ref = RUFFv0.2.fa
nrm = RUFFv0.2.fa
alt = RUFFv0.2alt.fa
#ref = RUFFv0.2.fa
#ref = Charadrius_vociferus.fa
#ref = KILDEER.fa
#ref = all_contigs.fa

REF = $(addprefix $(ASS),$(ref))

refnam = $(subst .fa,,$(ref))
altnam = $(subst .fa,,$(alt))
nrmnam = $(subst .fa,,$(nrm))
REFLIB = $(foreach r,$(refnam),$(addprefix $(r)_,$(ULIB)))

altLIB = $(foreach r,$(altnam),$(addprefix $(r)_,$(ULIB)))
nrmLIB = $(foreach r,$(nrmnam),$(addprefix $(r)_,$(ULIB)))

bam = $(addsuffix .bam,$(REFLIB))
bai = $(addsuffix .bam.bai,$(REFLIB))



altbam = $(addsuffix .bam,$(altLIB))
altbai = $(addsuffix .bam.bai,$(altLIB))

nrmbam = $(addsuffix .bam,$(nrmLIB))
nrmbai = $(addsuffix .bam.bai,$(nrmLIB))

bmBAM = $(addprefix $(MAP)bm_,$(bam))

r1BAM = $(addprefix $(MAP)r1_,$(bam))
r1BAI = $(addprefix $(MAP)r1_,$(bai))

r1nrmBAM = $(addprefix $(MAP)r1_,$(nrmbam))
r1nrmBAI = $(addprefix $(MAP)r1_,$(nrmbai))

r1altBAM = $(addprefix $(MAP)r1_,$(altbam))
r1altBAI = $(addprefix $(MAP)r1_,$(altbai))

###### ######

.PHONY:	refmap
refmap:	$(POP)r1_RUFFv0.2/cout2.txt
#$(POP)r1_RUFFv0.2alt/cout2.txt 
$(POP)r1_RUFFv0.2/cout2.txt:	$(r1nrmBAM)
	ref_map.pl -S -b 1 $(addprefix -s ,$^) -o $(@D)

$(POP)r1_RUFFv0.2alt/cout2.txt:	$(r1altBAM)
	ref_map.pl -S -b 1 $(addprefix -s ,$^) -o $(@D)


.PHONY:	plp
plp:	$(ALN)bm_$(refnam).vcf.gz $(ALN)r1bm_$(refnam).vcf.gz $(ALN)allr1bm_$(refnam).vcf.gz $(ALN)allr1bm_Contig47740_RUFFv0.2alt.vcf.gz $(ALN)allr1bm_Contig47741_RUFFv0.2alt.vcf.gz $(ALN)allr1bm_Contig1270_RUFFv0.2.vcf.gz $(ALN)allr1bm_Contig2063_RUFFv0.2.vcf.gz $(ALN)allr1bm_Contig3047_RUFFv0.2.vcf.gz $(ALN)allr1bm_Contig3208_RUFFv0.2.vcf.gz $(ALN)allr1bm_Contig3357_RUFFv0.2.vcf.gz $(ALN)allr1bm_Contig3750_RUFFv0.2.vcf.gz $(ALN)allr1bm_Contig3913_RUFFv0.2.vcf.gz $(ALN)allr1bm_Contig4944_RUFFv0.2.vcf.gz $(ALN)allr1bm_Contig9013_RUFFv0.2.vcf.gz

$(ALN)bm_$(refnam).vcf.gz:	$(bmBAM)
	samtools mpileup -f $(REF) -DSg $^ | bcftools view -v -g - | gzip > $@

$(ALN)r1bm_$(refnam).vcf.gz:	$(r1BAM)
	samtools mpileup -f $(REF) -DSg $^ | bcftools view -v -g - | gzip > $@

$(ALN)allr1bm_$(refnam).vcf.gz:	$(r1BAM)
	samtools mpileup -f $(REF) -DSg $^ | bcftools view -g - | gzip > $@

##

$(ALN)allr1bm_Contig47740_RUFFv0.2alt.vcf.gz:	$(r1altBAM)
	samtools mpileup -r Contig47740 -f $(REF) -DSg $^ | bcftools view -g - | gzip > $@

$(ALN)allr1bm_Contig47741_RUFFv0.2alt.vcf.gz:	$(r1altBAM)
	samtools mpileup -r Contig47741 -f $(REF) -DSg $^ | bcftools view -g - | gzip > $@

##

$(ALN)allr1bm_Contig1270_RUFFv0.2.vcf.gz:	$(r1nrmBAM)
	samtools mpileup -r Contig1270 -f $(REF) -DSg $^ | bcftools view -g - | gzip > $@

$(ALN)allr1bm_Contig2063_RUFFv0.2.vcf.gz:	$(r1nrmBAM)
	samtools mpileup -r Contig2063 -f $(REF) -DSg $^ | bcftools view -g - | gzip > $@

$(ALN)allr1bm_Contig3047_RUFFv0.2.vcf.gz:	$(r1nrmBAM)
	samtools mpileup -r Contig3047 -f $(REF) -DSg $^ | bcftools view -g - | gzip > $@

$(ALN)allr1bm_Contig3208_RUFFv0.2.vcf.gz:	$(r1nrmBAM)
	samtools mpileup -r Contig3208 -f $(REF) -DSg $^ | bcftools view -g - | gzip > $@

$(ALN)allr1bm_Contig3357_RUFFv0.2.vcf.gz:	$(r1nrmBAM)
	samtools mpileup -r Contig3357 -f $(REF) -DSg $^ | bcftools view -g - | gzip > $@

$(ALN)allr1bm_Contig3750_RUFFv0.2.vcf.gz:	$(r1nrmBAM)
	samtools mpileup -r Contig3750 -f $(REF) -DSg $^ | bcftools view -g - | gzip > $@

$(ALN)allr1bm_Contig3913_RUFFv0.2.vcf.gz:	$(r1nrmBAM)
	samtools mpileup -r Contig3913 -f $(REF) -DSg $^ | bcftools view -g - | gzip > $@

$(ALN)allr1bm_Contig4944_RUFFv0.2.vcf.gz:	$(r1nrmBAM)
	samtools mpileup -r Contig4944 -f $(REF) -DSg $^ | bcftools view -g - | gzip > $@

$(ALN)allr1bm_Contig9013_RUFFv0.2.vcf.gz:	$(r1nrmBAM)
	samtools mpileup -r Contig9013 -f $(REF) -DSg $^ | bcftools view -g - | gzip > $@
