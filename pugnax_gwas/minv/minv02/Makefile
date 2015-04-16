USR = $(shell echo $$USER)
PTH = /data/$(USR)/ruff/pugnax_gwas/

MINV = $(PTH)minv/minv02/
SINV = $(MINV)sinv/

ASS = $(MINV)assemblies/
MAP = $(MINV)mapped_reads/
IMAP = $(MINV)invmap/
RAD = $(MINV)mapped_rads/

#seq = RUFFv0.2_ACACGACA RUFFv0.2_ACTGTGTG
seq = MB8684 MB8685 MB8686 MB8687 MB8688
pfx = 2014_SOL_
sfx = _9_run_elemt_mrk_dup

SEQ = $(addprefix $(pfx),$(addsuffix $(sfx),$(seq)))

###

sam = $(addsuffix .sam,$(SEQ))
bam = $(addsuffix .bam,$(SEQ))
bed = $(addsuffix .bed,$(SEQ))

sp3357 = $(addprefix sp_contig3357_,$(sam))
sp1270 = $(addprefix sp_contig1270_,$(sam))

txt = $(addsuffix .txt,$(SEQ))

raw-bam = $(addprefix $(MAP),$(bam))
raw-bai = $(addsuffix .bai,$(raw-bam))

raw-mapq = $(addprefix $(IMAP)rmapq_,$(txt))
raw-flag = $(addprefix $(IMAP)rflag_,$(txt))

craw-bam = $(addprefix $(IMAP)craw_,$(bam))
craw-bai = $(addsuffix .bai,$(craw-bam))

traw-bam = $(addprefix $(IMAP)traw_,$(bam))
traw-bai = $(addsuffix .bai,$(traw-bam))

ftraw-bam = $(addprefix $(IMAP)ftraw_,$(bam))
rtraw-bam = $(addprefix $(IMAP)rtraw_,$(bam))

ff-bam = $(addprefix $(IMAP)ff_,$(bam))
rr-bam = $(addprefix $(IMAP)rr_,$(bam))

ff-bai = $(addsuffix .bai,$(ff-bam))
rr-bai = $(addsuffix .bai,$(rr-bam))

ff-bed = $(addprefix $(IMAP)ff_,$(bed))
rr-bed = $(addprefix $(IMAP)rr_,$(bed))

uff-bed = $(addprefix $(IMAP)uff_,$(bed))
urr-bed = $(addprefix $(IMAP)urr_,$(bed))

cff-bed = $(addprefix $(IMAP)cff_,$(bed))
crr-bed = $(addprefix $(IMAP)crr_,$(bed))

bff-bed = $(addprefix $(IMAP)bff_,$(bed))
brr-bed = $(addprefix $(IMAP)brr_,$(bed))

dff-bed = $(addprefix $(IMAP)dff_,$(bed))
drr-bed = $(addprefix $(IMAP)drr_,$(bed))

dlff-bed = $(addprefix $(IMAP)dlff_,$(bed))
dlrr-bed = $(addprefix $(IMAP)dlrr_,$(bed))

roidlff-bed = $(addprefix $(IMAP)roi_dlff_,$(bed))
roidlrr-bed = $(addprefix $(IMAP)roi_dlrr_,$(bed))

lff-bed = $(addprefix $(IMAP)lff_,$(bed))
lrr-bed = $(addprefix $(IMAP)lrr_,$(bed))

brff-bed = $(addprefix $(IMAP)brff_,$(bed))
brrr-bed = $(addprefix $(IMAP)brrr_,$(bed))

clff-bed = $(addprefix $(IMAP)clff_,$(bed))
clrr-bed = $(addprefix $(IMAP)clrr_,$(bed))

cldlff-bed = $(addprefix $(IMAP)cldlff_,$(bed))
cldlrr-bed = $(addprefix $(IMAP)cldlrr_,$(bed))

##

unmap-bam = $(addprefix $(IMAP)unmap_,$(bam))
unmap-bai = $(addsuffix .bai,$(unmap-bam))

