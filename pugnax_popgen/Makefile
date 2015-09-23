
lwin = 10000
step = 1000

PG = pg01/
SH = /shared/Molecol/NBAF/ruff/diag/phasing/
AA = $(SH)aa/

slpar = -w $(lwin) -s $(step)
coi = 2548
#coi = 1270 2063 2548 3047 3208 3357 3750 3913 4111 4944 9013
phased = MB8684ht MB8685ht MB8686ht MB8687ht MB8688ht

pcoi = $(addprefix Contig,$(coi))
phoi = $(foreach p,$(phased),$(addsuffix $(p),$(pcoi)))

cdsbed = $(addsuffix .bed,$(phoi))


covcoi = $(addprefix cov,$(coi))
#dxycoi = $(addprefix dxy,$(coi))

# cov1270_pos_sl.txt
cov-sl = $(addsuffix _sl,$(covcoi))
cov-slpos = $(addsuffix _sl_pos,$(covcoi))

all-cov = $(cov-sl) $(cov-slpos)
COV = $(addsuffix .txt,$(all-cov))

###### ######

.PHONY:	mltrees
mltrees:	RAxML_bestTree.KRISSFF3357_150000_160000.ph RAxML_bestTree.KR3357_280000_290000.ph RAxML_bestTree.KRISSFF3208.ph RAxML_bestTree.KRISSFF3913_150000_160000.ph

#mltrees:	RAxML_bestTree.KRISSFF3357_150000_160000.ph RAxML_bestTree.KR3357_280000_290000.ph RAxML_bootstrap.KRISSFF3357_150000_160000.phb RAxML_bootstrap.KR3357_280000_290000.phb RAxML_bestTree.KRISSFF3357_150000_160000.phz RAxML_bestTree.KR3357_280000_290000.phz

#RAxML_bestTree.%.phz:	RAxML_bestTree.%.ph RAxML_bootstrap.%.phb
#	/home/mist/Documents/standard-RAxML-8.1.20/raxmlHPC-AVX -m GTRCAT -f b -t $(word 1,$^) -z $(word 2,$^) -n $*.phz 

#RAxML_bootstrap.%.phb:	%_aln_edit.fa
#	/home/mist/Documents/standard-RAxML-8.1.20/raxmlHPC-AVX -m GTRGAMMA -s $^ -o Kildeer -n $*.phb -p 123123 -b 123123 -# 50

#RAxML_bestTree.%.ph:	%_aln_edit.fa
#	/home/mist/Documents/standard-RAxML-8.1.20/raxmlHPC-AVX -m GTRGAMMA -s $^ -o Kildeer -n $*.ph -p 123123 -# 50

RAxML_bestTree.%.ph:	%_aln_edit.fa
	/home/mist/Documents/standard-RAxML-8.1.20/raxmlHPC-AVX -m GTRGAMMA -s $^ -o Kildeer -n $*.ph -p 123123 -# 50

%_aln_edit.fa:	%_aln.fa
	awk ' { if ($$0 ~ "scaffold") print ">Kildeer"; else { gsub(":","_",$$0); print $$0 } } ' $^ > $@

###### ######

#CDSBED = $(addprefix $(PG),$(cdsbed))
# Contig1270_g2
#ugenes = $(shell cat $(CDSBED) | awk -F"\t" ' { split($$4,a,"_"); print a[1]"_"a[3] } ' | sort | uniq)
#indugenes = $(shell cat $(CDSBED) | grep "MB8684" | awk -F"\t" ' { split($$4,a,"_"); print a[1]"_"a[3]"_"a[2] } ' | sort | uniq)

#FTAB = $(subst .bed,.ftab,$(CDSBED))
#UFA = $(addprefix $(PG),$(addsuffix .fa,$(ugenes)))
#indtab = $(addsuffix MB8684ht_cds.ftab,$(coi))
#INDTAB = $(addprefix $(PG)Contig,$(indtab))
#INDFA = $(addprefix $(PG)blst_,$(addsuffix .fa,$(indugenes)))
#kfa = $(subst MB8684,KILDEER,$(indugenes))
#KFA = $(addprefix $(PG),$(addsuffix .fa,$(kfa)))
#KCDS = $(addprefix $(PG)cds_,$(addsuffix .fa,$(kfa)))

#afa = $(subst _KILDEER,,$(KFA))
#AFA = $(subst $(PG),$(PG)all_,$(afa))

.PNONY:	catall
catall:	$(AFA)

$(PG)all_Contig%.fa:	$(PG)cds_Contig%_KILDEER.fa $(PG)Contig%.fa
	cat $^ | muscle > $@

.PHONY:	kcat
kcat:	$(KCDS)

$(PG)cds_%_KILDEER.fa:	$(PG)%_KILDEER.fa
	awk -F"\t" ' { split($$1,a,"_"); A[a[1]"_"a[2]"_"a[3]]=A[a[1]"_"a[2]"_"a[3]]$$2 }; END { for (i in A) print ">"i"\n"A[i] } ' $^ > $@

