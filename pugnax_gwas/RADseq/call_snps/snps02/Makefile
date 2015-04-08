###### ######

USR = $(shell echo $$USER)
PTH = /data/$(USR)/ruff/pugnax_gwas/RADseq/call_snps/snps02/

ASS = $(PTH)assemblies/
PRO = $(PTH)processed_rads/cons001/
FBAM = $(PTH)filtered_bam/
ALN = $(PTH)alignments/

BLOC = $(PRO)barcodes/

###### ######

tlib = 2014025_TBLib1.pools 2014025_TBLib2.pools
TLIB = $(addprefix $(BLOC),$(tlib))
ULIB = $(shell awk -F$$'\t' ' { print $$2 } ' $(TLIB))

ref = RUFFv0.2.fa
#ref = RUFFv0.2alt.fa
#ref = Charadrius_vociferus.fa
#ref = KILDEER.fa
#ref = all_contigs.fa

refnam = $(subst .fa,,$(ref))
REFLIB = $(foreach r,$(refnam),$(addprefix $(r)_,$(ULIB)))

######

bam = $(addsuffix .bam,$(REFLIB))
bai = $(addsuffix .bam.bai,$(REFLIB))

bmBAM = $(addprefix $(FBAM)bm_,$(bam))
bmBAI = $(addprefix $(FBAM)bm_,$(bai))

###### ######

allaln = $(addprefix $(ALN)all_,$(refnam))
allALN = $(addsuffix .vcf.gz,$(allaln))

varaln = $(addprefix $(ALN)var_,$(refnam))
varALN = $(addsuffix .vcf.gz,$(varaln))

.PHONY:	mpileup
mpileup:	$(varALN) $(allALN)

$(ALN)var_%.vcf.gz:	$(FBAM)bm_%_*.bam
	samtools mpileup -f $(ASS)$*.fa -Dsg $^ | bcftools view -v -g - | gzip > $@

$(ALN)all_%.vcf.gz:	$(FBAM)bm_%_*.bam
	samtools mpileup -f $(ASS)$*.fa -Dsg $^ | bcftools view -g - | gzip > $@
