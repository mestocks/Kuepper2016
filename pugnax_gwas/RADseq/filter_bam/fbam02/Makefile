###### ######

USR = $(shell echo $$USER)
PTH = /data/$(USR)/ruff/pugnax_gwas/RADseq/filter_bam/fbam02/

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

exc = $(addsuffix .txt,$(REFLIB))
EXC = $(addprefix $(MAP)exc_,$(exc))

bam = $(addsuffix .bam,$(REFLIB))
bai = $(addsuffix .bam.bai,$(REFLIB))

#rbam = $(addsuffix _rmd.bam,$(REFLIB))
#rbai = $(addsuffix _rmd.bam.bai,$(REFLIB))

bmBAM = $(addprefix $(FBAM)bm_,$(bam))
bmBAI = $(addprefix $(FBAM)bm_,$(bai))

pmBAM = $(addprefix $(FBAM)upm_,$(bam))
pmBAI = $(addprefix $(FBAM)upm_,$(bai))

#r1BAM = $(addprefix $(MAP)r1_,$(bam))
#r1BAI = $(addprefix $(MAP)r1_,$(bai))

#rmdBAM = $(addprefix $(MAP),$(rbam))
#rmdBAI = $(addprefix $(MAP),$(rbai))

bmStat = $(subst .bam,.stat,$(bmBAM))
rmdStat = $(subst .bam,.stat,$(rmdBAM))


###### #####

#.PHONY:	bamstat
#bamstat:	$(bmStat)

#$(MAP)bmrmdStats.txt:	$(bmStat)
#	cat $^ > $@

#$(MAP)%.stat:	$(MAP)%.bam
#	samtools view $^ | awk ' { a++ }; END { print "$^",a }' > $@

###### ######

#.PHONY:	rem-dup
#rem-dup:	$(rmdBAM) $(rmdBAI)

#$(MAP)%_rmd.bam.bai:	$(MAP)%_rmd.bam
#	samtools index $^

#$(MAP)%_rmd.bam:	$(MAP)unsorted_%_rmd.bam
#	samtools sort $^ $(MAP)$*_rmd

#$(MAP)unsorted_%_rmd.bam:	$(MAP)bm_%.bam
#	samtools rmdup $^ $@

#.PHONY:	r1-filt
#r1-filt:	$(r1BAM) $(r1BAI)

#$(MAP)r1_%.bam.bai:	$(MAP)r1_%.bam
#	samtools index $^

#$(MAP)r1_%.bam:	$(MAP)ur1_%.bam
#	samtools sort $^ $(MAP)r1_$*

#$(MAP)ur1_%.bam:	$(MAP)bm_%.bam
#	samtools view -bh -f 64 $^ > $@


###### ######

.PHONY:	basic-filt
basic-filt:	$(pmBAM) $(EXC) $(bmBAM) $(bmBAI)


$(FBAM)bm_%.bam.bai:	$(FBAM)bm_%.bam
	samtools index $^

$(FBAM)bm_%.bam:	$(FBAM)ubm_%.bam
	samtools sort $^ $(FBAM)bm_$*

$(FBAM)ubm_%.bam:	$(FBAM)exc_%.txt $(FBAM)upm_%.bam
	samtools view -h $(word 2,$^) | grep -Fv -f $(word 1,$^) | samtools view -Sb - > $@

# Create a list of read ids to exclude. This is to ensure that the read and its
# mate is removed, and ensuring that we still have pairs of reads present. 

$(FBAM)exc_%.txt:	$(FBAM)badq_%.txt $(FBAM)talign_%.txt
	cat $^ | sort | uniq > $@

# Ids of reads with mapq < 30
$(FBAM)badq_%.txt:	$(FBAM)upm_%.bam
	samtools view $^ | awk ' { if ($$5 < 30) print $$1 } ' > $@

# Ids of reads with terminal alignments (bad for stacks)
$(FBAM)talign_%.txt:	$(FBAM)upm_%.bam
	samtools view $^ | awk ' { if ($$6 ~ "S$$") print $$1 } ' > $@

# The filtering seems to work on an AND basis, so
# there should not be any -f 4, or -f 8 present
$(FBAM)upm_%.bam:	$(MAP)mraw_%.bam
	samtools view -b -f 3 -F 3852 $^ > $@
#	samtools view -b -f 3 -F 12 $^ > $@