.PHONY:	kblast
kblast:	$(KFA)

$(PG)%_KILDEER.fa:	$(PG)blst_%_MB8684.fa
	~/ncbi-blast-2.2.29+/bin/blastn -query $^ -db assemblies/KILDEER.fa -outfmt '10 qseqid sseq' | awk -F, ' { gsub("MB8684","KILDEER",$$0); print $$1"\t"$$2 } ' > $@

.PHONY:	cds-by-gene
cds-by-gene:	$(FTAB) $(UFA) $(INDTAB) $(INDFA)

$(PG)blst_%.fa:	$(INDTAB)
	cat $^ | grep "$*_" | awk -F"\t" ' { print ">"$$1"\n"$$2 } ' > $@

# prepare ind fasta files. Each file is 1 gene, but with the different cds regions in separate sequences
$(PG)%4ht_cds.ftab:	$(SH)%4ht.fasta $(PG)%4ht.bed
	bedtools getfasta -tab -name -s -fi $(word 1,$^) -bed $(word 2,$^) -fo - | awk -F"\t" ' { split($$1,a,"_"); gsub(a[2]"_"a[3],a[3]"_"a[2],$$1); print $$1"\t"$$2 }' > $@

# chr_geneid
$(PG)Contig%.fa:	$(FTAB)
	cat $^ | grep "Contig$*_" | awk -F"\t" ' { print ">"$$1"\n"$$2 } ' > $@

# get fasta, concatenate cds regions, and allow greping by "chr_geneid"
$(PG)%ht.ftab:	$(SH)%ht.fasta $(PG)%ht.bed
	bedtools getfasta -tab -name -s -fi $(word 1,$^) -bed $(word 2,$^) -fo - | awk -F"\t" ' { split($$1,a,"_"); A[a[1]"_"a[3]"_"a[2]]=A[a[1]"_"a[3]"_"a[2]]$$2 }; END { for (i in A) print i"\t"A[i] } ' > $@

.PHONY:	cds-ann
cds-ann:	$(CDSBED)

$(PG)Contig%.bed:	$(AA)Contig%.fasta.gff
	grep "^#" -v $^ | grep "CDS" | awk -F"\t" ' BEGIN { OFS="\t" }; { split($$1,a,"_"); split($$9,b,";"); gsub(" gene_id ","",b[2]); gsub(/"/,"",b[2]); print $$1,$$4,$$5,a[1]"_"a[2]"_"b[2]"_cds_"$$4"_"$$5,$$6,$$7 } '> $@

###### ######

.PHONY:	wgs-depth
wgs-depth:	$(COV)

cov%_sl_pos.txt:	inv%_depth.txt cov%_sl.txt
	awk ' BEGIN { n = 0; s = 0 }{ n++; if (n >= $(lwin)) { s++; if (s == $(step)) { s = 0; print $$2 - ($(lwin) / 2) } } } ' $(word 1,$^) > inv$*_depth_pos.txt
	paste -d" " inv$*_depth_pos.txt $(word 2,$^) > $@
	rm inv$*_depth_pos.txt

cov%_sl.txt:	inv%_depth.txt
	awk -F"\t" ' BEGIN { OFS=" " }; { $$1=$$1; print $$0 } ' $^ | /home/mist/repos/slide/bin/slmean -k 3-7 $(slpar) > $@

inv%_depth.txt:	inv_depth.txt.gz
	zcat $^ | grep "Contig$*" > $@

###### ######

altsnps = altsnps.txt

rf_1k1 = dxy_rf_1k1.txt
rf_5k500 = dxy_rf_5k500.txt
rf_10k1k = dxy_rf_10k1k.txt
rf_50k1k = dxy_rf_50k1k.txt

rs_1k1 = dxy_rs_1k1.txt
rs_5k500 = dxy_rs_5k500.txt
rs_10k1k = dxy_rs_10k1k.txt
rs_50k1k = dxy_rs_50k1k.txt

fs_1k1 = dxy_fs_1k1.txt
fs_5k500 = dxy_fs_5k500.txt
fs_10k1k = dxy_fs_10k1k.txt
fs_50k1k = dxy_fs_50k1k.txt

allfiles = $(altsnps) $(rf_1k1) $(rf_5k500) $(rf_10k1k) $(rf_50k1k) $(rs_1k1) $(rs_5k500) $(rs_10k1k) $(rs_50k1k) $(fs_1k1) $(fs_5k500) $(fs_10k1k) $(fs_50k1k)

ctigs = 1270 2063 3047 3208 3357 3913 4111 9013
CTIGS = $(addprefix $(PG)Contig,$(ctigs))

ALLF = $(foreach d,$(allfiles),$(addsuffix $(d),$(CTIGS)))

.PHONY:	alt-dxy
alt-dxy:	$(ALLF)

