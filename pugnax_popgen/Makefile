
lwin = 10000
step = 1000

slpar = -w $(lwin) -s $(step)
coi = 1270 2063 3047 3208 3357 3750 3913 4111 4944 9013

covcoi = $(addprefix cov,$(coi))
#dxycoi = $(addprefix dxy,$(coi))

# cov1270_pos_sl.txt
cov-sl = $(addsuffix _sl,$(covcoi))
cov-slpos = $(addsuffix _sl_pos,$(covcoi))

all-cov = $(cov-sl) $(cov-slpos)
COV = $(addsuffix .txt,$(all-cov))


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

dxygz = dxyF_I.txt.gz dxyF_S.txt.gz dxyS_I.txt.gz dxyF_SI.txt.gz
dxygz17 = dxy17_F_I.txt.gz dxy17_F_S.txt.gz dxy17_S_I.txt.gz dxy17_F_SI.txt.gz

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

dxywindows = $(dxy50k5k) $(dxy20k2k) $(dxy20k1k) $(dxy10k1k) $(dxy5k500) $(dxy1k1) $(dxy17-50k5k) $(dxy17-20k2k) $(dxy17-20k1k) $(dxy17-10k1k) $(dxy17-5k500) $(dxy17-1k1)

# dxyF_I_1270_10k_1k_sl.txt dxyF_I_1270_10k_1k_pos.txt dxyF_I_1270_10k_1k.txt

.PHONY:	dxy
dxy:	$(dxywindows)

dxywin%_50k_5k.txt:	dxy%.txt dxy%_50k_5k_sl.txt
	awk ' BEGIN { n = 0; s = 0 }{ n++; if (n >= 50000) { s++; if (s == 5000) { s = 0; print $$2 - (50000 / 2) } } } ' $(word 1,$^) > dxy$*_50k_5k_pos.txt
	paste -d" " dxy$*_50k_5k_pos.txt $(word 2,$^) > $@

dxywin%_20k_2k.txt:	dxy%.txt dxy%_20k_2k_sl.txt
	awk ' BEGIN { n = 0; s = 0 }{ n++; if (n >= 20000) { s++; if (s == 2000) { s = 0; print $$2 - (20000 / 2) } } } ' $(word 1,$^) > dxy$*_20k_2k_pos.txt
	paste -d" " dxy$*_20k_2k_pos.txt $(word 2,$^) > $@

dxywin%_20k_1k.txt:	dxy%.txt dxy%_20k_1k_sl.txt
	awk ' BEGIN { n = 0; s = 0 }{ n++; if (n >= 20000) { s++; if (s == 1000) { s = 0; print $$2 - (20000 / 2) } } } ' $(word 1,$^) > dxy$*_20k_1k_pos.txt
	paste -d" " dxy$*_20k_1k_pos.txt $(word 2,$^) > $@

dxywin%_10k_1k.txt:	dxy%.txt dxy%_10k_1k_sl.txt
	awk ' BEGIN { n = 0; s = 0 }{ n++; if (n >= 10000) { s++; if (s == 1000) { s = 0; print $$2 - (10000 / 2) } } } ' $(word 1,$^) > dxy$*_10k_1k_pos.txt
	paste -d" " dxy$*_10k_1k_pos.txt $(word 2,$^) > $@

dxywin%_5k_500.txt:	dxy%.txt dxy%_5k_500_sl.txt
	awk ' BEGIN { n = 0; s = 0 }{ n++; if (n >= 5000) { s++; if (s == 500) { s = 0; print $$2 - (5000 / 2) } } } ' $(word 1,$^) > dxy$*_5k_500_pos.txt
	paste -d" " dxy$*_5k_500_pos.txt $(word 2,$^) > $@

dxywin%_1k_1.txt:	dxy%.txt dxy%_1k_1_sl.txt
	awk ' BEGIN { n = 0; s = 0 }{ n++; if (n >= 1000) { s++; if (s == 1) { s = 0; print $$2 - (1000 / 2) } } } ' $(word 1,$^) > dxy$*_1k_1_pos.txt
	paste -d" " dxy$*_1k_1_pos.txt $(word 2,$^) > $@


##

dxy%_50k_5k_sl.txt:	dxy%.txt
	cat $^ | slmean -k 7 -w 50000 -s 5000 > $@

dxy%_20k_2k_sl.txt:	dxy%.txt
	cat $^ | slmean -k 7 -w 20000 -s 2000 > $@

dxy%_20k_1k_sl.txt:	dxy%.txt
	cat $^ | slmean -k 7 -w 20000 -s 1000 > $@

dxy%_10k_1k_sl.txt:	dxy%.txt
	cat $^ | slmean -k 7 -w 10000 -s 1000 > $@

