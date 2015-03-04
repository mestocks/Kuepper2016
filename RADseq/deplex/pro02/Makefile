###### ######

USR = $(shell echo $$USER)
PTH = /data/$(USR)/ruff/pugnax_gwas/RADseq/deplex/pro02/

RAD = $(PTH)raw_rads/
PRO = $(PTH)processed_rads/

###### ######
# Stacks

tlib1 = 2014025_TBLib1.pools
tlib2 = 2014025_TBLib2.pools
tlib = $(tlib1) $(tlib2)

tpol = pooltags.txt
bar = tag_pools.txt

bar1 = tagpool1.txt
bar2 = tagpool2.txt

BLOC = $(PRO)barcodes/

TLIB1 = $(addprefix $(BLOC),$(tlib1))
TLIB2 = $(addprefix $(BLOC),$(tlib2))
TLIB = $(TLIB1) $(TLIB2)

TPOL = $(addprefix $(BLOC),$(tpol))
BAR = $(addprefix $(BLOC),$(bar))
BAR1 = $(addprefix $(BLOC),$(bar1))
BAR2 = $(addprefix $(BLOC),$(bar2))

pool1 = $(shell head -n 1 $(TPOL))
pool2 = $(shell tail -n 1 $(TPOL))

# ( ACACGACA-TCATTGAG CAGTGTGT-TCATTGAG )
#UTAG = $(shell while read p; do cat $(TLIB) | awk -F$$'\t' -v P=$$p -- ' { print $$2"-"P } ' ; done < $(TPOL))
utag1 = $(shell awk ' { print $$2"-""$(pool1)" } ' $(TLIB1))
utag2 = $(shell awk ' { print $$2"-""$(pool2)" } ' $(TLIB2))
UTAG = $(utag1) $(utag2)

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

# Get unique de-multiplexed names (i.e. unique tags)
# UIND = ( sample_ACACGACA-TCATTGAG )
UIND = $(addprefix sample_,$(ULIB))

# Use list of unique names to create names for each paired-read
# IND12 = ( sample_ACACGACA-TCATTGAG.1 sample_ACACGACA-TCATTGAG.2 )
IND1 = $(addsuffix .1,$(UIND))
IND2 = $(addsuffix .2,$(UIND))
IND12 = $(IND1) $(IND2)

# Add extensions for different file types
# fq =  ( sample_ACACGACA-TCATTGAG.1.fq sample_ACACGACA-TCATTGAG.2.fq ) 
pfq = $(addsuffix .fq,$(IND12))

# Add prefixes
PFQ = $(addprefix $(PRO),$(pfq))


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
	$(PTH)sampleinfo $(^D) >> $@


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


$(BAR):	$(BAR1) $(BAR2)
	cat $^ > $@

$(BAR1):	$(TPOL) $(TLIB1)
	awk ' { print $$2"\t""$(pool1)" } ' $(word 2,$^) > $@

$(BAR2):	$(TPOL) $(TLIB2)
	awk ' { print $$2"\t""$(pool2)" } ' $(word 2,$^) > $@