funmap-bam = $(addprefix $(IMAP)funmap_,$(bam))
runmap-bam = $(addprefix $(IMAP)runmap_,$(bam))

frunmap-bam = $(funmap-bam) $(runmap-bam)
frunmap-bai = $(addsuffix .bai,$(unmap-bam))

funmap-bed = $(addprefix funmap_,$(bed))
runmap-bed = $(addprefix runmap_,$(bed))

frunmap-bed = $(funmap-bed) $(runmap-bed)

unmap-bed = $(addprefix $(IMAP),$(frunmap-bed))
uunmap-bed = $(addprefix $(IMAP)u,$(frunmap-bed))
cunmap-bed = $(addprefix $(IMAP)c,$(frunmap-bed))
lunmap-bed = $(addprefix $(IMAP)l,$(frunmap-bed))
roilunmap-bed = $(addprefix $(IMAP)roi_l,$(frunmap-bed))

clunmap-bed = $(addprefix $(IMAP)cl,$(frunmap-bed))

ihbam = $(addprefix $(MAP),$(bam))

# grep "Contig1270\s\|Contig2063\s\|Contig3047\s\|Contig3208\s\|Contig3357\s\|Contig3750\s\|Contig3913\s\|Contig4111\s\|Contig4944\s\|Contig9013\s" invmap/dlrr_2014_SOL_MB8688_9_run_elemt_mrk_dup.bed | awk ' { print $4 } ' | sort | uniq -c | awk ' { if ($1 > 1) print $2 } ' > mbrr8.txt

# grep -f mbrr4.txt invmap/dlrr_2014_SOL_MB8684_9_run_elemt_mrk_dup.bed

id-c3357 = $(addprefix contig3357_,$(sam))
id-c1270 = $(addprefix contig1270_,$(sam))

ids = $(id-c3357) $(id-c1270)

PP = $(addprefix $(IMAP)pp_,$(ids))

IP-ff = $(addprefix $(IMAP)ff_,$(ids))
IP-rr = $(addprefix $(IMAP)rr_,$(ids))

IP = $(IP-ff) $(IP-rr)

c3357 = "Contig3357:185600-185900"
c1270 = "Contig1270:821800-822000"

PPIP = $(PP) $(IP)

PPIPfa = $(subst .sam,.fa,$(PPIP))

.PHONY:	get-reads
get-reads:	$(PPIP) $(PPIPfa)

$(IMAP)%.fa:	$(IMAP)%.sam
	awk -F"\t" ' { print ">""$*""_"$$1"\n"$$10 } ' $^ > $@


$(IMAP)pp_contig3357_%.sam:	$(IMAP)traw_%.bam
	samtools view $^ $(c3357) > $@

$(IMAP)pp_contig1270_%.sam:	$(IMAP)traw_%.bam
	samtools view $^ $(c1270) > $@

#

$(IMAP)ff_contig3357_%.sam:	$(IMAP)ff_%.bam
	samtools view $^ $(c3357) > $@

$(IMAP)ff_contig1270_%.sam:	$(IMAP)ff_%.bam
	samtools view $^ $(c1270) > $@

$(IMAP)rr_contig3357_%.sam:	$(IMAP)rr_%.bam
	samtools view $^ $(c3357) > $@

$(IMAP)rr_contig1270_%.sam:	$(IMAP)rr_%.bam
	samtools view $^ $(c1270) > $@


.PHONY: localalign
localalign:	$(sp3357) $(sp1270)

$(IMAP)sp_contig3357%.sam:	$(IMAP)pp_contig3357%.sam
	grep "Contig1270" $^ > $@

$(IMAP)sp_contig1270%.sam:	$(IMAP)pp_contig1270%.sam
	grep "Contig3357" $^ > $@


.PHONY:	coi
coi:	$(coiltr1ff-bed) $(coiltr2ff-bed) $(coiltr1rr-bed) $(coiltr2rr-bed) $(roidlff-bed) $(roidlrr-bed) $(roilunmap-bed)

$(IMAP)coilt%.bed:	$(IMAP)lt%.bed
	grep "Contig1270 \|Contig2063 \|Contig3047 \|Contig3208 \|Contig3357 \|Contig3750 \|Contig3913 \|Contig4111 \|Contig4944 \|Contig9013" $^ > $@

