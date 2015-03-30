###### Location of libraries ######

maxK = 64
processors = 8

projDir = /exports/projects/2013036_Blaxter_Mark/
outDir = /exports/projects/ruff/abyss/
#pacDir = /exports/projects/ruff/pacbio2014/

name-pe = abyss-assembly-pe
name-pe-mp = abyss-assembly-pe-mp
name-pe-mp-pb = abyss-assembly-pe-mp-pb

format = .fastq.gz

### Paired-end ###

peSuffixes = _bwa_mapped_reads_pe_no_contamination_R_1.trimmed _bwa_mapped_reads_pe_no_contamination_R_2.trimmed

pe200a = $(addsuffix $(format),$(addprefix $(projDir)2013_SOL_MB1386,$(peSuffixes)))
pe200b = $(addsuffix $(format),$(addprefix $(projDir)2013_SOL_MB1387,$(peSuffixes)))
pe400a = $(addsuffix $(format),$(addprefix $(projDir)2013_SOL_MB1388,$(peSuffixes)))
pe400b = $(addsuffix $(format),$(addprefix $(projDir)2013_SOL_MB1389,$(peSuffixes)))
pe600a = $(addsuffix $(format),$(addprefix $(projDir)2013_SOL_MB1390,$(peSuffixes)))
pe600b = $(addsuffix $(format),$(addprefix $(projDir)2013_SOL_MB1391,$(peSuffixes)))

### Mate-pair ###

mpSuffixes = .cutadapt_no_contamination_RF_1 .cutadapt_no_contamination_RF_2

mp3000 = $(addsuffix .fastq,$(addprefix $(projDir)130725_0024_H0T86ADXX_2_IL-TP-007,$(mpSuffixes)))
mp5000 = $(addsuffix .fastq,$(addprefix $(projDir)130725_0024_H0T86ADXX_2_IL-TP-016,$(mpSuffixes)))

### PacBio ###

pacbio25 = $(pacDir)pb25.fastq.gz

###### Stats from assembly ######

.PHONY:	assembly-stats
assembly-stats:	assembly-pe-0.1.stats assembly-pe-0.2.stats

assembly-pe-%.stats:	$(outDir)abyss-assembly-%/abyss-assembly-pe-scaffolds.fa
	grep ">" $^ | awk ' BEGIN{ OFS="\t"; max = 0 }; { if ($$2 > max) max = $$2 }; END { print "Max contig length",max } ' > $@
	grep ">" $^ | awk ' BEGIN{ OFS="\t" }; { a++ }; END { print "Num contigs",a } ' >> $@
	grep ">" $^ | awk ' BEGIN{ OFS="\t" }; { if ($$2 > 99) a++ }; END { print "Num contigs >= 100",a } ' >> $@
	grep ">" $^ | awk ' BEGIN{ OFS="\t" }; { if ($$2 > 999) a++ }; END { print "Num contigs >= 1000",a } ' >> $@
	grep ">" $^ | awk ' BEGIN{ OFS="\t"; a = 0 }; { a += $$2 }; END { print "Total bases in contigs",a } ' >> $@
	grep ">" $^ | awk ' BEGIN{ OFS="\t"; a = 0 }; { if ($$2 > 99) a += $$2 }; END { print "Bases in contigs >= 100",a } ' >> $@
	grep ">" $^ | awk ' BEGIN{ OFS="\t"; a = 0 }; { if ($$2 > 999) a += $$2 }; END { print "Bases in contigs >= 1000",a } ' >> $@
	grep ">" $^ | awk ' { print $$2 } ' | sort -n | awk ' BEGIN { OFS="\t"; a = 0; i = 1 }; { a += $$1; A[i] = a; B[i] = $$1; i++; max = a; end = i }; END { b = 0; for (j=1; j <= end; j++) { if (A[j] >= max/2) { if (b == 0) { print "Total N50",B[j]; b = 1 } } } } ' >> $@
	grep ">" $^ | awk ' { if ($$2 > 99) print $$2 } ' | sort -n | awk ' BEGIN { OFS="\t"; a = 0; i = 1 }; { a += $$1; A[i] = a; B[i] = $$1; i++; max = a; end = i }; END { b = 0; for (j=1; j <= end; j++) { if (A[j] >= max/2) { if (b == 0) { print "N50 contigs >= 100",B[j]; b = 1 } } } } ' >> $@
	grep ">" $^ | awk ' { if ($$2 > 999) print $$2 } ' | sort -n | awk ' BEGIN { OFS="\t"; a = 0; i = 1 }; { a += $$1; A[i] = a; B[i] = $$1; i++; max = a; end = i }; END { b = 0; for (j=1; j <= end; j++) { if (A[j] >= max/2) { if (b == 0) { print "N50 contigs >= 1000",B[j]; b = 1 } } } } ' >> $@

