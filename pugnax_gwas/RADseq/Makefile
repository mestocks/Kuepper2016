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

ref = RUFFv0.2alt.fa
#ref = RUFFv0.2.fa
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

.PHONY:	bi-filter
bi-filter:	$(ALN)snps_GATK_bi.ped

$(ALN)%_bi.ped:	$(ALN)%_raw.ped
	plink --file $(ALN)$*_raw 

###### ######

#.INTERMEDIATE:	$(ALN)sample.vcf

.PHONY:	pre-plink
pre-plink:	$(ALN)mv_tr_RUFFv0.2alt_rmd_dp7.tped $(ALN)tr_RUFFv0.2alt_rmd_dp7.tped $(ALN)tr_RUFFv0.2alt_rmd.vcf $(ALN)mv_tr_RUFFv0.2alt_rmd_dp7.raw 

#pre-plink:	$(ALN)mv_tr_pop_all_contigs_dp7.tped $(ALN)tr_pop_all_contigs_dp7.tped $(ALN)tr_pop_all_contigs.vcf $(ALN)mv_tr_pop_all_contigs_dp7.raw 

#pre-plink:	$(ALN)mv_tr_all_contigs_rmd_dp7.tped $(ALN)tr_all_contigs_rmd_dp7.tped $(ALN)tr_all_contigs_rmd.vcf $(ALN)mv_tr_all_contigs_rmd_dp7.raw 

#pre-plink:	$(ALN)mv_tr_RUFFv0.2_rmd_dp7.tped $(ALN)tr_RUFFv0.2_rmd_dp7.tped $(ALN)tr_RUFFv0.2_rmd.vcf $(ALN)mv_tr_RUFFv0.2_rmd_dp7.raw 

#$(ALN)tr_mv_RUFFv0.2_gq.ped $(ALN)tr_mv_RUFFv0.2_gq.tped $(ALN)tr_mv_RUFFv0.2_gq.raw

#$(ALN)snps_GATK_raw_gq.ped $(ALN)snps_GATK_raw_gq.tped $(ALN)snps_GATK_raw_gq.raw

$(ALN)%.raw:	$(ALN)%.tped
	Rscript tped2raw.r $^ $(ALN)$*.tfam $@

#$(ALN)mv_%.tped:	$(ALN)%.tped
#	awk ' { r+=1; rs=""; while (length(rs)+length(r) != 7) rs=rs"0"; $$2="rs"rs; $$2=$$2r; print $$0 } ' $^ > $@
#	cp $(ALN)$*.tfam $(ALN)mv_$*.tfam

$(ALN)mv_%.tped:	$(ALN)%.tped
	awk ' { split($$2,a,":"); b=substr(a[1],4,length(a[1])); $$1=b; r+=1; rs=""; while (length(rs)+length(r) != 7) rs=rs"0"; $$2="rs"rs; $$2=$$2r; print $$0 } ' $^ > $@	
	cp $(ALN)$*.tfam $(ALN)mv_$*.tfam


$(ALN)%.tped:	$(ALN)%.ped
	plink --noweb --file $(ALN)$* --recode --transpose --out $(ALN)$*

$(ALN)%_dp7.ped:	$(ALN)%.vcf
	vcftools --vcf $^ --minDP 7 --remove-indels --plink --out $(ALN)$*_dp7

#$(ALN)tr_%.vcf:	$(ALN)%.vcf
#	cat $^ | awk ' { gsub("Contig","chr",$$0); if ($$4 != "N") print $$0 } ' > $@

$(ALN)tr_%.vcf:	$(ALN)%.vcf.gz
	zcat $^ | awk ' { gsub("Contig","chr",$$0); if ($$4 != "N") print $$0 } ' > $@

$(ALN)sample.vcf:	$(ALN)sample.vcf.gz
	zcat $^ > $@