$(IMAP)roi_dl%.bed:	$(IMAP)dl%.bed
	grep "Contig1270\s\|Contig2063\s\|Contig3047\s\|Contig3208\s\|Contig3357\s\|Contig3750\s\|Contig3913\s\|Contig4111\s\|Contig4944\s\|Contig9013\s" $^ > $@

$(IMAP)roi_l%.bed:	$(IMAP)l%.bed
	grep "Contig1270\s\|Contig2063\s\|Contig3047\s\|Contig3208\s\|Contig3357\s\|Contig3750\s\|Contig3913\s\|Contig4111\s\|Contig4944\s\|Contig9013\s" $^ > $@


.PHONY:	cl-bed
cl-bed:	$(clff-bed) $(clrr-bed) $(clunmap-bed) $(cldlff-bed) $(cldlrr-bed)

$(IMAP)cldl%.bed:	$(IMAP)dl%.bed
	sort -k6,6g -k2,2g -k3,3g $^ | awk ' BEGIN { cl="" }; { if (NR == 1) { chr=$$1; min=$$2; max=$$3; cl=$$NF; n=1 } else { if ($$NF == cl) { n++; chr=$$1; max=$$3 } else { print chr"\t"min"\t"max"\tID="cl";NREADS="n; chr=$$1; min=$$2; max=$$3; cl=$$NF; n=1 } } } ' | awk ' { gsub("Contig","",$$0); print $$0 } ' | sort -k 1,1g -k 2,2g -k 3,3g | awk ' { print "Contig"$$0 } ' > $@

$(IMAP)cl%.bed:	$(IMAP)l%.bed
	sort -k6,6g -k2,2g -k3,3g $^ | awk ' BEGIN { cl="" }; { if (NR == 1) { chr=$$1; min=$$2; max=$$3; cl=$$NF; n=1 } else { if ($$NF == cl) { n++; chr=$$1; max=$$3 } else { print chr"\t"min"\t"max"\tID="cl";NREADS="n; chr=$$1; min=$$2; max=$$3; cl=$$NF; n=1 } } } ' | awk ' { gsub("Contig","",$$0); print $$0 } ' | sort -k 1,1g -k 2,2g -k 3,3g | awk ' { print "Contig"$$0 } ' > $@


###### ######

.PHONY:	rm-lt
rm-lt:	$(lff-bed) $(lrr-bed) $(lunmap-bed) $(dlff-bed) $(dlrr-bed)

$(IMAP)l%.bed:	$(IMAP)b%.bed
	sort -k 6 -g $^ | awk ' { if (NR == 1) { cl=$$NF; n=1; a=$$0 } else { if ($$NF != cl) { if (n >= 5) print a; a = $$0; n = 1 } else { a=a"\n"$$0; n++ }; cl=$$NF } }; END { if (n >= 5) print a } ' > $@

$(IMAP)l%.bed:	$(IMAP)c%.bed
	sort -k 6 -g $^ | awk ' { if (NR == 1) { cl=$$NF; n=1; a=$$0 } else { if ($$NF != cl) { if (n >= 5) print a; a = $$0; n = 1 } else { a=a"\n"$$0; n++ }; cl=$$NF } }; END { if (n >= 5) print a } ' > $@

$(IMAP)dl%.bed:	$(IMAP)d%.bed
	sort -k 6 -g $^ | awk ' { if (NR == 1) { cl=$$NF; n=1; a=$$0 } else { if ($$NF != cl) { if (n >= 5) print a; a = $$0; n = 1 } else { a=a"\n"$$0; n++ }; cl=$$NF } }; END { if (n >= 5) print a } ' > $@


###### ######

# combine reads

.PHONY:	combine
combine:	$(bff-bed) $(brr-bed)