dxy%_5k_500_sl.txt:	dxy%.txt
	cat $^ | slmean -k 7 -w 5000 -s 500 > $@

dxy%_1k_1_sl.txt:	dxy%.txt
	cat $^ | slmean -k 7 -w 1000 -s 1 > $@

##

.PHONY:	nalleles17
nalleles17:	$(dxycoi17)

dxy17_F_SI_1270.txt:	~/shared/ruff/illumina_high/snps_wgs17/17_samples_contig1270_nv_raw.vcf
	cat $^ | dxy F_SI wgs17 > $@

dxy17_F_SI_2063.txt:	~/shared/ruff/illumina_high/snps_wgs17/17_samples_contig2063_nv_raw.vcf
	cat $^ | dxy F_SI wgs17 > $@

dxy17_F_SI_3047.txt:	~/shared/ruff/illumina_high/snps_wgs17/17_samples_contig3047_nv_raw.vcf
	cat $^ | dxy F_SI wgs17 > $@

dxy17_F_SI_3208.txt:	~/shared/ruff/illumina_high/snps_wgs17/17_samples_contig3208_nv_raw.vcf
	cat $^ | dxy F_SI wgs17 > $@

dxy17_F_SI_3357.txt:	~/shared/ruff/illumina_high/snps_wgs17/17_samples_contig3357_nv_raw.vcf
	cat $^ | dxy F_SI wgs17 > $@

dxy17_F_SI_3750.txt:	~/shared/ruff/illumina_high/snps_wgs17/17_samples_contig3750_nv_raw.vcf
	cat $^ | dxy F_SI wgs17 > $@

dxy17_F_SI_3913.txt:	~/shared/ruff/illumina_high/snps_wgs17/17_samples_contig3913_nv_raw.vcf
	cat $^ | dxy F_SI wgs17 > $@

dxy17_F_SI_4111.txt:	~/shared/ruff/illumina_high/snps_wgs17/17_samples_contig4111_nv_raw.vcf
	cat $^ | dxy F_SI wgs17 > $@

dxy17_F_SI_4944.txt:	~/shared/ruff/illumina_high/snps_wgs17/17_samples_contig4944_nv_raw.vcf
	cat $^ | dxy F_SI wgs17 > $@

dxy17_F_SI_9013.txt:	~/shared/ruff/illumina_high/snps_wgs17/17_samples_contig9013_nv_raw.vcf
	cat $^ | dxy F_SI wgs17 > $@

##

dxy17_F_S_1270.txt:	~/shared/ruff/illumina_high/snps_wgs17/17_samples_contig1270_nv_raw.vcf
	cat $^ | dxy F_S wgs17 > $@

dxy17_F_S_2063.txt:	~/shared/ruff/illumina_high/snps_wgs17/17_samples_contig2063_nv_raw.vcf
	cat $^ | dxy F_S wgs17 > $@

dxy17_F_S_3047.txt:	~/shared/ruff/illumina_high/snps_wgs17/17_samples_contig3047_nv_raw.vcf
	cat $^ | dxy F_S wgs17 > $@

dxy17_F_S_3208.txt:	~/shared/ruff/illumina_high/snps_wgs17/17_samples_contig3208_nv_raw.vcf
	cat $^ | dxy F_S wgs17 > $@

dxy17_F_S_3357.txt:	~/shared/ruff/illumina_high/snps_wgs17/17_samples_contig3357_nv_raw.vcf
	cat $^ | dxy F_S wgs17 > $@

dxy17_F_S_3750.txt:	~/shared/ruff/illumina_high/snps_wgs17/17_samples_contig3750_nv_raw.vcf
	cat $^ | dxy F_S wgs17 > $@

dxy17_F_S_3913.txt:	~/shared/ruff/illumina_high/snps_wgs17/17_samples_contig3913_nv_raw.vcf
	cat $^ | dxy F_S wgs17 > $@

dxy17_F_S_4111.txt:	~/shared/ruff/illumina_high/snps_wgs17/17_samples_contig4111_nv_raw.vcf
	cat $^ | dxy F_S wgs17 > $@

dxy17_F_S_4944.txt:	~/shared/ruff/illumina_high/snps_wgs17/17_samples_contig4944_nv_raw.vcf
	cat $^ | dxy F_S wgs17 > $@

dxy17_F_S_9013.txt:	~/shared/ruff/illumina_high/snps_wgs17/17_samples_contig9013_nv_raw.vcf
	cat $^ | dxy F_S wgs17 > $@

##

dxy17_F_I_1270.txt:	~/shared/ruff/illumina_high/snps_wgs17/17_samples_contig1270_nv_raw.vcf
	cat $^ | dxy F_I wgs17 > $@

dxy17_F_I_2063.txt:	~/shared/ruff/illumina_high/snps_wgs17/17_samples_contig2063_nv_raw.vcf
	cat $^ | dxy F_I wgs17 > $@