# awk ' { split($2,a,":"); b=substr(a[1],4,length(a[1])); $1=b; r+=1; rs=""; while (length(rs)+length(r) != 7) rs=rs"0"; $2="rs"rs; $2=$2r; print $0 } ' alignments/tr_mv_RUFFv0.2_gq.tped > alignments/rs_tr_mv_RUFFv0.2_gq.tped 

#awk ' { gsub("Contig","chr",$0); print $0 } ' alignments/trimmed_RUFFv0.2.vcf 

###### ######

.PHONY:	mpileup
mpileup:	$(ALN)$(refnam)_rmd.vcf.gz

#mpileup:	$(ALN)$(refnam).vcf.gz

# add -b if I want bcf compressed output
#$(ALN)$(refnam).vcf.gz:	$(rBAM)
#	samtools mpileup -f $(REF) -DSg $^ | bcftools view -v -g - | gzip > $@

$(ALN)$(refnam)_rmd.vcf.gz:	$(rmdBAM)
	samtools mpileup -f $(REF) -DSg $^ | bcftools view -v -g - | gzip > $@

###### ######



#
###### ######

.PHONY:	refmap
refmap:	$(POP)cout2.txt

$(POP)cout2.txt:	$(rBAM)
	ref_map.pl -S -b 1 $(addprefix -s ,$^) -o $(@D)

###### ######

#stacks -b 1 -o ./stacks -s ./stacks/f0_male -s ./stacks/f0_female -p 15

.PHONY:	cstacks-run
cstacks-run:	$(CST)cout.txt

$(CST)cout.txt:	$(rPSTsnps)
	cstacks -b 1 -o $(@D) $(addprefix -s,$(rPSTcin))

###### ######

.PHONY:	pstacks-run
pstacks-run:	$(rPSTsnps)

#$(PST)stacksstuff.txt:	$(rBAM)
#	ref_map.pl -S -b 1 -T 12 $(addprefix -s ,$^) -o $(@D)

$(PST)%.snps.tsv.gz:	$(MAP)%.bam
	pstacks -t bam -p 12 -f $^ -o $(@D)


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


rBAMstats = $(subst filter_stats,bam_stats,$(rFBAM))
rBAMstats-gz = $(addsuffix .gz,$(rBAMstats))

rBAMhists = $(subst filter_stats,bam_hists,$(rFBAM))


.PHONY:	map-figs
map-figs:	$(rBAMhists) $(MAP)$(refnam)_isize_fig.pdf

$(MAP)$(refnam)_isize_fig.pdf:	$(rBAMhists)
	Rscript isize_fig.r $^ $@

$(MAP)bam_hists_%.txt:	$(MAP)bam_stats_%.txt
	Rscript isize_curve.r $^ $@

$(MAP)bam_stats_%.txt:	$(MAP)bam_stats_%.txt.gz
	zcat $^ > $@


.PHONY:	map-stats
map-stats:	$(rBAMstats-gz) $(MAP)$(refnam)_filter_stats.txt

$(MAP)%_filter_stats.txt:	$(MAP)filter_stats_%_*.txt
	./fstats $^ > $@

$(MAP)bam_stats_%.txt.gz:	$(MAP)%.bam
	samtools view $^ | awk -v f=$* -- ' { print f,$$3,$$5,$$9 } ' | gzip > $@


edin = $(PTH)edmapping/
edout = $(PTH)edout/

indnames = $(shell cat $(PTH)processed_rads/barcodes/2014*.pools | awk ' { print $$1 } ' | sort)

ebamnames = $(addsuffix .bam,$(indnames))
ebamstats-gz = $(addsuffix .txt.gz,$(indnames))
ebamhists = $(addsuffix .txt,$(indnames))

eBAMNAMES = $(addprefix $(edin),$(indnames))
eBAMSTATS-gz = $(addprefix $(edout)bam_stats_,$(ebamstats-gz))
eBAMhists = $(addprefix $(edout)bam_hists_,$(ebamhists))