$(PG)Contig%dxy_rf_50k1k.txt:	$(PG)Contig%dxy_rf.txt $(PG)Contig%dxy_rf_50k1k_sl.txt
	awk ' BEGIN { n = 0; s = 0 }{ n++; if (n >= 50000) { s++; if (s == 1000) { s = 0; print $$2 - (50000 / 2) } } } ' $(word 1,$^) > tmp$*_50k1k_pos.txt
	paste -d" " tmp$*_50k1k_pos.txt $(word 2,$^) > $@
	rm tmp$*_50k1k_pos.txt

$(PG)Contig%dxy_rf_50k1k_sl.txt:	$(PG)Contig%dxy_rf.txt
	cat $^ | slmean -k 3 -w 50000 -s 1000 > $@

$(PG)Contig%dxy_rf_10k1k.txt:	$(PG)Contig%dxy_rf.txt $(PG)Contig%dxy_rf_10k1k_sl.txt
	awk ' BEGIN { n = 0; s = 0 }{ n++; if (n >= 10000) { s++; if (s == 1000) { s = 0; print $$2 - (10000 / 2) } } } ' $(word 1,$^) > tmp$*_10k1k_pos.txt
	paste -d" " tmp$*_10k1k_pos.txt $(word 2,$^) > $@
	rm tmp$*_10k1k_pos.txt

$(PG)Contig%dxy_rf_10k1k_sl.txt:	$(PG)Contig%dxy_rf.txt
	cat $^ | slmean -k 3 -w 10000 -s 1000 > $@

$(PG)Contig%dxy_rf_5k500.txt:	$(PG)Contig%dxy_rf.txt $(PG)Contig%dxy_rf_5k500_sl.txt
	awk ' BEGIN { n = 0; s = 0 }{ n++; if (n >= 5000) { s++; if (s == 500) { s = 0; print $$2 - (5000 / 2) } } } ' $(word 1,$^) > tmp$*_5k500_pos.txt
	paste -d" " tmp$*_5k500_pos.txt $(word 2,$^) > $@
	rm tmp$*_5k500_pos.txt

$(PG)Contig%dxy_rf_5k500_sl.txt:	$(PG)Contig%dxy_rf.txt
	cat $^ | slmean -k 3 -w 5000 -s 500 > $@

$(PG)Contig%dxy_rf_1k1.txt:	$(PG)Contig%dxy_rf.txt $(PG)Contig%dxy_rf_1k1_sl.txt
	awk ' BEGIN { n = 0; s = 0 }{ n++; if (n >= 1000) { s++; if (s == 1) { s = 0; print $$2 - (1000 / 2) } } } ' $(word 1,$^) > tmp$*_1k1_pos.txt
	paste -d" " tmp$*_1k1_pos.txt $(word 2,$^) > $@
	rm tmp$*_1k1_pos.txt

$(PG)Contig%dxy_rf_1k1_sl.txt:	$(PG)Contig%dxy_rf.txt
	cat $^ | slmean -k 3 -w 1000 -s 1 > $@

##

$(PG)Contig%dxy_rs_10k1k.txt:	$(PG)Contig%dxy_rs.txt $(PG)Contig%dxy_rs_10k1k_sl.txt
	awk ' BEGIN { n = 0; s = 0 }{ n++; if (n >= 10000) { s++; if (s == 1000) { s = 0; print $$2 - (10000 / 2) } } } ' $(word 1,$^) > tmp$*_10k1k_pos.txt
	paste -d" " tmp$*_10k1k_pos.txt $(word 2,$^) > $@
	rm tmp$*_10k1k_pos.txt

$(PG)Contig%dxy_rs_10k1k_sl.txt:	$(PG)Contig%dxy_rs.txt
	cat $^ | slmean -k 3 -w 10000 -s 1000 > $@

$(PG)Contig%dxy_rs_50k1k.txt:	$(PG)Contig%dxy_rs.txt $(PG)Contig%dxy_rs_50k1k_sl.txt
	awk ' BEGIN { n = 0; s = 0 }{ n++; if (n >= 50000) { s++; if (s == 1000) { s = 0; print $$2 - (50000 / 2) } } } ' $(word 1,$^) > tmp$*_50k1k_pos.txt
	paste -d" " tmp$*_50k1k_pos.txt $(word 2,$^) > $@
	rm tmp$*_50k1k_pos.txt

$(PG)Contig%dxy_rs_50k1k_sl.txt:	$(PG)Contig%dxy_rs.txt
	cat $^ | slmean -k 3 -w 50000 -s 1000 > $@

$(PG)Contig%dxy_rs_5k500.txt:	$(PG)Contig%dxy_rs.txt $(PG)Contig%dxy_rs_5k500_sl.txt
	awk ' BEGIN { n = 0; s = 0 }{ n++; if (n >= 5000) { s++; if (s == 500) { s = 0; print $$2 - (5000 / 2) } } } ' $(word 1,$^) > tmp$*_5k500_pos.txt
	paste -d" " tmp$*_5k500_pos.txt $(word 2,$^) > $@
	rm tmp$*_5k500_pos.txt