$(IMAP)b%.bed:	$(IMAP)c%.bed
	sort -T $(IMAP) -k 4 $^ | awk ' { if (NR == 1) { a=$$0; c=$$4; chr=$$1 } else { if ($$4 == c && $$1 == chr) print a"\n"$$0; else { a=$$0; c=$$4; chr=$$1 } } } ' | sort -k 1,1 -k 4,4 -k 2,2g -k 3,3g > $@


.PHONY:	diff-chr
diff-chr:	$(dff-bed) $(drr-bed)

$(IMAP)d%.bed:	$(IMAP)c%.bed
	sort -T $(IMAP) -k 4 $^ | awk ' { if (NR == 1) { a=$$0; c=$$4; chr=$$1 } else { if ($$4 == c && $$1 != chr) print a"\n"$$0; else { a=$$0; c=$$4; chr=$$1 } } } ' > $@

# add r1 & r2

#.PHONY:	addr12
#addr12:	$(mrkcr1ff-bed) $(mrkcr2ff-bed) $(mrkcr1rr-bed) $(mrkcr2rr-bed)

#$(IMAP)mrkcr1%.bed:	$(IMAP)cr1%.bed
#	awk ' { print $$0" r1" } ' $^ > $@

#$(IMAP)mrkcr2%.bed:	$(IMAP)cr2%.bed
#	awk ' { print $$0" r2" } ' $^ > $@


# cluster

.PHONY:	cluster
cluster:	$(cff-bed) $(crr-bed) $(cunmap-bed)

$(IMAP)c%.bed:	$(IMAP)u%.bed
	cat $^ | cluster 500 > $@

.PHONY:	ubed
ubed:	$(uff-bed) $(urr-bed) $(uunmap-bed)

$(IMAP)u%.bed:	$(IMAP)%.bed
	bedtools closest -d -N -a $^ -b $^ | awk -F"\t" ' { print $$1"_"$$2"_"$$3"_"$$4"_"$$NF } ' | uniq | awk -F"_" ' { $$1=$$1; print $$0 } ' > $@

###### ######

# remove identically mapped reads and sort by chrom,start,end
# is the end correct? I use the length to determine this, but do I '+' for forward and '-' for reverse?
# Postion is always the leftmost position of the sequence, therefore I define the rightmost position as leftmost + length(seq)

.PHONY:	bam2bed
bam2bed:	$(ff-bed) $(rr-bed) $(unmap-bed)

$(IMAP)%.bed:	$(IMAP)%.bam
	samtools view $^ | awk -F"\t" ' { a[$$3":"$$4":"length($$10)]++; if (a[$$3":"$$4":"length($$10)] < 2) print $$0} ' | awk -F"\t" ' BEGIN { OFS="\t" }; { print $$3,$$4,$$4+length($$10),$$1 } ' | sort -k 1,1 -k 2,2n -k 3,3n > $@

#$(IMAP)r2ff_%.bed:	$(IMAP)r2ff_%.bam
#	samtools view $^ | awk -F"\t" ' { a[$$3":"$$4":"length($$10)]++; if (a[$$3":"$$4":"length($$10)] < 2) print $$0} ' | awk -F"\t" ' BEGIN { OFS="\t" }; { print $$3,$$4,$$4+length($$10),$$1 } ' | sort -k 1,1 -k 2,2n -k 3,3n > $@

#$(IMAP)r1rr_%.bed:	$(IMAP)r1rr_%.bam
#	samtools view $^ | awk -F"\t" ' { a[$$3":"$$4":"length($$10)]++; if (a[$$3":"$$4":"length($$10)] < 2) print $$0} ' | awk -F"\t" ' BEGIN { OFS="\t" }; { print $$3,$$4,$$4+length($$10),$$1 } ' | sort -k 1,1 -k 2,2n -k 3,3n > $@

#$(IMAP)r2rr_%.bed:	$(IMAP)r2rr_%.bam
#	samtools view $^ | awk -F"\t" ' { a[$$3":"$$4":"length($$10)]++; if (a[$$3":"$$4":"length($$10)] < 2) print $$0} ' | awk -F"\t" ' BEGIN { OFS="\t" }; { print $$3,$$4,$$4+length($$10),$$1 } ' | sort -k 1,1 -k 2,2n -k 3,3n > $@