.PHONY:	ed-map-figs
ed-map-figs:	$(eBAMhists) $(edout)ed_isize_fig.pdf

$(edout)ed_isize_fig.pdf:	$(eBAMhists)
	Rscript ed_isize_fig.r $^ $@

$(edout)bam_hists_%.txt:	$(edout)bam_stats_%.txt
	Rscript isize_curve.r $^ $@

$(edout)bam_stats_%.txt:	$(edout)bam_stats_%.txt.gz
	zcat $^ > $@

.PHONY:	ed-map-stats
ed-map-stats:	$(eBAMSTATS-gz)

$(edout)bam_stats_%.txt.gz:	$(edin)%.bam
	samtools view -f 3 -F 12 $^ | awk -v f=$* -- ' { if ($$9 > 0) print "ed"f,$$3,$$5,$$9 } ' | gzip > $@

###### ######



.PHONY:	sampe-rmd
sampe-rmd:	$(rmdBAM) $(rmdBAI)

$(MAP)%_rmd.bam.bai:	$(MAP)%_rmd.bam
	samtools index $^

$(MAP)%_rmd.bam:	$(MAP)unsorted_%_rmd.bam
	samtools sort $^ $(MAP)$*_rmd

$(MAP)unsorted_%_rmd.bam:	$(MAP)%.bam
	samtools rmdup $^ $@

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


DIV = 0.05

.PHONY:	sampe
sampe:	$(urBAM) $(rFBAM)

$(MAP)filter_stats_%.txt:	$(MAP)raw_%.bam
	samtools view $^ | awk ' { if ($$6 ~ "S$$") b=1; else a++ }; END { print a } ' > $@
	samtools view $^ | grep "XT:A:U" -c >> $@
	samtools view -f 3 -F 12 $^ | grep "." -c >> $@
	samtools view -f 3 -F 12 $^ | awk ' { if ($$6 ~ "S$$") a=1; else print $$0 } ' | grep "XT:A:U" | grep "." -c >> $@
	samtools view $^ | grep "." -c >> $@

$(MAP)raw_$(refnam)_%.bam:	$(MAP)$(refnam)_%.1.sai $(MAP)$(refnam)_%.2.sai $(MAP)$(refnam)_%.1.fq $(MAP)$(refnam)_%.2.fq
	bwa sampe $(REF) $^ | samtools view -Sb - > $@

$(MAP)unsorted_$(galnam)_%.bam:	$(MAP)$(galnam)_%.1.fq $(MAP)$(galnam)_%.2.fq
	stampy.py -g $(ASS)GALLUS -h $(ASS)GALLUS -M $(MAP)$(galnam)_$*.1.fq,$(MAP)$(galnam)_$*.2.fq -f sam --substitutionrate=$(DIV) | samtools view -Sb - > $@


###### ######


.PHONY:	aln
aln:	$(rSAI)

$(MAP)$(refnam)_%.sai:	$(MAP)$(refnam)_%.fq
	bwa aln $(REF) $^ > $@


###### ######


.PHONY:	alt-name
alt-name:	$(MFQ)

$(MAP)$(refnam)_%.1.fq:	$(PRO)sample_%.1.fq
	awk ' { if ($$0 ~ "^@.*_1$$") { $$0=substr($$0, 0, length($$0)-2) } print $$0 } ' $^ > $@

$(MAP)$(refnam)_%.2.fq:	$(PRO)sample_%.2.fq
	awk ' { if ($$0 ~ "^@.*_2$$") { $$0=substr($$0, 0, length($$0)-2) } print $$0 } ' $^ > $@

$(MAP)$(galnam)_%.1.fq:	$(PRO)sample_%.1.fq
	awk ' { if ($$0 ~ "^@.*_1$$") { $$0=substr($$0, 0, length($$0)-2) } print $$0 } ' $^ > $@