$(PG)Contig%dxy_rs_5k500_sl.txt:	$(PG)Contig%dxy_rs.txt
	cat $^ | slmean -k 3 -w 5000 -s 500 > $@

$(PG)Contig%dxy_rs_1k1.txt:	$(PG)Contig%dxy_rs.txt $(PG)Contig%dxy_rs_1k1_sl.txt
	awk ' BEGIN { n = 0; s = 0 }{ n++; if (n >= 1000) { s++; if (s == 1) { s = 0; print $$2 - (1000 / 2) } } } ' $(word 1,$^) > tmp$*_1k1_pos.txt
	paste -d" " tmp$*_1k1_pos.txt $(word 2,$^) > $@
	rm tmp$*_1k1_pos.txt

$(PG)Contig%dxy_rs_1k1_sl.txt:	$(PG)Contig%dxy_rs.txt
	cat $^ | slmean -k 3 -w 1000 -s 1 > $@

##

$(PG)Contig%dxy_fs_50k1k.txt:	$(PG)Contig%dxy_fs.txt $(PG)Contig%dxy_fs_50k1k_sl.txt
	awk ' BEGIN { n = 0; s = 0 }{ n++; if (n >= 50000) { s++; if (s == 1000) { s = 0; print $$2 - (50000 / 2) } } } ' $(word 1,$^) > tmp$*_50k1k_pos.txt
	paste -d" " tmp$*_50k1k_pos.txt $(word 2,$^) > $@
	rm tmp$*_50k1k_pos.txt

$(PG)Contig%dxy_fs_50k1k_sl.txt:	$(PG)Contig%dxy_fs.txt
	cat $^ | slmean -k 3 -w 50000 -s 1000 > $@

$(PG)Contig%dxy_fs_10k1k.txt:	$(PG)Contig%dxy_fs.txt $(PG)Contig%dxy_fs_10k1k_sl.txt
	awk ' BEGIN { n = 0; s = 0 }{ n++; if (n >= 10000) { s++; if (s == 1000) { s = 0; print $$2 - (10000 / 2) } } } ' $(word 1,$^) > tmp$*_10k1k_pos.txt
	paste -d" " tmp$*_10k1k_pos.txt $(word 2,$^) > $@
	rm tmp$*_10k1k_pos.txt

$(PG)Contig%dxy_fs_10k1k_sl.txt:	$(PG)Contig%dxy_fs.txt
	cat $^ | slmean -k 3 -w 10000 -s 1000 > $@

$(PG)Contig%dxy_fs_5k500.txt:	$(PG)Contig%dxy_fs.txt $(PG)Contig%dxy_fs_5k500_sl.txt
	awk ' BEGIN { n = 0; s = 0 }{ n++; if (n >= 5000) { s++; if (s == 500) { s = 0; print $$2 - (5000 / 2) } } } ' $(word 1,$^) > tmp$*_5k500_pos.txt
	paste -d" " tmp$*_5k500_pos.txt $(word 2,$^) > $@
	rm tmp$*_5k500_pos.txt

$(PG)Contig%dxy_fs_5k500_sl.txt:	$(PG)Contig%dxy_fs.txt
	cat $^ | slmean -k 3 -w 5000 -s 500 > $@

$(PG)Contig%dxy_fs_1k1.txt:	$(PG)Contig%dxy_fs.txt $(PG)Contig%dxy_fs_1k1_sl.txt
	awk ' BEGIN { n = 0; s = 0 }{ n++; if (n >= 1000) { s++; if (s == 1) { s = 0; print $$2 - (1000 / 2) } } } ' $(word 1,$^) > tmp$*_1k1_pos.txt
	paste -d" " tmp$*_1k1_pos.txt $(word 2,$^) > $@
	rm tmp$*_1k1_pos.txt

$(PG)Contig%dxy_fs_1k1_sl.txt:	$(PG)Contig%dxy_fs.txt
	cat $^ | slmean -k 3 -w 1000 -s 1 > $@

##

$(PG)Contig%dxy_rf.txt:	$(PG)Contig%altsnps.txt
	awk ' { print $$1,$$2,($$7+$$8)/2 } ' $^ > $@

$(PG)Contig%dxy_rs.txt:	$(PG)Contig%altsnps.txt
	awk ' { print $$1,$$2,($$5+$$6)/2 } ' $^ > $@

$(PG)Contig%dxy_fs.txt:	$(PG)Contig%altsnps.txt
	awk ' { if ($$5=="NA") { B1="NA"; B2="NA"; A1="NA"; A2="NA" } else { B1=$$5+$$6; B2=$$7+$$8; A1=2-B1; A2=2-B2 }; print $$1,$$2,((A1*B2)+(A2*B1))/4 } ' $^ > $@
