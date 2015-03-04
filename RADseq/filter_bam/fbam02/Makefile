###### ######

USR = $(shell echo $$USER)
PTH = /data/$(USR)/ruff/pugnax_gwas/RADseq/filter_bam/fbam02/

PRO = $(PTH)processed_rads/
MAP = $(PTH)mapped_rads/

BLOC = $(PRO)barcodes/

###### ######

tlib = 2014025_TBLib1.pools 2014025_TBLib2.pools
TLIB = $(addprefix $(BLOC),$(tlib))
ULIB = $(shell awk -F$$'\t' ' { print $$2 } ' $(TLIB))

###### ######

ref = RUFFv0.2.fa RUFFv0.2alt.fa
#KILDEER.fa

refnam = $(subst .fa,,$(ref))
REFLIB = $(foreach r,$(refnam),$(addprefix $(r)_,$(ULIB)))

exc = $(addsuffix .txt,$(REFLIB))
EXC = $(addprefix $(MAP)exc_,$(exc))

bam = $(addsuffix .bam,$(REFLIB))
bai = $(addsuffix .bam.bai,$(REFLIB))

rbam = $(addsuffix _rmd.bam,$(REFLIB))
rbai = $(addsuffix _rmd.bam.bai,$(REFLIB))

bmBAM = $(addprefix $(MAP)bm_,$(bam))
bmBAI = $(addprefix $(MAP)bm_,$(bai))

pmBAM = $(addprefix $(MAP)upm_,$(bam))
pmBAI = $(addprefix $(MAP)upm_,$(bai))

r1BAM = $(addprefix $(MAP)r1_,$(bam))
r1BAI = $(addprefix $(MAP)r1_,$(bai))

rmdBAM = $(addprefix $(MAP),$(rbam))
rmdBAI = $(addprefix $(MAP),$(rbai))

bmStat = $(subst .bam,.stat,$(bmBAM))
rmdStat = $(subst .bam,.stat,$(rmdBAM))


###### #####

.PHONY:	bamstat
bamstat:	$(bmStat)

$(MAP)bmrmdStats.txt:	$(bmStat)
	cat $^ > $@

$(MAP)%.stat:	$(MAP)%.bam
	samtools view $^ | awk ' { a++ }; END { print "$^",a }' > $@

###### ######

.PHONY:	rem-dup
rem-dup:	$(rmdBAM) $(rmdBAI)

$(MAP)%_rmd.bam.bai:	$(MAP)%_rmd.bam
	samtools index $^

$(MAP)%_rmd.bam:	$(MAP)unsorted_%_rmd.bam
	samtools sort $^ $(MAP)$*_rmd

$(MAP)unsorted_%_rmd.bam:	$(MAP)bm_%.bam
	samtools rmdup $^ $@

.PHONY:	r1-filt
r1-filt:	$(r1BAM) $(r1BAI)

$(MAP)r1_%.bam.bai:	$(MAP)r1_%.bam
	samtools index $^

$(MAP)r1_%.bam:	$(MAP)ur1_%.bam
	samtools sort $^ $(MAP)r1_$*

$(MAP)ur1_%.bam:	$(MAP)bm_%.bam
	samtools view -bh -f 64 $^ > $@


###### ######

.PHONY:	basic-filt
basic-filt:	$(pmBAM) $(EXC) $(bmBAM) $(bmBAI)


$(MAP)bm_%.bam.bai:	$(MAP)bm_%.bam
	samtools index $^

$(MAP)bm_%.bam:	$(MAP)ubm_%.bam
	samtools sort $^ $(MAP)bm_$*

$(MAP)ubm_%.bam:	$(MAP)exc_%.txt $(MAP)upm_%.bam
	samtools view -h $(word 2,$^) | grep -Fv -f $(word 1,$^) | samtools view -Sb - > $@

# Create a list of read ids to exclude. This is to ensure that the read and its
# mate is removed, and ensuring that we still have pairs of reads present. 

$(MAP)exc_%.txt:	$(MAP)badq_%.txt $(MAP)talign_%.txt
	cat $^ | sort | uniq > $@

# Get ids of reads that are not uniquely mapped
#$(MAP)nuniq_%.txt:	$(MAP)upm_%.bam
#	samtools view $^ | grep "XT:A:U" -v | awk ' { print $$1 } ' > $@

# Ids of reads with mapq < 30
$(MAP)badq_%.txt:	$(MAP)upm_%.bam
	samtools view $^ | awk ' { if ($$5 < 30) print $$1 } ' > $@

# Ids of reads with terminal alignments (bad for stacks)
$(MAP)talign_%.txt:	$(MAP)upm_%.bam
	samtools view $^ | awk ' { if ($$6 ~ "S$$") print $$1 } ' > $@

# The filtering seems to work on an AND basis, so
# there should not be any -f 4, or -f 8 present
$(MAP)upm_%.bam:	$(MAP)mraw_%.bam
	samtools view -b -f 3 -F 12 $^ > $@