###### ######

# pick out r1ff, r1rr, r2ff and r2rr and make sure that reads are mapped to the same chromosome
# plus make sure they are paired and that they are not anything unusual. The only flags output from
# this step should match the -f flag.

.PHONY:	ff-rr
ff-rr:	$(ff-bam) $(rr-bam) $(ff-bai) $(rr-bai)

$(IMAP)ff_%.bam.bai:	$(IMAP)ff_%.bam
	samtools index $^

$(IMAP)rr_%.bam.bai:	$(IMAP)rr_%.bam
	samtools index $^

$(IMAP)ff_%.bam:	$(IMAP)usff_%.bam
	samtools sort $^ $(IMAP)ff_$*

$(IMAP)rr_%.bam:	$(IMAP)usrr_%.bam
	samtools sort $^ $(IMAP)rr_$*

$(IMAP)usff_%.bam:	$(IMAP)craw_%.bam	
	samtools view -bh -F 48 $^ > $@

$(IMAP)usrr_%.bam:	$(IMAP)craw_%.bam
	samtools view -bh -f 48  $^ > $@

.PHONY:	readfr
readfr:	$(ftraw-bam) $(rtraw-bam)

$(IMAP)ftraw_%.bam:	$(IMAP)traw_%.bam
	samtools view -bh -F 16 $^ > $@

$(IMAP)rtraw_%.bam:	$(IMAP)traw_%.bam
	samtools view -bh -f 16 $^ > $@

###### ######

.PHONY:	tight-filter
tight-filter:	$(traw-bam) $(traw-bai)


$(IMAP)traw_%.bam.bai:	$(IMAP)traw_%.bam
	samtools index $^

$(IMAP)traw_%.bam:	$(IMAP)us_traw_%.bam
	samtools sort $^ $(IMAP)traw_$*

$(IMAP)us_traw_%.bam:	$(IMAP)craw_%.bam
	samtools view -h -f 2 $^ | awk -F"\t" ' { if ($$0 ~ "^@" || $$7 == "=") print $$0 } ' | samtools view -Sb -> $@

###### ######

# paired, both reads mapped

.PHONY:	filter
filter:	$(craw-bam) $(craw-bai)

$(IMAP)craw_%.bam.bai:	$(IMAP)craw_%.bam
	samtools index $^

$(IMAP)craw_%.bam:	$(IMAP)us_craw_%.bam
	samtools sort $^ $(IMAP)craw_$*

$(IMAP)us_craw_%.bam:	$(MAP)%.bam
	samtools view -hb -q 45 -f 1 -F 3852 $^ > $@

#samtools view -h -q 45 -f 1 -F 3852 $^ | awk -F"\t" ' { if ($$0 ~ "^@" || $$7 == "=") print $$0 } ' | samtools view -Sb - > $@


###### ######

#r1bam = $(addprefix r1_,$(bam))
#r2bam = $(addprefix r2_,$(bam))

#r12bam = $(r1bam) $(r2bam)



# paired, one read unmapped

.PHONY:	unmap-filter
unmap-filter:	$(frunmap-bam) $(frunmap-bai)

$(IMAP)%.bam.bai:	$(IMAP)%.bam
	samtools index $^

$(IMAP)%.bam:	$(IMAP)us_%.bam
	samtools sort $^ $(IMAP)$*

# General filtering: -F 3840
# Paired, read mapped, mate unmapped -f 9 -F 4


$(IMAP)us_funmap_%.bam:	$(MAP)%.bam
	samtools view -bh -q 45 -f 9 -F 3860 $^ > $@

$(IMAP)us_runmap_%.bam:	$(MAP)%.bam
	samtools view -bh -q 45 -f 25 -F 3844 $^ > $@


.PHONY:	just-unmap
just-unmap:	$(unmap-bam) $(unmap-bai)

$(IMAP)unmap_%.bam.bai:	$(IMAP)unmap_%.bam
	samtools index $^

$(IMAP)unmap_%.bam:	$(IMAP)usunmap_%.bam
	samtools sort $^ $(IMAP)unmap_$*