#	awk ' { print $$1,$$2,(($$5*$$8)+($$6*$$7))/4 } ' $^ > $@

$(PG)Contig%altsnps.txt:	hapalign/Contig%ht_ref_alignment.mafft.fasta
	python ~/lib/Evolib/fabysite.py $^ > $@

###### ######

#$(PG)Contig3357dxy_ki.txt:	$(PG)KRISSFF3357.txt
#	awk ' { if ($$3 == "NA" || $$4 == "NA) { print $$1,$$2,"NA" } else { der=$$3+$$4; anc=2-der; print $$1,$$2,}  } ' $^ > $@

###### ######

wgs5-sf = $(PG)faen12_wgs5.txt $(PG)satn12_wgs5.txt $(PG)indn12_wgs5.txt

wgs5-10k-1k = $(subst wgs5,wgs5_10k_1k,$(wgs5-sf))
wgs5-5k-500 = $(subst wgs5,wgs5_5k_500,$(wgs5-sf))
wgs5-1k-1 = $(subst wgs5,wgs5_1k_1,$(wgs5-sf))

.PHONY:	theta
theta:	$(wgs5-10k-1k) $(wgs5-5k-500) $(wgs5-1k-1)

$(PG)%_10k_1k.txt:	$(PG)%.txt
	cat $^ | sltheta 4 10000 1000 > $@

$(PG)%_5k_500.txt:	$(PG)%.txt
	cat $^ | sltheta 4 5000 500 > $@

$(PG)%_1k_1.txt:	$(PG)%.txt
	cat $^ | sltheta 4 1000 1 > $@

$(PG)indn12_wgs5_10k_1k.txt:	$(PG)indn12_wgs5.txt
	cat $^ | sltheta 2 10000 1000 > $@

$(PG)indn12_wgs5_5k_500.txt:	$(PG)indn12_wgs5.txt
	cat $^ | sltheta 2 5000 500 > $@

$(PG)indn12_wgs5_1k_1.txt:	$(PG)indn12_wgs5.txt
	cat $^ | sltheta 2 1000 1 > $@

###### ######

dxygz = $(PG)dxyF_I.txt.gz $(PG)dxyF_S.txt.gz $(PG)dxyS_I.txt.gz $(PG)dxyF_SI.txt.gz
dxygz17 = $(PG)dxy17_F_I.txt.gz $(PG)dxy17_F_S.txt.gz $(PG)dxy17_S_I.txt.gz $(PG)dxy17_F_SI.txt.gz

# dxyF_I.txt.gz -> dxyF_I_1270.txt dxyF_I_2063.txt... 
dxycoi = $(foreach d,$(coi),$(subst .txt.gz,_$(d).txt,$(dxygz)))
dxycoi17 = $(foreach d,$(coi),$(subst .txt.gz,_$(d).txt,$(dxygz17)))

dxywin = $(subst dxy,dxywin,$(dxycoi))
dxywin17 = $(subst dxy17,dxywin17,$(dxycoi17))

dxy1k1 = $(subst .txt,_1k_1.txt,$(dxywin))
dxy5k500 = $(subst .txt,_5k_500.txt,$(dxywin))
dxy10k1k = $(subst .txt,_10k_1k.txt,$(dxywin))
dxy20k1k = $(subst .txt,_20k_1k.txt,$(dxywin))
dxy20k2k = $(subst .txt,_20k_2k.txt,$(dxywin))
dxy50k5k = $(subst .txt,_50k_5k.txt,$(dxywin))

dxy17-1k1 = $(subst .txt,_1k_1.txt,$(dxywin17))
dxy17-5k500 = $(subst .txt,_5k_500.txt,$(dxywin17))
dxy17-10k1k = $(subst .txt,_10k_1k.txt,$(dxywin17))
dxy17-20k1k = $(subst .txt,_20k_1k.txt,$(dxywin17))
dxy17-20k2k = $(subst .txt,_20k_2k.txt,$(dxywin17))
dxy17-50k5k = $(subst .txt,_50k_5k.txt,$(dxywin17))

##

dxywindows = $(dxy50k5k)
#$(dxy20k2k) $(dxy20k1k) $(dxy10k1k) $(dxy5k500) $(dxy1k1)
#$(dxy17-50k5k) $(dxy17-20k2k) $(dxy17-20k1k) $(dxy17-10k1k) $(dxy17-5k500) $(dxy17-1k1)

# dxyF_I_1270_10k_1k_sl.txt dxyF_I_1270_10k_1k_pos.txt dxyF_I_1270_10k_1k.txt

.PHONY:	dxy
dxy:	$(dxywindows)

$(PG)dxywin%_50k_5k.txt:	$(PG)dxy%.txt $(PG)dxy%_50k_5k_sl.txt
	awk ' BEGIN { n = 0; s = 0 }{ n++; if (n >= 50000) { s++; if (s == 5000) { s = 0; print $$2 - (50000 / 2) } } } ' $(word 1,$^) > $(PG)dxy$*_50k_5k_pos.txt
	paste -d" " $(PG)dxy$*_50k_5k_pos.txt $(word 2,$^) > $@