$(MAP)$(galnam)_%.2.fq:	$(PRO)sample_%.2.fq
	awk ' { if ($$0 ~ "^@.*_2$$") { $$0=substr($$0, 0, length($$0)-2) } print $$0 } ' $^ > $@


###### ######


.PHONY:	index
index:	$(REF).amb $(GAL).amb $(ASS)$(galnam).stidx $(ASS)$(galnam).sthash

$(ASS)%.fa.amb:	$(ASS)%.fa
	bwa index $^

$(ASS)%.sthash:	$(ASS)%.fa $(ASS)%.stidx
	stampy.py -g $(ASS)$* -H $(ASS)$*

$(ASS)%.stidx:	$(ASS)%.fa
	stampy.py -G $(ASS)$* $^


###### ######


.PHONY:	WGA
WGA:	$(ASS)mugsy/ruff_gallus.maf

$(ASS)mugsy/ruff_gallus.maf:	$(ASS)mugsy/RUFF.fa $(ASS)mugsy/GALLUS.fa
	mugsy --directory $(ASS)mugsy --prefix ruff_gallus $^


############# #############
##
## Initial processing and demultiplexing of RADs
##
##
## Input:     raw_rads/*.sanfastq.gz
##            processed_rads/s002/barcodes/2014025_TBLib1.pools
##            processed_rads/s002/barcodes/2014025_TBLib2.pools
##            processed_rads/s002/barcodes/pooltags.txt
##            
## Output:    processed_rads/s002/sample_*.1.fq
##            processed_rads/s002/sample_*.2.fq
##
## Stats:     processed_rads/s002/run_by_ind.txt
##
## Programs:  stacks v1.21 (process_radtags)
##
## Scripts:   processed_rads/s002/sampleinfo
##
############# #############


.PHONY:	stacks-stats
stacks-stats:	$(PRO)run_by_ind.txt

$(PRO)run_by_ind.txt:	$(PRO)sout*/process_radtags.log
	echo "run tag total no_radtag low_qual retained" > $@
	$(PRO)sampleinfo $(^D) >> $@


###### ######


.PHONY:	stacks-combine
stacks-combine:	$(PFQ)

# ( sample_ACACGACA-TCATTGAG.1.fq sample_ACACGACA-TACAGGAT.1.fq )
# ( sample_ACACGACA.1.fq )

$(PRO)sample_%.1.fq:	$(PRO)allout/sample_%-*[^rem].1.fq
	cat $^ > $@

$(PRO)sample_%.2.fq:	$(PRO)allout/sample_%-*[^rem].2.fq
	cat $^ > $@


###### ######


.PHONY:	stacks-gather
stacks-gather:	$(STAG) $(BAR)

$(PRO)allout/sample_%.fq:	$(PRO)sout*/sample_%.fq
	cat $^ > $@

$(PRO)sout%/*.fq:	$(PRO)sout%/process_radtags.log
	echo $@" present"


###### ######


RUNDIRS = $(addprefix $(PRO)sout,$(URUNS))
PROLOG = $(addsuffix /process_radtags.log,$(RUNDIRS))

.PHONY:	stacks-process
stacks-process:	$(PROLOG)

$(PRO)sout%/process_radtags.log:	$(RAD)%_1.sanfastq.gz $(RAD)%_2.sanfastq.gz $(BAR)
	if [ ! -d "$(PRO)sout$*" ]; then mkdir $(PRO)sout$*; fi
	process_radtags --inline_index -o $(PRO)sout$* -b $(BAR) -e pstI -E phred33 -r -c -q -i gzfastq -1 $(RAD)$*_1.sanfastq.gz -2 $(RAD)$*_2.sanfastq.gz

$(BAR):	$(TPOL) $(TLIB)
	while read p; do cat $(word 2,$^) $(word 3,$^) | awk -F$$'\t' -v P=$$p -- ' { print $$2"\t"P } ' ; done < $< > $@