$(IMAP)usunmap_%.bam:	$(MAP)%.bam
	samtools view -bh -f 9 -F 3844 $^ > $@


.PHONY:	depth
depth:	$(IMAP)craw_depth.txt.gz $(IMAP)traw_depth.txt.gz $(IMAP)ftraw_depth.txt.gz $(IMAP)rtraw_depth.txt.gz $(IMAP)roi_craw_depth.txt $(IMAP)roi_traw_depth.txt $(IMAP)roi_ftraw_depth.txt $(IMAP)roi_rtraw_depth.txt

$(IMAP)roi_%_depth.txt:	$(IMAP)%_depth.txt.gz
	zcat $^ | grep "Contig1270\s\|Contig2063\s\|Contig3047\s\|Contig3208\s\|Contig3357\s\|Contig3750\s\|Contig3913\s\|Contig4111\s\|Contig4944\s\|Contig9013\s" > $@

$(IMAP)craw_depth.txt.gz:	$(craw-bam)
	samtools depth $^ | gzip > $@

$(IMAP)traw_depth.txt.gz:	$(traw-bam)
	samtools depth $^ | gzip > $@

$(IMAP)ftraw_depth.txt.gz:	$(ftraw-bam)
	samtools depth $^ | gzip > $@

$(IMAP)rtraw_depth.txt.gz:	$(rtraw-bam)
	samtools depth $^ | gzip > $@


###### ######

.PHONY:	raw-stats
raw-stats:	$(raw-mapq) $(raw-flag)

$(IMAP)rmapq_%.txt:	$(MAP)%.bam
	samtools view $^ | awk -F"\t" ' { a[$$5]++ }; END { for (i in a) print i,a[i] } ' | sort -gr > $@

$(IMAP)rflag_%.txt:	$(MAP)%.bam
	samtools view $^ | awk -F"\t" ' { a[$$2]++ }; END { for (i in a) print i,a[i] } ' | sort -k 2 -gr > $@

###### ######

sref = sinv_Contig0_400_5000_RUFFv0.2.fa

PRO = $(MINV)processed_rads/
BLOC = $(PRO)barcodes/

tlib = 2014025_TBLib1.pools 2014025_TBLib2.pools

TLIB = $(addprefix $(BLOC),$(tlib))

# ( ACACGACA CAGTGTGT )
ULIB = $(shell awk -F$$'\t' ' { print $$2 } ' $(TLIB))

###### ######

srefnam = $(subst .fa,,$(sref))
sREFLIB = $(foreach r,$(srefnam),$(addprefix $(r)_,$(ULIB)))

SREF = $(addprefix $(SINV),$(sref))

sbam = $(addsuffix .bam,$(sREFLIB))
sbai = $(addsuffix .bai,$(sREFLIB))

sBAM =  $(addprefix $(SINV)raw_,$(sbam))
sBAI =  $(addprefix $(SINV)raw_,$(sbai))

.PHONY:	bwa-mem
bwa-mem:	$(sBAM) $(sBAI)

$(SINV)raw_%.bai:	$(SINV)raw_%.bam
	samtools index $^

$(SINV)raw_%.bam:	$(SINV)mem_%.bam
	samtools sort $^ $(SINV)raw_$*

$(SINV)mem_sinv_Contig0_400_5000_%.bam:	$(RAD)%.1.fq $(RAD)%.2.fq
	bwa mem $(SREF) $^ | samtools view -Sb - > $@


###### ######

.PHONY:	sinv
sinv:	$(SREF) $(SINV)sinv_Contig0_400_5000_RUFFv0.2.amb

$(SINV)sinv_Contig0_400_5000_RUFFv0.2.amb:	$(SINV)sinv_Contig0_400_5000_RUFFv0.2.fa
	bwa index $^

$(SINV)sinv_Contig0_400_5000_RUFFv0.2.fa:	$(ASS)RUFFv0.2.fa
	cinv $^ Contig0 400 5000 > $@


###### ######

.PHONY:	index
index:	$(raw-bai)

$(MAP)%.bam.bai:	$(MAP)%.bam
	samtools index $^