$(PG)dxywin%_20k_2k.txt:	$(PG)dxy%.txt $(PG)dxy%_20k_2k_sl.txt
	awk ' BEGIN { n = 0; s = 0 }{ n++; if (n >= 20000) { s++; if (s == 2000) { s = 0; print $$2 - (20000 / 2) } } } ' $(word 1,$^) > $(PG)dxy$*_20k_2k_pos.txt
	paste -d" " $(PG)dxy$*_20k_2k_pos.txt $(word 2,$^) > $@

$(PG)dxywin%_20k_1k.txt:	$(PG)dxy%.txt $(PG)dxy%_20k_1k_sl.txt
	awk ' BEGIN { n = 0; s = 0 }{ n++; if (n >= 20000) { s++; if (s == 1000) { s = 0; print $$2 - (20000 / 2) } } } ' $(word 1,$^) > $(PG)dxy$*_20k_1k_pos.txt
	paste -d" " $(PG)dxy$*_20k_1k_pos.txt $(word 2,$^) > $@

$(PG)dxywin%_10k_1k.txt:	$(PG)dxy%.txt $(PG)dxy%_10k_1k_sl.txt
	awk ' BEGIN { n = 0; s = 0 }{ n++; if (n >= 10000) { s++; if (s == 1000) { s = 0; print $$2 - (10000 / 2) } } } ' $(word 1,$^) > $(PG)dxy$*_10k_1k_pos.txt
	paste -d" " $(PG)dxy$*_10k_1k_pos.txt $(word 2,$^) > $@

$(PG)dxywin%_5k_500.txt:	$(PG)dxy%.txt $(PG)dxy%_5k_500_sl.txt
	awk ' BEGIN { n = 0; s = 0 }{ n++; if (n >= 5000) { s++; if (s == 500) { s = 0; print $$2 - (5000 / 2) } } } ' $(word 1,$^) > $(PG)dxy$*_5k_500_pos.txt
	paste -d" " $(PG)dxy$*_5k_500_pos.txt $(word 2,$^) > $@

$(PG)dxywin%_1k_1.txt:	$(PG)dxy%.txt $(PG)dxy%_1k_1_sl.txt
	awk ' BEGIN { n = 0; s = 0 }{ n++; if (n >= 1000) { s++; if (s == 1) { s = 0; print $$2 - (1000 / 2) } } } ' $(word 1,$^) > $(PG)dxy$*_1k_1_pos.txt
	paste -d" " $(PG)dxy$*_1k_1_pos.txt $(word 2,$^) > $@


##

$(PG)dxy%_50k_5k_sl.txt:	$(PG)dxy%.txt
	cat $^ | slmean -k 7 -w 50000 -s 5000 > $@

$(PG)dxy%_20k_2k_sl.txt:	$(PG)dxy%.txt
	cat $^ | slmean -k 7 -w 20000 -s 2000 > $@

$(PG)dxy%_20k_1k_sl.txt:	$(PG)dxy%.txt
	cat $^ | slmean -k 7 -w 20000 -s 1000 > $@

$(PG)dxy%_10k_1k_sl.txt:	$(PG)dxy%.txt
	cat $^ | slmean -k 7 -w 10000 -s 1000 > $@

$(PG)dxy%_5k_500_sl.txt:	$(PG)dxy%.txt
	cat $^ | slmean -k 7 -w 5000 -s 500 > $@

$(PG)dxy%_1k_1_sl.txt:	$(PG)dxy%.txt
	cat $^ | slmean -k 7 -w 1000 -s 1 > $@

.PHONY:	dxy2548
dxy2548:	$(PG)dxywinF_SI_2548_50k_5k.txt $(PG)dxywinF_I_2548_50k_5k.txt $(PG)dxywinS_I_2548_50k_5k.txt $(PG)dxywinF_S_2548_50k_5k.txt

$(PG)dxywin%_2548_50k_5k.txt:	$(PG)dxy%_2548.txt $(PG)sldxy%_2548_50k_5k.txt
	awk ' BEGIN { n = 0; s = 0 }{ n++; if (n >= 50000) { s++; if (s == 5000) { s = 0; print $$2 - (50000 / 2) } } } ' $(word 1,$^) > $(PG)dxy$*_2548_50k_5k_pos.txt
	paste -d" " $(PG)dxy$*_2548_50k_5k_pos.txt $(word 2,$^) > $@

$(PG)sldxy%_2548_50k_5k.txt:	$(PG)dxy%_2548.txt
	cat $^ | slmean -k 7 -w 50000 -s 5000 > $@
##

.PHONY:	nalleles17
nalleles17:	$(dxycoi17)

$(PG)dxy17_F_SI_1270.txt:	~/shared/ruff/illumina_high/snps_wgs17/17_samples_contig1270_nv_raw.vcf
	cat $^ | dxy F_SI wgs17 > $@