dxy17_F_I_3047.txt:	~/shared/ruff/illumina_high/snps_wgs17/17_samples_contig3047_nv_raw.vcf
	cat $^ | dxy F_I wgs17 > $@

dxy17_F_I_3208.txt:	~/shared/ruff/illumina_high/snps_wgs17/17_samples_contig3208_nv_raw.vcf
	cat $^ | dxy F_I wgs17 > $@

dxy17_F_I_3357.txt:	~/shared/ruff/illumina_high/snps_wgs17/17_samples_contig3357_nv_raw.vcf
	cat $^ | dxy F_I wgs17 > $@

dxy17_F_I_3750.txt:	~/shared/ruff/illumina_high/snps_wgs17/17_samples_contig3750_nv_raw.vcf
	cat $^ | dxy F_I wgs17 > $@

dxy17_F_I_3913.txt:	~/shared/ruff/illumina_high/snps_wgs17/17_samples_contig3913_nv_raw.vcf
	cat $^ | dxy F_I wgs17 > $@

dxy17_F_I_4111.txt:	~/shared/ruff/illumina_high/snps_wgs17/17_samples_contig4111_nv_raw.vcf
	cat $^ | dxy F_I wgs17 > $@

dxy17_F_I_4944.txt:	~/shared/ruff/illumina_high/snps_wgs17/17_samples_contig4944_nv_raw.vcf
	cat $^ | dxy F_I wgs17 > $@

dxy17_F_I_9013.txt:	~/shared/ruff/illumina_high/snps_wgs17/17_samples_contig9013_nv_raw.vcf
	cat $^ | dxy F_I wgs17 > $@

##

dxy17_S_I_1270.txt:	~/shared/ruff/illumina_high/snps_wgs17/17_samples_contig1270_nv_raw.vcf
	cat $^ | dxy S_I wgs17 > $@

dxy17_S_I_2063.txt:	~/shared/ruff/illumina_high/snps_wgs17/17_samples_contig2063_nv_raw.vcf
	cat $^ | dxy S_I wgs17 > $@

dxy17_S_I_3047.txt:	~/shared/ruff/illumina_high/snps_wgs17/17_samples_contig3047_nv_raw.vcf
	cat $^ | dxy S_I wgs17 > $@

dxy17_S_I_3208.txt:	~/shared/ruff/illumina_high/snps_wgs17/17_samples_contig3208_nv_raw.vcf
	cat $^ | dxy S_I wgs17 > $@

dxy17_S_I_3357.txt:	~/shared/ruff/illumina_high/snps_wgs17/17_samples_contig3357_nv_raw.vcf
	cat $^ | dxy S_I wgs17 > $@

dxy17_S_I_3750.txt:	~/shared/ruff/illumina_high/snps_wgs17/17_samples_contig3750_nv_raw.vcf
	cat $^ | dxy S_I wgs17 > $@

dxy17_S_I_3913.txt:	~/shared/ruff/illumina_high/snps_wgs17/17_samples_contig3913_nv_raw.vcf
	cat $^ | dxy S_I wgs17 > $@

dxy17_S_I_4111.txt:	~/shared/ruff/illumina_high/snps_wgs17/17_samples_contig4111_nv_raw.vcf
	cat $^ | dxy S_I wgs17 > $@

dxy17_S_I_4944.txt:	~/shared/ruff/illumina_high/snps_wgs17/17_samples_contig4944_nv_raw.vcf
	cat $^ | dxy S_I wgs17 > $@

dxy17_S_I_9013.txt:	~/shared/ruff/illumina_high/snps_wgs17/17_samples_contig9013_nv_raw.vcf
	cat $^ | dxy S_I wgs17 > $@

##

.PHONY:	nalleles
nalleles:	$(dxycoi) $(dxygz)

dxyF_I_%.txt:	dxyF_I.txt.gz
	zcat $^ | grep "Contig$*" > $@

dxyF_S_%.txt:	dxyF_S.txt.gz
	zcat $^ | grep "Contig$*" > $@

dxyS_I_%.txt:	dxyS_I.txt.gz
	zcat $^ | grep "Contig$*" > $@

dxyF_SI_%.txt:	dxyF_SI.txt.gz
	zcat $^ | grep "Contig$*" > $@


##

dxyF_I.txt.gz:	inv.vcf
	cat $^ | dxy F_I | gzip > $@

dxyF_S.txt.gz:	inv.vcf
	cat $^ | dxy F_S | gzip > $@

dxyS_I.txt.gz:	inv.vcf
	cat $^ | dxy S_I | gzip > $@

dxyF_SI.txt.gz:	inv.vcf
	cat $^ | dxy F_SI | gzip > $@

##