###### Scaffolding ######

#assembly = $(outdir)abyss-assembly-0.1/
#scaff = $(outdir)abyss-scaffolding-0.1.1/

#.PHONY:	mp-scaff
#mp-scaff:	$(scaff)$(name-pe)-scaffolds.fa

#abyss-map -j$(processors) -l$(maxK) $(mp3000) $(assembly)$(name-pe)-contigs.fa | abyss-fixmate | sort | DistanceEst | 
#abyss-scaffold
#MergeContigs


basedir = abyss-assembly-

###### Perform PE assembly ######

full-path-0.1 = $(outDir)$(basedir)0.1

.PHONY:	assemble-pe-0.1
assemble-pe-0.1:	$(full-path-0.1)$(name-pe)-contigs.fa

$(full-path-0.1)$(name-pe)-scaffolds.fa:	$(pe200a) $(pe400a) $(pe600a) $(pe200b) $(pe400b) $(pe600b)
	abyss-pe --directory=$(full-path-0.1) k=$(maxK) name=$(name-pe) np=$(processors) lib='pe200a pe200b pe400a pe400b pe600a pe600b' pe200a='$(pe200a)' pe200b='$(pe200b)' pe400a='$(pe400a)' pe400b='$(pe400b)' pe600a='$(pe600a)' pe600b='$(pe600b)'


###### Perform PE+MP assembly ######

full-path-0.2 = $(outDir)$(basedir)0.2

.PHONY:	assemble-pe-0.2
assemble-pe-0.2:	$(full-path-0.2)$(name-pe)-scaffolds.fa

$(full-path-0.2)$(name-pe)-scaffolds.fa:	$(pe200a) $(pe400a) $(pe600a) $(pe200b) $(pe400b) $(pe600b) $(mp3000) $(mp5000)
	abyss-pe --directory=$(full-path-0.2) k=$(maxK) name=$(name-pe) np=$(processors) lib='pe200a pe200b pe400a pe400b pe600a pe600b' mp='mp3000 mp5000' pe200a='$(pe200a)' pe200b='$(pe200b)' pe400a='$(pe400a)' pe400b='$(pe400b)' pe600a='$(pe600a)' pe600b='$(pe600b)' mp3000='$(mp3000)' mp5000='$(mp5000)'


######   ######

kmer-values = 32 34 36 38 40 42 44 46 48 50 64 72 96

base-name = abyss0.4
extra = -k
suffix = -scaffolds.fa
kmer-path = $(outDir)$(basedir)0.4/
kmers = $(addsuffix $(suffix),$(addprefix $(kmer-path)$(base-name)$(extra),$(kmer-values)))

odd-kmer = 33 35 37 39 41
n-values = 8 10 12

opt-values = \
8-33 8-35 8-37 8-39 8-41 \
10-33 10-35 10-37 10-39 10-41 \
12-33 12-35 12-37 12-39 12-41

nklN-values = \
11-37-37-11 13-37-37-13 \
12-37-35-12 12-37-39-12 \
12-37-37-10 12-37-37-14