$(PG)dxy17_F_SI_2063.txt:	~/shared/ruff/illumina_high/snps_wgs17/17_samples_contig2063_nv_raw.vcf
	cat $^ | dxy F_SI wgs17 > $@

$(PG)dxy17_F_SI_3047.txt:	~/shared/ruff/illumina_high/snps_wgs17/17_samples_contig3047_nv_raw.vcf
	cat $^ | dxy F_SI wgs17 > $@

$(PG)dxy17_F_SI_3208.txt:	~/shared/ruff/illumina_high/snps_wgs17/17_samples_contig3208_nv_raw.vcf
	cat $^ | dxy F_SI wgs17 > $@

$(PG)dxy17_F_SI_3357.txt:	~/shared/ruff/illumina_high/snps_wgs17/17_samples_contig3357_nv_raw.vcf
	cat $^ | dxy F_SI wgs17 > $@

$(PG)dxy17_F_SI_3750.txt:	~/shared/ruff/illumina_high/snps_wgs17/17_samples_contig3750_nv_raw.vcf
	cat $^ | dxy F_SI wgs17 > $@

$(PG)dxy17_F_SI_3913.txt:	~/shared/ruff/illumina_high/snps_wgs17/17_samples_contig3913_nv_raw.vcf
	cat $^ | dxy F_SI wgs17 > $@

$(PG)dxy17_F_SI_4111.txt:	~/shared/ruff/illumina_high/snps_wgs17/17_samples_contig4111_nv_raw.vcf
	cat $^ | dxy F_SI wgs17 > $@

$(PG)dxy17_F_SI_4944.txt:	~/shared/ruff/illumina_high/snps_wgs17/17_samples_contig4944_nv_raw.vcf
	cat $^ | dxy F_SI wgs17 > $@

$(PG)dxy17_F_SI_9013.txt:	~/shared/ruff/illumina_high/snps_wgs17/17_samples_contig9013_nv_raw.vcf
	cat $^ | dxy F_SI wgs17 > $@

##

$(PG)dxy17_F_S_1270.txt:	~/shared/ruff/illumina_high/snps_wgs17/17_samples_contig1270_nv_raw.vcf
	cat $^ | dxy F_S wgs17 > $@

$(PG)dxy17_F_S_2063.txt:	~/shared/ruff/illumina_high/snps_wgs17/17_samples_contig2063_nv_raw.vcf
	cat $^ | dxy F_S wgs17 > $@

$(PG)dxy17_F_S_3047.txt:	~/shared/ruff/illumina_high/snps_wgs17/17_samples_contig3047_nv_raw.vcf
	cat $^ | dxy F_S wgs17 > $@

$(PG)dxy17_F_S_3208.txt:	~/shared/ruff/illumina_high/snps_wgs17/17_samples_contig3208_nv_raw.vcf
	cat $^ | dxy F_S wgs17 > $@

$(PG)dxy17_F_S_3357.txt:	~/shared/ruff/illumina_high/snps_wgs17/17_samples_contig3357_nv_raw.vcf
	cat $^ | dxy F_S wgs17 > $@

$(PG)dxy17_F_S_3750.txt:	~/shared/ruff/illumina_high/snps_wgs17/17_samples_contig3750_nv_raw.vcf
	cat $^ | dxy F_S wgs17 > $@

$(PG)dxy17_F_S_3913.txt:	~/shared/ruff/illumina_high/snps_wgs17/17_samples_contig3913_nv_raw.vcf
	cat $^ | dxy F_S wgs17 > $@

$(PG)dxy17_F_S_4111.txt:	~/shared/ruff/illumina_high/snps_wgs17/17_samples_contig4111_nv_raw.vcf
	cat $^ | dxy F_S wgs17 > $@

$(PG)dxy17_F_S_4944.txt:	~/shared/ruff/illumina_high/snps_wgs17/17_samples_contig4944_nv_raw.vcf
	cat $^ | dxy F_S wgs17 > $@

$(PG)dxy17_F_S_9013.txt:	~/shared/ruff/illumina_high/snps_wgs17/17_samples_contig9013_nv_raw.vcf
	cat $^ | dxy F_S wgs17 > $@

##

$(PG)dxy17_F_I_1270.txt:	~/shared/ruff/illumina_high/snps_wgs17/17_samples_contig1270_nv_raw.vcf
	cat $^ | dxy F_I wgs17 > $@

$(PG)dxy17_F_I_2063.txt:	~/shared/ruff/illumina_high/snps_wgs17/17_samples_contig2063_nv_raw.vcf
	cat $^ | dxy F_I wgs17 > $@

$(PG)dxy17_F_I_3047.txt:	~/shared/ruff/illumina_high/snps_wgs17/17_samples_contig3047_nv_raw.vcf
	cat $^ | dxy F_I wgs17 > $@

