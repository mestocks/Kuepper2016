# File structure:
# ./
# ./data/
# ./scripts/
# ./results/

DTA = data/
SCR = scripts/
RLT = results/

###### ######
# Quality stats from raw reads.
###### ######

qPlots = $(RLT)meanVarPerRead.pdf $(RLT)readlengths.pdf $(DTA)runStats.txt $(DTA)runStats.wiki $(RLT)readScores.pdf $(RLT)removeLowReadScores.pdf $(RLT)filterEffect.pdf

.PHONY:	qStats
qStats:	$(qPlots)

### ###
# Scripts/libraries
# + rawk (https://github.com/mspopgen/rawk)

### ###
# Input files:

# + output.all
#   + PacBio.py
#     + pbcore (https://github.com/PacificBiosciences/pbcore/tree/master/pbcore)
#     + numpy
#   $ ls -1 *h5 > pbh5.txt
#   $ python PacBio.py < pbh5.txt > output.all

# + meanVarPerRead.txt
#   + pbvar.py
#     + pbcore (https://github.com/PacificBiosciences/pbcore/tree/master/pbcore)
#     + numpy
#   $ ls -1 *h5 > pbh5.txt
#   $ python pbvar.py < pbh5.txt > meanVarPerRead.txt

### ###
# Manual steps:
# - copying runStats.wiki to wiki and editing the column headings.

### ###
### Run R scripts to produce plots.
### ###

$(RLT)%.pdf:	$(DTA)%Prep.txt
	Rscript $(SCR)$*.R

$(RLT)filterEffect.pdf:	$(DTA)readScoresPrep.txt
	Rscript $(SCR)filterEffect.R

### ###
### Calculate stats and generate files for plotting.
### ###

# Subsets the data from 'meanVarPerRead.txt' to exclude the 
# statistics calculated for all reads that are at the end 
# of the file.
$(DTA)meanVarPerReadPrep.txt:	$(DTA)meanVarPerRead.txt
	grep "All" $^ | grep "-v" -- "-0.0" > $@

# Mean read length per run (i.e. per bax.h5 file).
$(DTA)meanBpsPerRunPrep.txt:	$(DTA)output.all
	grep "NaN\|h5path" -v $^ | awk ' { split($$2,new,"/"); print $$4,new[1] } ' | rawk tapply 1 2 mean | awk ' { print $$2,$$1 } ' | sort -nr | awk ' { print $$2,$$1 } ' > $@


# Convert to wiki format.
$(DTA)runStats.wiki:	$(DTA)runStats.txt
	cat $^ | python $(SCR)wikiTable.py " RunName NumReads TotalBps MeanBps MeanReadScore" > $@

# Merge for table, shorten run name and sort by run name.
$(DTA)runStats.txt:	$(DTA)run_Reads-Bps-uBps-rScore.txt
	awk ' { a = substr($$1,1,14); print a,$$2,$$3,$$4,$$5 } ' $^ | sort -n > $@

$(DTA)run_Reads-Bps-uBps-rScore.txt:	$(DTA)run_Reads-Bps-uBps.txt $(DTA)meanReadScorePerRunPrep.txt
	rawk merge -a 1 -b 1 $^ > $@

$(DTA)run_Reads-Bps-uBps.txt:	$(DTA)run_Reads-Bps.txt $(DTA)meanBpsPerRunPrep.txt
	rawk merge -a 1 -b 1 $^ > $@

$(DTA)run_Reads-Bps.txt:	$(DTA)readsPerRunPrep.txt $(DTA)bpsPerRunPrep.txt
	rawk merge -a 1 -b 1 $^ > $@

# Mean read score per run.
$(DTA)meanReadScorePerRunPrep.txt:	$(DTA)output.all
	grep "NaN\|h5path" -v $^ | awk ' { split($$2,new,"/"); print $$3,new[1] } ' | rawk tapply 1 2 mean | awk ' { print $$2,$$1 } ' | sort -nr | awk ' { print $$2,$$1 } ' > $@

# Total bps per run.
$(DTA)bpsPerRunPrep.txt:	$(DTA)output.all
	grep "NaN\|h5path" -v $^ | awk ' { split($$2,new,"/"); print $$4,new[1] } ' | rawk tapply 1 2 sum | awk ' { print $$2,$$1 } ' | sort -nr | awk ' { print $$2,$$1 } ' > $@

# Total number of reads per run.
$(DTA)readsPerRunPrep.txt:	$(DTA)output.all
	grep "NaN\|h5path" -v $^ | awk ' { split($$2,new,"/"); print $$4,new[1] } ' | rawk tapply 1 2 count | awk ' { print $$2,$$1 } ' | sort -nr | awk ' { print $$2,$$1 } ' > $@

# Reduce file columns and parse subread name
$(DTA)readlengthsPrep.txt:	$(DTA)output.all
	grep "NaN\|h5path" -v $^ | awk ' BEGIN { print "movieName zmwName subReadName readScore lenbc c6 c8 c10 c12" }; { split($$2,a,"/"); print a[1],a[2],a[3],$$3,$$4,$$5,$$6,$$7,$$8 } ' > $@

$(DTA)removeLowReadScoresPrep.txt:	$(DTA)readScoresPrep.txt
	rawk subset 1 "x\>=0.75" < $^ > $@

$(DTA)readScoresPrep.txt:	$(DTA)output.all
	grep "NaN\|h5path" -v $^ | awk ' { print $$3,$$4 } ' > $@