nkmers = $(addsuffix $(suffix),$(addprefix $(kmer-path)$(base-name)-nk-,$(opt-values)))

nklN = $(addsuffix $(suffix),$(addprefix $(kmer-path)$(base-name)-nklN-,$(nklN-values)))

.PHONY:	opt-kmer
opt-kmer:	$(kmers) $(nkmers) $(nklN)

# abyss0.4-k[k]-scaffolds.fa

$(kmer-path)$(base-name)$(extra)%$(suffix):	$(pe200a) $(pe400a) $(pe600a) $(pe200b) $(pe400b) $(pe600b) $(mp3000) $(mp5000)
	abyss-pe --directory=$(kmer-path) k=$* name=$(base-name)$(extra)$* np=$(processors) lib='pe200a pe200b pe400a pe400b pe600a pe600b' mp='mp3000 mp5000' pe200a='$(pe200a)' pe200b='$(pe200b)' pe400a='$(pe400a)' pe400b='$(pe400b)' pe600a='$(pe600a)' pe600b='$(pe600b)' mp3000='$(mp3000)' mp5000='$(mp5000)'

# abyss0.4-k[k]-n[n]-scaffolds.fa

$(kmer-path)$(base-name)-nk-%$(suffix):	$(pe200a) $(pe400a) $(pe600a) $(pe200b) $(pe400b) $(pe600b) $(mp3000) $(mp5000)
	echo $(nklN)
	abyss-pe --directory=$(kmer-path) k=$(word 2,$(subst -, ,$*)) n=$(word 1,$(subst -, ,$*)) name=$(base-name)-nk-$* np=$(processors) lib='pe200a pe200b pe400a pe400b pe600a pe600b' mp='mp3000 mp5000' pe200a='$(pe200a)' pe200b='$(pe200b)' pe400a='$(pe400a)' pe400b='$(pe400b)' pe600a='$(pe600a)' pe600b='$(pe600b)' mp3000='$(mp3000)' mp5000='$(mp5000)'

# abyss0.4-k[k]-n[n]-l[l]-N[N]-scaffolds.fa

$(kmer-path)$(base-name)-nklN-%$(suffix):	$(pe200a) $(pe400a) $(pe600a) $(pe200b) $(pe400b) $(pe600b) $(mp3000) $(mp5000)
	abyss-pe --directory=$(kmer-path) k=$(word 2,$(subst -, ,$*)) n=$(word 1,$(subst -, ,$*)) l=$(word 3,$(subst -, ,$*)) N=$(word 4,$(subst -, ,$*)) name=$(base-name)-nklN-$* np=$(processors) lib='pe200a pe200b pe400a pe400b pe600a pe600b' mp='mp3000 mp5000' pe200a='$(pe200a)' pe200b='$(pe200b)' pe400a='$(pe400a)' pe400b='$(pe400b)' pe600a='$(pe600a)' pe600b='$(pe600b)' mp3000='$(mp3000)' mp5000='$(mp5000)'


###### Perform PE+MP+PB assembly ######

full-path-0.3 = $(outDir)$(basedir)0.3/

.PHONY:	assemble-pe-0.3
assemble-pe-0.3:	$(full-path-0.3)$(name-pe)-scaffolds.fa

$(full-path-0.3)$(name-pe)-scaffolds.fa:	$(pe200a) $(pe400a) $(pe600a) $(pe200b) $(pe400b) $(pe600b) $(mp3000) $(mp5000) $(pacbio25)
	abyss-pe --directory=$(full-path-0.3) k=$(maxK) name=$(name-pe-mp-pb) np=$(processors) lib='pe200a pe200b pe400a pe400b pe600a pe600b' mp='mp3000 mp5000' long='pb25' pe200a='$(pe200a)' pe200b='$(pe200b)' pe400a='$(pe400a)' pe400b='$(pe400b)' pe600a='$(pe600a)' pe600b='$(pe600b)' mp3000='$(mp3000)' mp5000='$(mp5000)' pb25='$(pacbio25)'