$(PG)dxy17_F_I_3208.txt:	~/shared/ruff/illumina_high/snps_wgs17/17_samples_contig3208_nv_raw.vcf
	cat $^ | dxy F_I wgs17 > $@

$(PG)dxy17_F_I_3357.txt:	~/shared/ruff/illumina_high/snps_wgs17/17_samples_contig3357_nv_raw.vcf
	cat $^ | dxy F_I wgs17 > $@

$(PG)dxy17_F_I_3750.txt:	~/shared/ruff/illumina_high/snps_wgs17/17_samples_contig3750_nv_raw.vcf
	cat $^ | dxy F_I wgs17 > $@

$(PG)dxy17_F_I_3913.txt:	~/shared/ruff/illumina_high/snps_wgs17/17_samples_contig3913_nv_raw.vcf
	cat $^ | dxy F_I wgs17 > $@

$(PG)dxy17_F_I_4111.txt:	~/shared/ruff/illumina_high/snps_wgs17/17_samples_contig4111_nv_raw.vcf
	cat $^ | dxy F_I wgs17 > $@

$(PG)dxy17_F_I_4944.txt:	~/shared/ruff/illumina_high/snps_wgs17/17_samples_contig4944_nv_raw.vcf
	cat $^ | dxy F_I wgs17 > $@

$(PG)dxy17_F_I_9013.txt:	~/shared/ruff/illumina_high/snps_wgs17/17_samples_contig9013_nv_raw.vcf
	cat $^ | dxy F_I wgs17 > $@

##

$(PG)dxy17_S_I_1270.txt:	~/shared/ruff/illumina_high/snps_wgs17/17_samples_contig1270_nv_raw.vcf
	cat $^ | dxy S_I wgs17 > $@

$(PG)dxy17_S_I_2063.txt:	~/shared/ruff/illumina_high/snps_wgs17/17_samples_contig2063_nv_raw.vcf
	cat $^ | dxy S_I wgs17 > $@

$(PG)dxy17_S_I_3047.txt:	~/shared/ruff/illumina_high/snps_wgs17/17_samples_contig3047_nv_raw.vcf
	cat $^ | dxy S_I wgs17 > $@

$(PG)dxy17_S_I_3208.txt:	~/shared/ruff/illumina_high/snps_wgs17/17_samples_contig3208_nv_raw.vcf
	cat $^ | dxy S_I wgs17 > $@

$(PG)dxy17_S_I_3357.txt:	~/shared/ruff/illumina_high/snps_wgs17/17_samples_contig3357_nv_raw.vcf
	cat $^ | dxy S_I wgs17 > $@

$(PG)dxy17_S_I_3750.txt:	~/shared/ruff/illumina_high/snps_wgs17/17_samples_contig3750_nv_raw.vcf
	cat $^ | dxy S_I wgs17 > $@

$(PG)dxy17_S_I_3913.txt:	~/shared/ruff/illumina_high/snps_wgs17/17_samples_contig3913_nv_raw.vcf
	cat $^ | dxy S_I wgs17 > $@

$(PG)dxy17_S_I_4111.txt:	~/shared/ruff/illumina_high/snps_wgs17/17_samples_contig4111_nv_raw.vcf
	cat $^ | dxy S_I wgs17 > $@

$(PG)dxy17_S_I_4944.txt:	~/shared/ruff/illumina_high/snps_wgs17/17_samples_contig4944_nv_raw.vcf
	cat $^ | dxy S_I wgs17 > $@

$(PG)dxy17_S_I_9013.txt:	~/shared/ruff/illumina_high/snps_wgs17/17_samples_contig9013_nv_raw.vcf
	cat $^ | dxy S_I wgs17 > $@

##

.PHONY:	nalleles
nalleles:	$(dxycoi) $(dxygz)

$(PG)dxyF_I_%.txt:	$(PG)dxyF_I.txt.gz
	zcat $^ | grep "Contig$*" > $@

$(PG)dxyF_S_%.txt:	$(PG)dxyF_S.txt.gz
	zcat $^ | grep "Contig$*" > $@

$(PG)dxyS_I_%.txt:	$(PG)dxyS_I.txt.gz
	zcat $^ | grep "Contig$*" > $@

$(PG)dxyF_SI_%.txt:	$(PG)dxyF_SI.txt.gz
	zcat $^ | grep "Contig$*" > $@


##

$(PG)dxyF_I.txt.gz:	$(PG)inv.vcf
	cat $^ | dxy F_I wgs5 | gzip > $@

$(PG)dxyF_S.txt.gz:	$(PG)inv.vcf
	cat $^ | dxy F_S wgs5 | gzip > $@

$(PG)dxyS_I.txt.gz:	$(PG)inv.vcf
	cat $^ | dxy S_I wgs5 | gzip > $@

$(PG)dxyF_SI.txt.gz:	$(PG)inv.vcf
	cat $^ | dxy F_SI wgs5 | gzip > $@

##

