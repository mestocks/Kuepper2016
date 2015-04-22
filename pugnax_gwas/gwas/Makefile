###### ######

USR = $(shell echo $$USER)
PTH = /data/$(USR)/ruff/pugnax_gwas/
GWS = $(PTH)gwas/
RSQ = $(PTH)RADseq/
PRO = $(RSQ)processed_rads/cons001/

ALN = $(RSQ)alignments/
GEN = $(GWS)GenABEL/
PNK = $(GWS)plink/

###### ######

#ref = r1us_RUFFv0.2.fa RUFFv0.2.fa r1us_RUFFv0.2alt.fa RUFFv0.2alt.fa KILDEER.fa r1us_KILDEER.fa
ref = r1bm_RUFFv0.2.fa r1bm_RUFFv0.2alt.fa
refnam = $(subst .fa,,$(ref))

###### ######

GEN-IN = $(addprefix $(GEN),$(refnam))

#rad-suffix = _rmd
#RAD-VER = $(rad-suffix)_dp7

RAD-VER = _dp7

BAM-IN = $(addsuffix $(rad-suffix),$(GEN-IN))
phe-in = $(subst $(GEN),$(GEN)phe_,$(BAM-IN))
PHE-IN = $(addsuffix .txt,$(phe-in))

GEN-VER = $(addsuffix $(RAD-VER),$(GEN-IN))

TPED = $(addsuffix .tped,$(GEN-VER))
GRAW = $(addsuffix .raw,$(GEN-VER))

MAN = $(addsuffix _man.png,$(GEN-VER))
QQ = $(addsuffix _qq.png,$(GEN-VER))
CMD = $(addsuffix _cmd.png,$(GEN-VER))

cmdreg = $(GEN)r1us_RUFFv0.2alt $(GEN)RUFFv0.2alt

CMDREG = $(addsuffix $(RAD-VER)_cmdregion.png,$(cmdreg))

pval = $(addsuffix .txt,$(GEN-VER))

FAE-QT = $(subst $(GEN),$(GEN)faeQ_,$(pval))
FAE-QT1k = $(subst $(GEN),$(GEN)faeQ1k_,$(pval))
FAE-QT-IBS = $(subst $(GEN),$(GEN)faeQI_,$(pval))
FAE-QT1k-IBS = $(subst $(GEN),$(GEN)faeQI1k_,$(pval))
FAE-EG = $(subst $(GEN),$(GEN)faeE_,$(pval))
FAE-EG1k = $(subst $(GEN),$(GEN)faeE1k_,$(pval))

FAE-PVAL = $(FAE-QT) $(FAE-QT1k) $(FAE-QT-IBS) $(FAE-QT1k-IBS) $(FAE-EG) $(FAE-EG1k)

qFAE-QT = $(subst $(GEN),$(GEN)fq_,$(pval))
qFAE-QT1k = $(subst $(GEN),$(GEN)fq1k_,$(pval))
qFAE-QTm = $(subst $(GEN),$(GEN)fqm_,$(pval))
qFAE-QT1km = $(subst $(GEN),$(GEN)fq1km_,$(pval))
qFAE-QTm-IBS = $(subst $(GEN),$(GEN)fqim_,$(pval))
qFAE-QT1km-IBS = $(subst $(GEN),$(GEN)fqi1km_,$(pval))
qFAE-QT-IBS = $(subst $(GEN),$(GEN)fqi_,$(pval))
qFAE-QT1k-IBS = $(subst $(GEN),$(GEN)fqi1k_,$(pval))
qFAE-EG = $(subst $(GEN),$(GEN)fe_,$(pval))
qFAE-EG1k = $(subst $(GEN),$(GEN)fe1k_,$(pval))
qFAE-EGm = $(subst $(GEN),$(GEN)fem_,$(pval))
qFAE-EG1km = $(subst $(GEN),$(GEN)fe1km_,$(pval))

FAE-PVAL-QC = $(qFAE-QT) $(qFAE-QT1k) $(qFAE-QTm) $(qFAE-QT1km) $(qFAE-QTm-IBS) $(qFAE-QT1km-IBS) $(qFAE-QT-IBS) $(qFAE-QT1k-IBS) $(qFAE-EG) $(qFAE-EG1k) $(qFAE-EGm) $(qFAE-EG1km)

qSAT-QT = $(subst $(GEN),$(GEN)sq_,$(pval))
qSAT-QT1k = $(subst $(GEN),$(GEN)sq1k_,$(pval))
qSAT-QTm = $(subst $(GEN),$(GEN)sqm_,$(pval))
qSAT-QT1km = $(subst $(GEN),$(GEN)sq1km_,$(pval))
qSAT-QTm-IBS = $(subst $(GEN),$(GEN)sqim_,$(pval))
qSAT-QT1km-IBS = $(subst $(GEN),$(GEN)sqi1km_,$(pval))
qSAT-QT-IBS = $(subst $(GEN),$(GEN)sqi_,$(pval))
qSAT-QT1k-IBS = $(subst $(GEN),$(GEN)sqi1k_,$(pval))
qSAT-EG = $(subst $(GEN),$(GEN)se_,$(pval))
qSAT-EG1k = $(subst $(GEN),$(GEN)se1k_,$(pval))
qSAT-EGm = $(subst $(GEN),$(GEN)sem_,$(pval))
qSAT-EG1km = $(subst $(GEN),$(GEN)se1km_,$(pval))

SAT-PVAL-QC = $(qSAT-QT) $(qSAT-QT1k) $(qSAT-QTm) $(qSAT-QT1km) $(qSAT-QTm-IBS) $(qSAT-QT1km-IBS) $(qSAT-QT-IBS) $(qSAT-QT1k-IBS) $(qSAT-EG) $(qSAT-EG1k) $(qSAT-EGm) $(qSAT-EG1km)

FAE-CP = $(subst $(GEN),$(GEN)fae_pvalues_,$(pval))
fae-man-qc = $(subst $(GEN),$(GEN)fae_man_,$(pval))
FAE-MAN-QC = $(subst .txt,.png,$(fae-man-qc))
fae-mantalk-qc = $(subst $(GEN),$(GEN)fae_mantalk_,$(pval))
FAE-MANTALK-QC = $(subst .txt,.png,$(fae-mantalk-qc))
fae-man2-qc = $(subst $(GEN),$(GEN)fae_man2_,$(pval))
FAE-MAN2-QC = $(subst .txt,.png,$(fae-man2-qc))
fae-man2talk-qc = $(subst $(GEN),$(GEN)fae_man2talk_,$(pval))
FAE-MAN2TALK-QC = $(subst .txt,.png,$(fae-man2talk-qc))
fae-man-qc-lane = $(subst $(GEN),$(GEN)faem_man_,$(pval))
FAE-MAN-QC-LANE = $(subst .txt,.png,$(fae-man-qc-lane))
fae-man2-qc-lane = $(subst $(GEN),$(GEN)faem_man2_,$(pval))
FAE-MAN2-QC-LANE = $(subst .txt,.png,$(fae-man2-qc-lane))

FAE-QQ = $(subst _man_,_qq_,$(FAE-MAN-QC))
FAE-QQ-trans = $(subst _man_,_qqtrans_,$(FAE-MAN-QC))

SAT-CP = $(subst $(GEN),$(GEN)sat_pvalues_,$(pval))
sat-man-qc = $(subst $(GEN),$(GEN)sat_man_,$(pval))
SAT-MAN-QC = $(subst .txt,.png,$(sat-man-qc))
sat-mantalk-qc = $(subst $(GEN),$(GEN)sat_mantalk_,$(pval))
SAT-MANTALK-QC = $(subst .txt,.png,$(sat-mantalk-qc))
sat-man2-qc = $(subst $(GEN),$(GEN)sat_man2_,$(pval))
SAT-MAN2-QC = $(subst .txt,.png,$(sat-man2-qc))
sat-man2talk-qc = $(subst $(GEN),$(GEN)sat_man2talk_,$(pval))
SAT-MAN2TALK-QC = $(subst .txt,.png,$(sat-man2talk-qc))
sat-man-qc-lane = $(subst $(GEN),$(GEN)satm_man_,$(pval))
SAT-MAN-QC-LANE = $(subst .txt,.png,$(sat-man-qc-lane))
sat-man2-qc-lane = $(subst $(GEN),$(GEN)satm_man2_,$(pval))
SAT-MAN2-QC-LANE = $(subst .txt,.png,$(sat-man2-qc-lane))

SAT-QQ = $(subst _man_,_qq_,$(SAT-MAN-QC))

###### ######


#.PHONY:	gen-gwas
#gen-gwas:	$(MAN) $(QQ) $(CMD)


#$(GEN)%_rmd_dp7_cmd.png:	$(GEN)%_rmd_dp7.raw $(GEN)phe_%_fo.txt
#	Rscript mdscale.r $^ $@

#$(GEN)%_rmd_dp7_qq.png:	$(GEN)%_rmd_dp7.raw $(GEN)phe_%_fo.txt
#	Rscript qqplot.r $^ $@

#$(GEN)%_rmd_dp7_man.png:	$(GEN)%_rmd_dp7.raw $(GEN)phe_%_fo.txt
#	Rscript manplot.r $^ $@

.PHONY:	mds
mds:	$(CMD) $(CMDREG)

$(GEN)%_rmd_dp7_cmd.png:	$(GEN)%_rmd_dp7.raw $(GEN)phe_%_rmd.txt
	Rscript mdscale.r $^ $@

$(GEN)%_rmd_dp7_cmdregion.png:	$(GEN)%_rmd_dp7.raw $(GEN)phe_%_rmd.txt
	Rscript mdscale_region.r $^ $@


.PHONY:	fae-qq
fae-qq:	$(FAE-QQ) $(FAE-QQ-trans)

fae_qq_%_dp7.png:	fae_pvalues_%_dp7.txt
	Rscript qqplot2.r $^ $@

fae_qqtrans_%_dp7.png:	fae_pvalues_%_dp7.txt
	Rscript qqplot2_dark.r $^ $@


.PHONY:	fae-man
fae-man:	$(FAE-MANTALK-QC) $(FAE-MAN-QC) $(FAE-MAN2TALK-QC) $(FAE-MAN2-QC) $(FAE-MAN-QC-LANE) $(FAE-MAN2-QC-LANE)

fae_man_%_dp7.png:	fae_pvalues_%_dp7.txt
	Rscript manhat.r $^ $@

fae_mantalk_%_dp7.png:	fae_pvalues_%_dp7.txt
	Rscript manhattalk.r $^ $@

fae_man2_%_dp7.png:	fae_pvalues_%_dp7.txt
	Rscript manhat2.r $^ $@

fae_man2talk_%_dp7.png:	fae_pvalues_%_dp7.txt
	Rscript manhat2_trans.r $^ $@

faem_man_%_dp7.png:	fae_pvalues_%_dp7.txt
	Rscript manhat_lane.r $^ $@

faem_man2_%_dp7.png:	fae_pvalues_%_dp7.txt
	Rscript manhat2_lane.r $^ $@

.PHONY:	sat-qq
sat-qq:	$(SAT-QQ)

sat_qq_%_dp7.png:	sat_pvalues_%_dp7.txt
	Rscript qqplotsat2.r $^ $@


.PHONY:	sat-man
sat-man:	$(SAT-MANTALK-QC) $(SAT-MAN-QC) $(SAT-MAN2TALK-QC) $(SAT-MAN2-QC) $(SAT-MAN-QC-LANE) $(SAT-MAN2-QC-LANE)

sat_man_%_dp7.png:	sat_pvalues_%_dp7.txt
	Rscript manhatsat.r $^ $@

sat_mantalk_%_dp7.png:	sat_pvalues_%_dp7.txt
	Rscript manhatsattalk.r $^ $@

sat_man2_%_dp7.png:	sat_pvalues_%_dp7.txt
	Rscript manhatsat2.r $^ $@

sat_man2talk_%_dp7.png:	sat_pvalues_%_dp7.txt
	Rscript manhatsat2_trans.r $^ $@

satm_man_%_dp7.png:	sat_pvalues_%_dp7.txt
	Rscript manhatsat_lane.r $^ $@

satm_man2_%_dp7.png:	sat_pvalues_%_dp7.txt
	Rscript manhatsat2_lane.r $^ $@

# sat, ind & all
# genomic control (done already?)
# pca approach
# ibs approach



.PHONY:	sat-combine-snps
sat-combine-snps:	$(SAT-CP)

$(GEN)sat_pvalues_%_dp7.txt:	$(GEN)sat_snpids_%_dp7.txt $(GEN)justpvals_sq_%_dp7.txt $(GEN)justpvals_sq1k_%_dp7.txt $(GEN)justpvals_sqm_%_dp7.txt $(GEN)justpvals_sq1km_%_dp7.txt $(GEN)justpvals_sqim_%_dp7.txt $(GEN)justpvals_sqi1km_%_dp7.txt $(GEN)justpvals_sqi_%_dp7.txt $(GEN)justpvals_sqi1k_%_dp7.txt $(GEN)justpvals_se_%_dp7.txt $(GEN)justpvals_se1k_%_dp7.txt $(GEN)justpvals_sem_%_dp7.txt $(GEN)justpvals_se1km_%_dp7.txt
	paste -d" " $^ > $@


$(GEN)justpvals_s%_dp7.txt:	$(GEN)s%_dp7.txt
	awk -v f=$^ -- ' BEGIN { n=1 }; { gsub("$(GEN)","",f); split(f,a,"_"); id=a[1]; for (i=3; i<=NF; i++) { if (n == 1) printf id"."$$i; else printf $$i; if (i < NF) printf " " } printf "\n"; n++ } ' $^ > $@


$(GEN)sat_snpids_%_dp7.txt:	$(GEN)sq_%_dp7.txt $(GEN)sq1k_%_dp7.txt $(GEN)sqm_%_dp7.txt $(GEN)sq1km_%_dp7.txt $(GEN)sqim_%_dp7.txt $(GEN)sqi1km_%_dp7.txt $(GEN)sqi_%_dp7.txt $(GEN)sqi1k_%_dp7.txt $(GEN)se_%_dp7.txt $(GEN)se1k_%_dp7.txt $(GEN)sem_%_dp7.txt $(GEN)se1km_%_dp7.txt
	grep "Chromosome" -v $< | awk ' BEGIN { OFS = "\t"; print "Chromosome","Position","GenomePosition"; a=0; l=0; c="" }; { if ($$1 != c) a+=l; print $$1,$$2,$$2+a; l=$$2; c=$$1 } ' > $@

.PHONY:	fae-combine-snps
fae-combine-snps:	$(FAE-CP)

$(GEN)fae_pvalues_%_dp7.txt:	$(GEN)fae_snpids_%_dp7.txt $(GEN)justpvals_fq_%_dp7.txt $(GEN)justpvals_fq1k_%_dp7.txt $(GEN)justpvals_fqm_%_dp7.txt $(GEN)justpvals_fq1km_%_dp7.txt $(GEN)justpvals_fqim_%_dp7.txt $(GEN)justpvals_fqi1km_%_dp7.txt $(GEN)justpvals_fqi_%_dp7.txt $(GEN)justpvals_fqi1k_%_dp7.txt $(GEN)justpvals_fe_%_dp7.txt $(GEN)justpvals_fe1k_%_dp7.txt $(GEN)justpvals_fem_%_dp7.txt $(GEN)justpvals_fe1km_%_dp7.txt
	paste -d" " $^ > $@


$(GEN)justpvals_f%_dp7.txt:	$(GEN)f%_dp7.txt
	awk -v f=$^ -- ' BEGIN { n=1 }; { gsub("$(GEN)","",f); split(f,a,"_"); id=a[1]; for (i=3; i<=NF; i++) { if (n == 1) printf id"."$$i; else printf $$i; if (i < NF) printf " " } printf "\n"; n++ } ' $^ > $@


$(GEN)fae_snpids_%_dp7.txt:	$(GEN)fq_%_dp7.txt $(GEN)fq1k_%_dp7.txt $(GEN)fqm_%_dp7.txt $(GEN)fq1km_%_dp7.txt $(GEN)fqim_%_dp7.txt $(GEN)fqi1km_%_dp7.txt $(GEN)fqi_%_dp7.txt $(GEN)fqi1k_%_dp7.txt $(GEN)fe_%_dp7.txt $(GEN)fe1k_%_dp7.txt $(GEN)fem_%_dp7.txt $(GEN)fe1km_%_dp7.txt
	grep "Chromosome" -v $< | awk ' BEGIN { OFS = "\t"; print "Chromosome","Position","GenomePosition"; a=0; l=0; c="" }; { if ($$1 != c) a+=l; print $$1,$$2,$$2+a; l=$$2; c=$$1 } ' > $@


# gen.in phe.in pvalues.out do.qc method trait.col nprems do.ibs

.PHONY:	fae-qc
fae-qc:	$(FAE-PVAL-QC)

$(GEN)fq_%_dp7.txt:	$(GEN)%_dp7.raw $(GEN)phe_%.txt
	Rscript call_gwas.r $^ $@ TRUE qtscore fo 1 FALSE

$(GEN)fq1k_%_dp7.txt:	$(GEN)%_dp7.raw $(GEN)phe_%.txt
	Rscript call_gwas.r $^ $@ TRUE qtscore fo 1000 FALSE

$(GEN)fqm_%_dp7.txt:	$(GEN)%_dp7.raw $(GEN)phe_%.txt
	Rscript call_gwas.r $^ $@ TRUE qtscore2 fo 1 FALSE

$(GEN)fq1km_%_dp7.txt:	$(GEN)%_dp7.raw $(GEN)phe_%.txt
	Rscript call_gwas.r $^ $@ TRUE qtscore2 fo 1000 FALSE

$(GEN)fqim_%_dp7.txt:	$(GEN)%_dp7.raw $(GEN)phe_%.txt
	Rscript call_gwas.r $^ $@ TRUE qtscore2 fo 1 TRUE

$(GEN)fqi1km_%_dp7.txt:	$(GEN)%_dp7.raw $(GEN)phe_%.txt
	Rscript call_gwas.r $^ $@ TRUE qtscore2 fo 1000 TRUE

$(GEN)fqi_%_dp7.txt:	$(GEN)%_dp7.raw $(GEN)phe_%.txt
	Rscript call_gwas.r $^ $@ TRUE qtscore fo 1 TRUE

$(GEN)fqi1k_%_dp7.txt:	$(GEN)%_dp7.raw $(GEN)phe_%.txt
	Rscript call_gwas.r $^ $@ TRUE qtscore fo 1000 TRUE

$(GEN)fe_%_dp7.txt:	$(GEN)%_dp7.raw $(GEN)phe_%.txt
	Rscript call_gwas.r $^ $@ TRUE egscore fo 1 FALSE

$(GEN)fe1k_%_dp7.txt:	$(GEN)%_dp7.raw $(GEN)phe_%.txt
	Rscript call_gwas.r $^ $@ TRUE egscore fo 1000 FALSE

$(GEN)fem_%_dp7.txt:	$(GEN)%_dp7.raw $(GEN)phe_%.txt
	Rscript call_gwas.r $^ $@ TRUE egscore2 fo 1 FALSE

$(GEN)fe1km_%_dp7.txt:	$(GEN)%_dp7.raw $(GEN)phe_%.txt
	Rscript call_gwas.r $^ $@ TRUE egscore2 fo 1000 FALSE

.PHONY:	sat-qc
sat-qc:	$(SAT-PVAL-QC)

$(GEN)sq_%_dp7.txt:	$(GEN)%_dp7.raw $(GEN)phe_%.txt
	Rscript call_gwas.r $^ $@ TRUE qtscore si 1 FALSE

$(GEN)sq1k_%_dp7.txt:	$(GEN)%_dp7.raw $(GEN)phe_%.txt
	Rscript call_gwas.r $^ $@ TRUE qtscore si 1000 FALSE

$(GEN)sqm_%_dp7.txt:	$(GEN)%_dp7.raw $(GEN)phe_%.txt
	Rscript call_gwas.r $^ $@ TRUE qtscore2 si 1 FALSE

$(GEN)sq1km_%_dp7.txt:	$(GEN)%_dp7.raw $(GEN)phe_%.txt
	Rscript call_gwas.r $^ $@ TRUE qtscore2 si 1000 FALSE

$(GEN)sqim_%_dp7.txt:	$(GEN)%_dp7.raw $(GEN)phe_%.txt
	Rscript call_gwas.r $^ $@ TRUE qtscore2 si 1 TRUE

$(GEN)sqi1km_%_dp7.txt:	$(GEN)%_dp7.raw $(GEN)phe_%.txt
	Rscript call_gwas.r $^ $@ TRUE qtscore2 si 1000 TRUE

$(GEN)sqi_%_dp7.txt:	$(GEN)%_dp7.raw $(GEN)phe_%.txt
	Rscript call_gwas.r $^ $@ TRUE qtscore si 1 TRUE

$(GEN)sqi1k_%_dp7.txt:	$(GEN)%_dp7.raw $(GEN)phe_%.txt
	Rscript call_gwas.r $^ $@ TRUE qtscore si 1000 TRUE

$(GEN)se_%_dp7.txt:	$(GEN)%_dp7.raw $(GEN)phe_%.txt
	Rscript call_gwas.r $^ $@ TRUE egscore si 1 FALSE

$(GEN)se1k_%_dp7.txt:	$(GEN)%_dp7.raw $(GEN)phe_%.txt
	Rscript call_gwas.r $^ $@ TRUE egscore si 1000 FALSE

$(GEN)sem_%_dp7.txt:	$(GEN)%_dp7.raw $(GEN)phe_%.txt
	Rscript call_gwas.r $^ $@ TRUE egscore2 si 1 FALSE

$(GEN)se1km_%_dp7.txt:	$(GEN)%_dp7.raw $(GEN)phe_%.txt
	Rscript call_gwas.r $^ $@ TRUE egscore2 si 1000 FALSE


.PHONY:	fae-gwas
fae-gwas:	$(FAE-PVAL)

$(GEN)faeQ_%_dp7.txt:	$(GEN)%_dp7.raw $(GEN)phe_%.txt
	Rscript fae_qtscore.r $^ $@

$(GEN)faeQ1k_%_dp7.txt:	$(GEN)%_dp7.raw $(GEN)phe_%.txt
	Rscript fae_qtscore1k.r $^ $@

$(GEN)faeQI_%_dp7.txt:	$(GEN)%_dp7.raw $(GEN)phe_%.txt
	Rscript fae_qtibs.r $^ $@

$(GEN)faeQI1k_%_dp7.txt:	$(GEN)%_dp7.raw $(GEN)phe_%.txt
	Rscript fae_qtibs1k.r $^ $@

$(GEN)faeE_%_dp7.txt:	$(GEN)%_dp7.raw $(GEN)phe_%.txt
	Rscript fae_eg.r $^ $@

$(GEN)faeE1k_%_dp7.txt:	$(GEN)%_dp7.raw $(GEN)phe_%.txt
	Rscript fae_eg1k.r $^ $@

###### ######

.PHONY:	new-man
new-man:	$(GEN)fae_qt_r1bm_RUFFv0.2_dp7.png $(GEN)fae_qt_r1bm_RUFFv0.2alt_dp7.png $(GEN)sat_qt_r1bm_RUFFv0.2_dp7.png $(GEN)sat_qt_r1bm_RUFFv0.2alt_dp7.png

$(GEN)fae_qt_%.png:	$(GEN)fae_qt1_%.txt $(GEN)fae_qt1k_%.txt
	Rscript manhattan.r $^ P1df P1df $@

$(GEN)sat_qt_%.png:	$(GEN)sat_qt1_%.txt $(GEN)sat_qt1k_%.txt
	Rscript manhattan.r $^ P1df P1df $@

###### ######

.PHONY:	dom-rec-plot
dom-rec-plot:	$(GEN)dom_fo_r1bm_RUFFv0.2_dp7.png $(GEN)rec_fo_r1bm_RUFFv0.2_dp7.png

$(GEN)dom_fo_%.png:	$(GEN)dom_fo_%.txt
	Rscript mandom.r $^ $@

$(GEN)rec_fo_%.png:	$(GEN)rec_fo_%.txt
	Rscript mandom.r $^ $@

###### ######

.PHONY:	dom-rec
dom-rec:	$(GEN)dom_fo_r1bm_RUFFv0.2_dp7.txt $(GEN)rec_fo_r1bm_RUFFv0.2_dp7.txt
#$(GEN)dom_si_r1bm_RUFFv0.2_dp7.txt $(GEN)rec_si_r1bm_RUFFv0.2_dp7.txt

$(GEN)dom_%.txt:	$(GEN)pos_dom_%.txt
	awk ' BEGIN { a=0; l=0; c="" }; { if ($$0 ~ "Chromosome") print $$0,"GenomePosition"; else { if ($$1 != c) a+=l; print $$0,$$2+a; l=$$2; c=$$1 } } ' $^ > $@

$(GEN)rec_%.txt:	$(GEN)pos_rec_%.txt
	awk ' BEGIN { a=0; l=0; c="" }; { if ($$0 ~ "Chromosome") print $$0,"GenomePosition"; else { if ($$1 != c) a+=l; print $$0,$$2+a; l=$$2; c=$$1 } } ' $^ > $@

$(GEN)pos_dom_fo_%_dp7.txt:	$(GEN)fo_%_dp7.raw $(GEN)phe_fo_%.txt
	Rscript mlreg.r $^ $@ fo dominant

$(GEN)pos_rec_fo_%_dp7.txt:	$(GEN)fo_%_dp7.raw $(GEN)phe_fo_%.txt
	Rscript mlreg.r $^ $@ fo recessive

#$(GEN)pos_dom_si_%_dp7.txt:	$(GEN)si_%_dp7.raw $(GEN)phe_si_%.txt
#	Rscript mlreg.r $^ $@ si dominant

#$(GEN)pos_rec_si_%_dp7.txt:	$(GEN)si_%_dp7.raw $(GEN)phe_si_%.txt
#	Rscript mlreg.r $^ $@ si recessive

###### ######

.PHONY:	qtscore
qtscore:	$(GEN)fae_qt1k_r1bm_RUFFv0.2_dp7.txt $(GEN)fae_qt1k_r1bm_RUFFv0.2alt_dp7.txt $(GEN)sat_qt1k_r1bm_RUFFv0.2_dp7.txt $(GEN)sat_qt1k_r1bm_RUFFv0.2alt_dp7.txt $(GEN)fae_qt1_r1bm_RUFFv0.2_dp7.txt $(GEN)fae_qt1_r1bm_RUFFv0.2alt_dp7.txt $(GEN)sat_qt1_r1bm_RUFFv0.2_dp7.txt $(GEN)sat_qt1_r1bm_RUFFv0.2alt_dp7.txt

$(GEN)%_dp7.txt:	$(GEN)pos%_dp7.txt
	awk ' BEGIN { OFS = "\t"; a=0; l=0; c="" }; { if ($$0 ~ "Chromosome") print $$0,"GenomePosition"; else { if ($$1 != c) a+=l; print $$0,$$2+a; l=$$2; c=$$1 } } ' $^ > $@

$(GEN)posfae_qt1k_%_dp7.txt:	$(GEN)gen_%_dp7_clean.txt $(GEN)phe_%_clean.txt
	Rscript qtscore.r $^ $@ fo 1000 FALSE

$(GEN)possat_qt1k_%_dp7.txt:	$(GEN)gen_%_dp7_clean.txt $(GEN)phe_%_clean.txt
	Rscript qtscore.r $^ $@ si 1000 FALSE

$(GEN)posfae_qt1_%_dp7.txt:	$(GEN)gen_%_dp7_clean.txt $(GEN)phe_%_clean.txt
	Rscript qtscore.r $^ $@ fo 1 FALSE

$(GEN)possat_qt1_%_dp7.txt:	$(GEN)gen_%_dp7_clean.txt $(GEN)phe_%_clean.txt
	Rscript qtscore.r $^ $@ si 1 FALSE

###### ######

.PHONY:	doQC
doQC:	$(GEN)phe_r1bm_RUFFv0.2alt_clean.txt $(GEN)phe_r1bm_RUFFv0.2_clean.txt $(GEN)gen_r1bm_RUFFv0.2alt_dp7_clean.txt $(GEN)gen_r1bm_RUFFv0.2_dp7_clean.txt

$(GEN)gen_%_dp7_clean.txt:	$(GEN)phe_%_clean.txt
	echo $@" created"

$(GEN)phe_%_clean.txt:	$(GEN)phe_%.txt $(GEN)%_dp7.raw
	Rscript clean_data.r $^ $@ $(GEN)gen_$*_dp7_clean.txt

###### ######

.PHONY:	create-phe
create-phe:	$(PHE-IN) $(GEN)phe_fo_r1bm_RUFFv0.2.txt $(GEN)phe_si_r1bm_RUFFv0.2.txt $(GEN)phe_fo_bm_RUFFv0.2.txt


$(GEN)phe_%.txt:	$(GEN)phe_bamids_%.txt $(GEN)phe_base.txt $(GEN)tag_info.txt
	paste $^ > $@


$(GEN)phe_bamids_%.txt:	$(ALN)%.vcf.gz
	zcat $^ | grep "#CHROM" | awk ' { for (i=10; i<=NF; i++) print $$i } ' | sort | awk ' BEGIN { print "id" }; { print $$0 } ' > $@


$(GEN)phe_base.txt:	$(GEN)phenotypes_sorted.txt
	cat $^ | sort -k 2 | awk ' BEGIN { OFS = "\t"; print "sex","tag","name","morph","fo","fs","fi","si","fsi","colour" }; { if ($$3 == "f") { fo = 1; fs = 1; fi = 1; m = 2; si = "NA"; col = "tomato3" } if ($$3 == "s") { fo = 0; fs = 0; fi = "NA"; m = 1; si = 1; col = "steelblue" } if ($$3 == "i") { fo = 0; fs = "NA"; fi = 0; m = 0; si = 0; col = "goldenrod" } print "1",$$2,$$1,$$3,fo,fs,fi,si,m,col } ' > $@


$(GEN)tag_info.txt:	$(GEN)tag_info1.txt $(GEN)tag_info2.txt
	cat $^ | sort | awk ' BEGIN { print "lib" }; { print $$2 } ' > $@


$(GEN)tag_info1.txt:	$(PRO)barcodes/2014025_TBLib1.pools
	awk -F"\t" ' BEGIN { OFS="\t" }; { print $$2,"0" } ' $^ > $@


$(GEN)tag_info2.txt:	$(PRO)barcodes/2014025_TBLib2.pools
	awk -F"\t" ' BEGIN { OFS="\t" }; { print $$2,"1" } ' $^ > $@

# manhatten
# qq
# estlambda
# snps
# snps with correction
# structure

###### ######

assocREF = fo_r1bm_RUFFv0.2_dp7 fo_bm_RUFFv0.2_dp7

# .assoc, .model
ASSOC = $(addsuffix .assoc,$(assocREF))
MODEL = $(addsuffix .model,$(assocREF))
LDOM = $(addsuffix _dom,$(assocREF))

# .assoc.mperm
ASSOC-MPERM = $(addsuffix .mperm,$(ASSOC))

# .assoc.logistic
ASSOC-LOGISTIC = $(addsuffix .logistic,$(ASSOC))
#ASSOC-LOGISTIC-DOM = $(addsuffix .assoc.logistic,$(LDOM))

ASSOC-LOGISTIC-ADD = $(addsuffix .logistic.add,$(ASSOC))
ASSOC-LOGISTIC-DOMDEV = $(addsuffix .logistic.domdev,$(ASSOC))
ASSOC-LOGISTIC-GENO_2DF = $(addsuffix .logistic.geno_2df,$(ASSOC))
ASSOC-LOGISTIC-DOM = $(addsuffix .logistic.dom,$(ASSOC))

ASSOC-LOGISTIC-DOM-COVAR = $(addsuffix _covar.assoc.logistic,$(LDOM))
ASSOC-LOGISTIC-COVAR = $(addsuffix _covar.assoc.logistic,$(assocREF))

# .model.fisher, .model.dom.mperm, .model.dom.fisher.mperm
MODEL-DOM = $(addsuffix .dom,$(MODEL))
MODEL-DOM-MPERM = $(addsuffix .dom.mperm,$(MODEL))

#nonperm-models = $(ASSOC) $(ASSOC-LOGISTIC) $(ASSOC-LOGISTIC-COVAR) $(ASSOC-LOGISTIC-DOM) $(ASSOC-LOGISTIC-DOM-COVAR) $(MODEL) $(MODEL-DOM)

perm-models =  $(ASSOC-MPERM) $(MODEL-DOM-MPERM)

all-models = $(nonperm-models) $(perm-models)
sigp = $(ASSOC) $(MODEL-DOM)

###### ######

smanMODELS = $(addsuffix .png,$(addprefix $(PNK)sman_,$(sigp)))

.PHONY:	simpman
simpman:	$(smanMODELS)

$(PNK)sman_%.png:	$(PNK)sigpval_%.txt
	Rscript simple_man.r $^ $@

###### ######

.PHONY:	domplot
domplot:	$(PNK)fo_dom.png

$(PNK)fo_dom.png:	$(PNK)gpos_cmodelP_fo_bm_RUFFv0.2_dp7.txt $(PNK)modelempP10k.txt
	Rscript mandom.r $^ $@


###### ######

pvalMODELS = $(addsuffix .txt,$(addprefix $(PNK)pval_,$(nonperm-models)))


sigpvalMODELS = $(addsuffix .txt,$(addprefix $(PNK)sigpval_,$(sigp)))

.PHONY:	pvals
pvals:	$(pvalMODELS) $(sigpvalMODELS)

$(PNK)sigpval_%.txt:	$(PNK)pval_%.txt $(PNK)sig_%.txt
	paste -d' ' $^ > $@

$(PNK)sig_%.txt:	$(PNK)plink_%.mperm
	grep "SNP" -v $^ | awk ' { split($$2,a,":"); print a[1],a[2],$$3 } ' | sort -k 1,1 -k 2,2g | awk ' BEGIN { print "emp1" }; { print $$3 } ' > $@

$(PNK)pval_%.txt:	$(PNK)plink_%
	awk ' { if ($$0 ~ "SNP") { for (i=1; i<=NF; i++) { if ($$i == "P") INDEX=i } } else { split($$2,a,":"); print a[1],a[2],$$INDEX } } ' $^ | sort -k 1,1 -k 2,2n | awk ' BEGIN { a=0; l=0; c=""; print "chr","pos","pval","gpos" }; { if ($$1 != c) a+=l; print $$0,$$2+a; l=$$2; c=$$1 } ' > $@


###### ######

qqMODELS = $(addsuffix .png,$(addprefix $(PNK)qq_,$(nonperm-models)))

.PHONY:	qq-plot
qq-plot:	$(qqMODELS)


$(PNK)qq_%.png:	$(PNK)plink_%
	Rscript qq-plot.r $^ $@ P


###### ######

.PHONY:	addgpos
addgpos:	$(PNK)gpos_cmodelP_fo_bm_RUFFv0.2_dp7.txt

$(PNK)gpos_cmodelP_fo_bm_RUFFv0.2_dp7.txt:	$(PNK)cmodelP_fo_bm_RUFFv0.2_dp7.txt
	awk ' BEGIN { a=0; l=0; c=""; OFS=" "; $$1=$$1 }; { if ($$0 ~ "ALLELIC") print $$0,"gpos"; else {if ($$1 != c) a+=l; print $$0" "$$2+a; l=$$2; c=$$1 } } ' $^ > $@

###### ######

.PHONY:	correctP
correctP:	$(PNK)cmodelP_fo_bm_RUFFv0.2_dp7.txt

$(PNK)cmodelP_fo_bm_RUFFv0.2_dp7.txt:	$(PNK)modelGC.txt $(PNK)modelP_fo_bm_RUFFv0.2_dp7.txt
	awk ' FNR==NR { a[$$1]=$$2; next }{ if ($$0 ~ "ALLELIC") { print $$0; for (i=3; i<=NF; i++) b[i]=$$i } else { printf $$1" "$$2" "; for (j=3; j<=NF; j++) { key=b[j]; gc=a[key]; if ($$j == "NA") printf "NA "; else printf $$j*gc" " } print "" } } ' $^ > $@

###### ######

.PHONY:	lambda
lambda:	$(PNK)modelGC.txt $(PNK)logisticGC.txt

$(PNK)modelGC.txt:	$(PNK)modelP_fo_bm_RUFFv0.2_dp7.txt
	grep "ALLELIC" -v $^ | awk ' { if ($$3 != "NA") print $$3 } ' | sort -g | estlambda | awk ' { print "ALLELIC",$$0 } ' > $@
	grep "GENO" -v $^ | awk ' { if ($$4 != "NA") print $$4 } ' | sort -g | estlambda | awk ' { print "GENO",$$0 } ' >> $@
	grep "DOM" -v $^ | awk ' { if ($$5 != "NA") print $$5 } ' | sort -g | estlambda | awk ' { print "DOM",$$0 } ' >> $@
	grep "REC" -v $^ | awk ' { if ($$6 != "NA") print $$6 } ' | sort -g | estlambda | awk ' { print "REC",$$0 } ' >> $@
	grep "TREND" -v $^ | awk ' { if ($$7 != "NA") print $$7 } ' | sort -g | estlambda | awk ' { print "TREND",$$0 } ' >> $@

$(PNK)logisticGC.txt:	$(PNK)logisticP_fo_bm_RUFFv0.2_dp7.txt
	grep "ADD" -v $^ | awk ' { if ($$3 != "NA") print $$3 } ' | sort -g | estlambda | awk ' { print "ADD",$$0 } ' > $@
	grep "GENO_ADD" -v $^ | awk ' { if ($$4 != "NA") print $$4 } ' | sort -g | estlambda | awk ' { print "GENO_ADD",$$0 } ' >> $@
	grep "GENO_2DF" -v $^ | awk ' { if ($$6 != "NA") print $$6 } ' | sort -g | estlambda | awk ' { print "GENO_2DF",$$0 } ' >> $@
	grep "DOM" -v $^ | awk ' { if ($$7 != "NA") print $$7 } ' | sort -g | estlambda | awk ' { print "DOM",$$0 } ' >> $@


###### ######

.PHONY:	modelP
modelP:	$(PNK)modelP_fo_bm_RUFFv0.2_dp7.txt $(PNK)logisticP_fo_bm_RUFFv0.2_dp7.txt

$(PNK)modelP_%.txt:	$(PNK)p_%.model.allelic $(PNK)p_%.model.add $(PNK)p_%.model.dom $(PNK)p_%.model.rec $(PNK)p_%.model.trend
	paste -d' ' $^ > $@


$(PNK)p_%.model.allelic:	$(PNK)plink_%.model.allelic
	 awk ' { split($$2,a,":"); print a[1],a[2],$$NF } ' $^ | sort -k 1,1 -k 2,2g | awk ' BEGIN { print "chr","pos","ALLELIC" }; { print $$1,$$2,$$3 } ' > $@

$(PNK)p_%.model.add:	$(PNK)plink_%.model.add
	 awk ' { split($$2,a,":"); print a[1],a[2],$$NF } ' $^ | sort -k 1,1 -k 2,2g | awk ' BEGIN { print "GENO" }; { print $$3 } ' > $@

$(PNK)p_%.model.dom:	$(PNK)plink_%.model.dom
	 awk ' { split($$2,a,":"); print a[1],a[2],$$NF } ' $^ | sort -k 1,1 -k 2,2g | awk ' BEGIN { print "DOM" }; { print $$3 } ' > $@

$(PNK)p_%.model.rec:	$(PNK)plink_%.model.rec
	 awk ' { split($$2,a,":"); print a[1],a[2],$$NF } ' $^ | sort -k 1,1 -k 2,2g | awk ' BEGIN { print "REC" }; { print $$3 } ' > $@

$(PNK)p_%.model.trend:	$(PNK)plink_%.model.trend
	 awk ' { split($$2,a,":"); print a[1],a[2],$$NF } ' $^ | sort -k 1,1 -k 2,2g | awk ' BEGIN { print "TREND" }; { print $$3 } ' > $@

###

$(PNK)logisticP_%.txt:	$(PNK)p_%.assoc.logistic.add $(PNK)p_%.assoc.logistic.geno_add $(PNK)p_%.assoc.logistic.geno_domdev $(PNK)p_%.assoc.logistic.geno_2df $(PNK)p_%.assoc.logistic.dom
	paste -d' ' $^ > $@

$(PNK)p_%.logistic.add:	$(PNK)plink_%.logistic.add
	awk ' { split($$2,a,":"); print a[1],a[2],$$NF } ' $^ | sort -k 1,1 -k 2,2g | awk ' BEGIN { print "chr","pos","ADD" }; { print $$1,$$2,$$3 } ' > $@

$(PNK)p_%.logistic.geno_add:	$(PNK)plink_%.logistic.geno_add
	 awk ' { split($$2,a,":"); print a[1],a[2],$$NF } ' $^ | sort -k 1,1 -k 2,2g | awk ' BEGIN { print "GENO_ADD" }; { print $$3 } ' > $@

$(PNK)p_%.logistic.geno_domdev:	$(PNK)plink_%.logistic.geno_domdev
	 awk ' { split($$2,a,":"); print a[1],a[2],$$NF } ' $^ | sort -k 1,1 -k 2,2g | awk ' BEGIN { print "GENO_DOMDEV" }; { print $$3 } ' > $@

$(PNK)p_%.logistic.geno_2df:	$(PNK)plink_%.logistic.geno_2df
	 awk ' { split($$2,a,":"); print a[1],a[2],$$NF } ' $^ | sort -k 1,1 -k 2,2g | awk ' BEGIN { print "GENO_2DF" }; { print $$3 } ' > $@

$(PNK)p_%.logistic.dom:	$(PNK)plink_%.logistic.dom
	 awk ' { split($$2,a,":"); print a[1],a[2],$$NF } ' $^ | sort -k 1,1 -k 2,2g | awk ' BEGIN { print "DOM" }; { print $$3 } ' > $@

###### ######

assocMODELS = $(addprefix $(PNK)plink_,$(all-models))
logs = $(ASSOC-LOGISTIC) $(ASSOC-LOGISTIC-ADD) $(ASSOC-LOGISTIC-DOMDEV) $(ASSOC-LOGISTIC-GENO_2DF) $(ASSOC-LOGISTIC-DOM)

logisticMODELS = $(addprefix $(PNK)plink_,$(logs))

.PHONY:	fo-plink
fo-plink:	$(assocMODELS) $(PNK)plink_fo_bm_RUFFv0.2_dp7.model.dom.mperm
#$(logisticMODELS)


$(PNK)%.model.allelic:	$(PNK)%.model
	grep "ALLELIC" $^ > $@

$(PNK)%.model.add:	$(PNK)%.model
	grep "GENO" $^ > $@

$(PNK)%.model.dom:	$(PNK)%.model
	grep "DOM" $^ > $@

$(PNK)%.model.rec:	$(PNK)%.model
	grep "REC" $^ > $@

$(PNK)%.model.trend:	$(PNK)%.model
	grep "TREND" $^ > $@

###

$(PNK)%.assoc.logistic.add:	$(PNK)%.assoc.logistic
	grep "ADD" $^ > $@

$(PNK)%.assoc.logistic.dom:	$(PNK)%_dom.assoc.logistic
	grep "DOM" $^ > $@

$(PNK)%.assoc.logistic.geno_add:	$(PNK)%_geno.assoc.logistic
	grep "ADD" $^ > $@

$(PNK)%.assoc.logistic.geno_domdev:	$(PNK)%_geno.assoc.logistic
	grep "DOMDEV" $^ > $@

$(PNK)%.assoc.logistic.geno_2df:	$(PNK)%_geno.assoc.logistic
	grep "GENO_2DF" $^ > $@

###

$(PNK)%.assoc:	$(GEN)%.ped
	plink --assoc --file $(GEN)$* --out $(PNK)$* --cell 0 --noweb --1 --allow-no-sex

$(PNK)%.model:	$(GEN)%.ped
	plink --model --file $(GEN)$* --out $(PNK)$* --cell 0 --noweb --1 --allow-no-sex


$(PNK)%.assoc.logistic:	$(GEN)%.ped
	plink --logistic --file $(GEN)$* --out $(PNK)$* --cell 0 --noweb --1 --allow-no-sex

$(PNK)%_dom.assoc.logistic:	$(GEN)%.ped
	plink --logistic --dominant --file $(GEN)$* --out $(PNK)$*_dom --cell 0 --noweb --1 --allow-no-sex

$(PNK)%_geno.assoc.logistic:	$(GEN)%.ped
	plink --logistic --genotypic --file $(GEN)$* --out $(PNK)$*_geno --cell 0 --noweb --1 --allow-no-sex


#$(PNK)%.assoc.mperm:	$(GEN)%.ped
#	plink --assoc --file $(GEN)$* --out $(PNK)$* --cell 0 --noweb --1 --allow-no-sex --mperm 1000

$(PNK)%.model.dom.mperm:	$(GEN)%.ped
	plink --model-dom --file $(GEN)$* --out $(PNK)$* --cell 0 --noweb --1 --allow-no-sex --mperm 10000





#$(PNK)plink_%_covar.assoc.logistic:	$(PNK)%_covar.txt $(GEN)plink_%.ped
#	plink --logistic --covar $(word 1,$^) --file $(GEN)plink_$* --out $(PNK)plink_$*_covar --cell 0 --noweb --1 --allow-no-sex

#$(PNK)plink_%_dom_covar.assoc.logistic:	$(PNK)%_covar.txt $(GEN)plink_%.ped
#	plink --logistic --dominant --covar $(word 1,$^) --file $(GEN)plink_$* --out $(PNK)plink_$*_dom_covar --cell 0 --noweb --1 --allow-no-sex


###### ######

.PHONY:	plink-mds
plink-mds:	$(PNK)fo_r1bm_RUFFv0.2_dp7.mds $(PNK)fo_bm_RUFFv0.2_dp7.mds $(PNK)fo_r1bm_RUFFv0.2_dp7_covar.txt $(PNK)fo_bm_RUFFv0.2_dp7_covar.txt


#plink --file --noweb --1 --covar $(PNK)$*.txt --out $(PNK)$*

$(PNK)%_covar.txt:	$(PNK)%.mds
	awk ' { if ($$1 != "FID") print $$1,$$2,$$4,$$5 } ' $^ > $@

$(PNK)%.mds:	$(GEN)plink_%.ped
	plink --file $(GEN)plink_$* --noweb --1 --cluster --mds-plot 2 --out $(PNK)$*

###### ######

.PHONY:	create-raw
create-raw:	$(TPED) $(GRAW) $(GEN)fo_bm_RUFFv0.2_dp7.raw $(GEN)fo_r1bm_RUFFv0.2_dp7.raw $(GEN)fo_r1bm_RUFFv0.2_dp7.tped $(GEN)si_r1bm_RUFFv0.2_dp7.raw $(GEN)si_r1bm_RUFFv0.2_dp7.tped $(GEN)fo_r1bm_RUFFv0.2_dp5.raw $(GEN)fo_r1bm_RUFFv0.2_dp5.tped $(GEN)plink_fo_r1bm_RUFFv0.2_dp5.ped $(GEN)plink_fo_r1bm_RUFFv0.2_dp7.ped $(GEN)plink_fo_bm_RUFFv0.2_dp7.ped

$(GEN)%.raw:	$(GEN)%.tped
	Rscript tped2raw.r $^ $(GEN)$*.tfam $@

$(GEN)%.tped:	$(GEN)raw_%.tped
	awk ' { split($$2,a,":"); b=substr(a[1],4,length(a[1])); $$1=b; r+=1; rs=""; while (length(rs)+length(r) != 7) rs=rs"0"; $$2="rs"rs; $$2=$$2r; print $$0 } ' $^ | awk ' BEGIN { a=0; b=0 }; { if (a == 0) { a=1; for (i=5; i<=NF; i++) { if ($$i != 0) b=1 } if (b == 0) { printf $$1" "$$2" "$$3" "$$4" "; for (j=5; j<=NF; j++) { printf "G " } print "" } else print $$0 } else print $$0 } ' > $@	
	mv $(GEN)raw_$*.tfam $(GEN)$*.tfam


$(GEN)raw_%.tped:	$(GEN)raw_%.ped
	plink --noweb --file $(GEN)raw_$* --recode --transpose --out $(GEN)raw_$*


$(GEN)plink_fo_%_dp5.ped:	$(GEN)phe_fo_%.txt $(GEN)raw_fo_%_dp5.ped
	awk -F"\t" ' BEGIN { OFS="\t" }; FNR==NR{ a[$$1]=$$6; next }{ $$5=1; $$6=a[$$1]; print $$0 } ' $^ > $@
	cp $(GEN)raw_fo_$*_dp5.map $(GEN)plink_fo_$*_dp5.map

$(GEN)plink_fo_%_dp7.ped:	$(GEN)phe_fo_%.txt $(GEN)raw_fo_%_dp7.ped
	awk -F"\t" ' BEGIN { OFS="\t" }; FNR==NR{ a[$$1]=$$6; next }{ $$5=1; $$6=a[$$1]; print $$0 } ' $^ > $@
	cp $(GEN)raw_fo_$*_dp7.map $(GEN)plink_fo_$*_dp7.map 


$(GEN)raw_%_dp7.ped:	$(GEN)raw_%_edit.vcf
	vcftools --vcf $^ --minDP 8 --remove-indels --plink --out $(GEN)raw_$*_dp7

$(GEN)raw_fo_%_dp5.ped:	$(GEN)raw_fo5_%_edit.vcf
	vcftools --vcf $^ --minDP 6 --remove-indels --plink --out $(GEN)raw_fo_$*_dp5

$(GEN)raw_%_edit.vcf:	$(ALN)%.vcf.gz
	zcat $^ | awk ' BEGIN { OFS = "\t"}; { gsub("Contig","chr",$$0); gsub("Scaffold","chr",$$0); gsub("scaffold","chr",$$0); gsub("contig=<ID=C","contig=<ID=chr",$$0); if ($$0 ~ "^#") a=1; else gsub("C","chr",$$1) ; if ($$4 != "N") print $$0 } ' > $@

###### ######

GEN2 = $(GWS)GenABEL2/

ref2 = RUFFv0.2.fa
refnam2 = $(subst .fa,,$(ref2))

###### ######

.PHONY:	new-qtscore
new-qtscore:	$(GEN2)fo_qt_RUFFv0.2_dp6.txt $(GEN2)si_qt_RUFFv0.2_dp6.txt $(GEN2)fo_qtibs_RUFFv0.2_dp6.txt $(GEN2)si_qtibs_RUFFv0.2_dp6.txt $(GEN2)contigsize.txt $(GEN2)fo_qt_RUFFv0.2_dp6_qc.txt $(GEN2)si_qt_RUFFv0.2_dp6_qc.txt $(GEN2)fo_qtibs_RUFFv0.2_dp6_qc.txt $(GEN2)si_qtibs_RUFFv0.2_dp6_qc.txt


$(GEN2)%_qt_RUFFv0.2_dp6.txt:	$(GEN2)contigsize.txt $(GEN2)reord_u%_qt_RUFFv0.2_dp6.txt
	awk ' BEGIN { a=0; c=-1; LEN[-1]=0; print "Chromosome","Position","P1df","chrID","p.1k","GenomePosition" }; NR==FNR { LEN[$$1]=$$2; next}; { if ($$1 != c) a+=LEN[c]; print $$0,$$2+a; c=$$1 } ' $(word 1,$^) $(word 2,$^) > $@

$(GEN2)%_qtibs_RUFFv0.2_dp6.txt:	$(GEN2)contigsize.txt $(GEN2)reord_u%_qtibs_RUFFv0.2_dp6.txt
	awk ' BEGIN { a=0; c=-1; LEN[-1]=0; print "Chromosome","Position","P1df","chrID","p.1k","GenomePosition" }; NR==FNR { LEN[$$1]=$$2; next}; { if ($$1 != c) a+=LEN[c]; print $$0,$$2+a; c=$$1 } ' $(word 1,$^) $(word 2,$^) > $@

$(GEN2)%_qt_RUFFv0.2_dp6_qc.txt:	$(GEN2)contigsize.txt $(GEN2)reord_u%_qt_RUFFv0.2_dp6_qc.txt
	awk ' BEGIN { a=0; c=-1; LEN[-1]=0; print "Chromosome","Position","P1df","chrID","p.1k","GenomePosition" }; NR==FNR { LEN[$$1]=$$2; next}; { if ($$1 != c) a+=LEN[c]; print $$0,$$2+a; c=$$1 } ' $(word 1,$^) $(word 2,$^) > $@

$(GEN2)%_qtibs_RUFFv0.2_dp6_qc.txt:	$(GEN2)contigsize.txt $(GEN2)reord_u%_qtibs_RUFFv0.2_dp6_qc.txt
	awk ' BEGIN { a=0; c=-1; LEN[-1]=0; print "Chromosome","Position","P1df","chrID","p.1k","GenomePosition" }; NR==FNR { LEN[$$1]=$$2; next}; { if ($$1 != c) a+=LEN[c]; print $$0,$$2+a; c=$$1 } ' $(word 1,$^) $(word 2,$^) > $@

$(GEN2)reord_u%_qt_RUFFv0.2_dp6.txt:	$(GEN2)pu%_qt_RUFFv0.2_dp6.txt
		grep "^Chromosome" -v $^ | awk ' BEGIN { a=0; old_chr=-1; COI[3357]=1270; COI[3047]=1271; COI[3208]=1272; COI[4111]=1273; COI[3750]=1274; COI[2063]=1275;COI[1270]=1276;COI[4944]=1277;COI[9013]=1278;COI[3913]=1279; }; { if ($$1 != old_chr) { if ($$1 == 1270 || $$1 == 2063 || $$1 == 3047 || $$1 == 3208 || $$1 == 3357 || $$1 == 3750 || $$1 == 3913 || $$1 == 4111 || $$1 == 4944 || $$1 == 9013) { c=COI[$$1]; old_chr = $$1 } else { a++; if (a == 1270) a=1280; c=a; old_chr = $$1 } } print $$1,$$2,$$3,c,$$NF } ' | sort -k 4,4n -k 2,2n > $@

$(GEN2)reord_u%_qtibs_RUFFv0.2_dp6.txt:	$(GEN2)pu%_qtibs_RUFFv0.2_dp6.txt
		grep "^Chromosome" -v $^ | awk ' BEGIN { a=0; old_chr=-1; COI[3357]=1270; COI[3047]=1271; COI[3208]=1272; COI[4111]=1273; COI[3750]=1274; COI[2063]=1275;COI[1270]=1276;COI[4944]=1277;COI[9013]=1278;COI[3913]=1279; }; { if ($$1 != old_chr) { if ($$1 == 1270 || $$1 == 2063 || $$1 == 3047 || $$1 == 3208 || $$1 == 3357 || $$1 == 3750 || $$1 == 3913 || $$1 == 4111 || $$1 == 4944 || $$1 == 9013) { c=COI[$$1]; old_chr = $$1 } else { a++; if (a == 1270) a=1280; c=a; old_chr = $$1 } } print $$1,$$2,$$3,c,$$NF } ' | sort -k 4,4n -k 2,2n > $@

$(GEN2)reord_u%_qt_RUFFv0.2_dp6_qc.txt:	$(GEN2)pu%_qt_RUFFv0.2_dp6_qc.txt
		grep "^Chromosome" -v $^ | awk ' BEGIN { a=0; old_chr=-1; COI[3357]=1270; COI[3047]=1271; COI[3208]=1272; COI[4111]=1273; COI[3750]=1274; COI[2063]=1275;COI[1270]=1276;COI[4944]=1277;COI[9013]=1278;COI[3913]=1279; }; { if ($$1 != old_chr) { if ($$1 == 1270 || $$1 == 2063 || $$1 == 3047 || $$1 == 3208 || $$1 == 3357 || $$1 == 3750 || $$1 == 3913 || $$1 == 4111 || $$1 == 4944 || $$1 == 9013) { c=COI[$$1]; old_chr = $$1 } else { a++; if (a == 1270) a=1280; c=a; old_chr = $$1 } } print $$1,$$2,$$3,c,$$NF } ' | sort -k 4,4n -k 2,2n > $@

$(GEN2)reord_u%_qtibs_RUFFv0.2_dp6_qc.txt:	$(GEN2)pu%_qtibs_RUFFv0.2_dp6_qc.txt
		grep "^Chromosome" -v $^ | awk ' BEGIN { a=0; old_chr=-1; COI[3357]=1270; COI[3047]=1271; COI[3208]=1272; COI[4111]=1273; COI[3750]=1274; COI[2063]=1275;COI[1270]=1276;COI[4944]=1277;COI[9013]=1278;COI[3913]=1279; }; { if ($$1 != old_chr) { if ($$1 == 1270 || $$1 == 2063 || $$1 == 3047 || $$1 == 3208 || $$1 == 3357 || $$1 == 3750 || $$1 == 3913 || $$1 == 4111 || $$1 == 4944 || $$1 == 9013) { c=COI[$$1]; old_chr = $$1 } else { a++; if (a == 1270) a=1280; c=a; old_chr = $$1 } } print $$1,$$2,$$3,c,$$NF } ' | sort -k 4,4n -k 2,2n > $@

$(GEN2)pu%_qt_RUFFv0.2_dp6.txt:	$(GEN2)u%_qt1_RUFFv0.2_dp6.txt $(GEN2)u%_qt1k_RUFFv0.2_dp6.txt
	grep "^Chromosome" -v $(word 2,$^) | awk ' BEGIN { print "p.1k" }; { print $$3 } ' > tmp_$*P1df.txt
	paste -d" " $(word 1,$^) tmp_$*P1df.txt > $@

$(GEN2)pu%_qtibs_RUFFv0.2_dp6.txt:	$(GEN2)u%_qtibs1_RUFFv0.2_dp6.txt $(GEN2)u%_qtibs1k_RUFFv0.2_dp6.txt
	grep "^Chromosome" -v $(word 2,$^) | awk ' BEGIN { print "p.1k" }; { print $$3 } ' > tmp_$*P1df.txt
	paste -d" " $(word 1,$^) tmp_$*P1df.txt > $@

$(GEN2)pu%_qt_RUFFv0.2_dp6_qc.txt:	$(GEN2)u%_qt1_RUFFv0.2_dp6_qc.txt $(GEN2)u%_qt1k_RUFFv0.2_dp6_qc.txt
	grep "^Chromosome" -v $(word 2,$^) | awk ' BEGIN { print "p.1k" }; { print $$3 } ' > tmp_$*P1df.txt
	paste -d" " $(word 1,$^) tmp_$*P1df.txt > $@

$(GEN2)pu%_qtibs_RUFFv0.2_dp6_qc.txt:	$(GEN2)u%_qtibs1_RUFFv0.2_dp6_qc.txt $(GEN2)u%_qtibs1k_RUFFv0.2_dp6_qc.txt
	grep "^Chromosome" -v $(word 2,$^) | awk ' BEGIN { print "p.1k" }; { print $$3 } ' > tmp_$*P1df.txt
	paste -d" " $(word 1,$^) tmp_$*P1df.txt > $@

$(GEN2)contigsize.txt:	$(ALN)var_RUFFv0.2.vcf.gz
	zcat $^ | grep "#contig=<ID=Contig" | awk '{ gsub("##contig=<ID=Contig","",$$0); gsub("length=","",$$0); gsub(">","",$$0); split($$0,a,","); print a[1],a[2] } ' > $@

$(GEN2)ufo_qt1_RUFFv0.2_dp6.txt:	$(GEN2)RUFFv0.2_dp6.raw $(GEN2)phe_RUFFv0.2.txt
	Rscript qtscore.r $^ $@ fo 1 FALSE

$(GEN2)usi_qt1_RUFFv0.2_dp6.txt:	$(GEN2)RUFFv0.2_dp6.raw $(GEN2)phe_RUFFv0.2.txt
	Rscript qtscore.r $^ $@ si 1 FALSE

$(GEN2)ufo_qt1k_RUFFv0.2_dp6.txt:	$(GEN2)RUFFv0.2_dp6.raw $(GEN2)phe_RUFFv0.2.txt
	Rscript qtscore.r $^ $@ fo 1000 FALSE

$(GEN2)usi_qt1k_RUFFv0.2_dp6.txt:	$(GEN2)RUFFv0.2_dp6.raw $(GEN2)phe_RUFFv0.2.txt
	Rscript qtscore.r $^ $@ si 1000 FALSE

$(GEN2)ufo_qtibs1_RUFFv0.2_dp6.txt:	$(GEN2)RUFFv0.2_dp6.raw $(GEN2)phe_RUFFv0.2.txt
	Rscript qtscore.r $^ $@ fo 1 TRUE

$(GEN2)usi_qtibs1_RUFFv0.2_dp6.txt:	$(GEN2)RUFFv0.2_dp6.raw $(GEN2)phe_RUFFv0.2.txt
	Rscript qtscore.r $^ $@ si 1 TRUE

$(GEN2)ufo_qtibs1k_RUFFv0.2_dp6.txt:	$(GEN2)RUFFv0.2_dp6.raw $(GEN2)phe_RUFFv0.2.txt
	Rscript qtscore.r $^ $@ fo 1000 TRUE

$(GEN2)usi_qtibs1k_RUFFv0.2_dp6.txt:	$(GEN2)RUFFv0.2_dp6.raw $(GEN2)phe_RUFFv0.2.txt
	Rscript qtscore.r $^ $@ si 1000 TRUE

##

$(GEN2)ufo_qt1_RUFFv0.2_dp6_qc.txt:	$(GEN2)RUFFv0.2_dp6_qc.raw $(GEN2)phe_RUFFv0.2_qc.txt
	Rscript qtscore.r $^ $@ fo 1 FALSE

$(GEN2)usi_qt1_RUFFv0.2_dp6_qc.txt:	$(GEN2)RUFFv0.2_dp6_qc.raw $(GEN2)phe_RUFFv0.2_qc.txt
	Rscript qtscore.r $^ $@ si 1 FALSE

$(GEN2)ufo_qt1k_RUFFv0.2_dp6_qc.txt:	$(GEN2)RUFFv0.2_dp6_qc.raw $(GEN2)phe_RUFFv0.2_qc.txt
	Rscript qtscore.r $^ $@ fo 1000 FALSE

$(GEN2)usi_qt1k_RUFFv0.2_dp6_qc.txt:	$(GEN2)RUFFv0.2_dp6_qc.raw $(GEN2)phe_RUFFv0.2_qc.txt
	Rscript qtscore.r $^ $@ si 1000 FALSE

$(GEN2)ufo_qtibs1_RUFFv0.2_dp6_qc.txt:	$(GEN2)RUFFv0.2_dp6_qc.raw $(GEN2)phe_RUFFv0.2_qc.txt
	Rscript qtscore.r $^ $@ fo 1 TRUE

$(GEN2)usi_qtibs1_RUFFv0.2_dp6_qc.txt:	$(GEN2)RUFFv0.2_dp6_qc.raw $(GEN2)phe_RUFFv0.2_qc.txt
	Rscript qtscore.r $^ $@ si 1 TRUE

$(GEN2)ufo_qtibs1k_RUFFv0.2_dp6_qc.txt:	$(GEN2)RUFFv0.2_dp6_qc.raw $(GEN2)phe_RUFFv0.2_qc.txt
	Rscript qtscore.r $^ $@ fo 1000 TRUE

$(GEN2)usi_qtibs1k_RUFFv0.2_dp6_qc.txt:	$(GEN2)RUFFv0.2_dp6_qc.raw $(GEN2)phe_RUFFv0.2_qc.txt
	Rscript qtscore.r $^ $@ si 1000 TRUE

###### ######

.PHONY:	new-QC
new-QC:	$(GEN2)RUFFv0.2_dp6_qc.raw $(GEN2)phe_RUFFv0.2_qc.txt

$(GEN2)phe_RUFFv0.2_qc.txt:	$(GEN2)RUFFv0.2_dp6_qc.raw
	echo "present"

$(GEN2)RUFFv0.2_dp6_qc.raw:	$(GEN2)phe_RUFFv0.2.txt $(GEN2)RUFFv0.2_dp6.raw
	Rscript clean_data.r $^ $(GEN2)phe_RUFFv0.2_qc.txt $@

###### ######

GEN-IN2 = $(addprefix $(GEN2),$(refnam2))

phe-in2 = $(subst $(GEN2),$(GEN2)phe_,$(GEN-IN2))
PHE-IN2 = $(addsuffix .txt,$(phe-in2))

#$(GEN2)RUFFv0.2_dp6.raw
#CMD = $(addsuffix _cmd.png,$(GEN-VER))

#grep "^Chromosome" -v fo_qt1_RUFFv0.2_dp6.txt | awk ' BEGIN { print "chr", "CHR", "BP", "P"; a=0; old_chr=-1; coi=4999 }; { if ($1 != old_chr) { if ($1 == 1270 || $1 == 2063 || $1 == 3047 || $1 == 3208 || $1 == 3357 || $1 == 3750 || $1 == 3913 || $1 == 4111 || $1 == 4944 || $1 == 9013) { coi++; c=coi; old_chr = $1 } else { a++; if (a == 5000) a=5010; c=a; old_chr = $1 } } print $1,c,$2,$3 } ' | sort -k 2n | awk ' { if ($2 == "CHR" || $2 > 4000 && $2 < 6000) print $0 } ' > sub_reord_fo_qt1_RUFFv0.2_dp6.txt

.PHONY:	new-mds
new-mds:	$(GEN2)RUFFv0.2_dp6_cmd.png $(GEN2)RUFFv0.2_dp6_cmdf.png $(GEN2)RUFFv0.2_dp6_cmd_pc25.png $(GEN2)RUFFv0.2_dp6_cmd_pc1.png

$(GEN2)RUFFv0.2_dp6_cmd.png:	$(GEN2)RUFFv0.2_dp6.raw $(GEN2)phe_RUFFv0.2.txt
	Rscript mdscale.r $^ $@

$(GEN2)RUFFv0.2_dp6_cmdf.png:	$(GEN2)RUFFv0.2_dp6.raw $(GEN2)phe_RUFFv0.2.txt
	Rscript mdscale_filt.r $^ $@

$(GEN2)RUFFv0.2_dp6_cmd_pc5.png:	$(GEN2)RUFFv0.2_dp6.raw $(GEN2)phe_RUFFv0.2.txt
	Rscript mdscale_filt.r $^ $@

$(GEN2)RUFFv0.2_dp6_cmd_pc25.png:	$(GEN2)RUFFv0.2_dp6.raw $(GEN2)phe_RUFFv0.2.txt
	Rscript mdscale_perid0.25.r $^ $@

$(GEN2)RUFFv0.2_dp6_cmd_pc1.png:	$(GEN2)RUFFv0.2_dp6.raw $(GEN2)phe_RUFFv0.2.txt
	Rscript mdscale_perid0.1.r $^ $@

######

.PHONY:	new-create-phe
new-create-phe:	$(PHE-IN2) $(GEN2)phe_RUFFv0.2.txt


$(GEN2)phe_%.txt:	$(GEN2)phe_bamids_%.txt $(GEN2)phe_base.txt $(GEN2)tag_info.txt
	paste $^ > $@


$(GEN2)phe_bamids_%.txt:	$(ALN)var_%.vcf.gz
	zcat $^ | grep "#CHROM" | awk ' { for (i=10; i<=NF; i++) print $$i } ' | sort | awk ' BEGIN { print "id" }; { print $$0 } ' > $@


$(GEN2)phe_base.txt:	$(GEN2)phenotypes_sorted.txt
	cat $^ | sort -k 2 | awk ' BEGIN { OFS = "\t"; print "sex","tag","name","morph","fo","fs","fi","si","fsi","colour" }; { if ($$3 == "f") { fo = 1; fs = 1; fi = 1; m = 2; si = "NA"; col = "tomato3" } if ($$3 == "s") { fo = 0; fs = 0; fi = "NA"; m = 1; si = 1; col = "steelblue" } if ($$3 == "i") { fo = 0; fs = "NA"; fi = 0; m = 0; si = 0; col = "goldenrod" } print "1",$$2,$$1,$$3,fo,fs,fi,si,m,col } ' > $@


$(GEN2)tag_info.txt:	$(GEN2)tag_info1.txt $(GEN2)tag_info2.txt
	cat $^ | sort | awk ' BEGIN { print "lib" }; { print $$2 } ' > $@


$(GEN2)tag_info1.txt:	$(PRO)barcodes/2014025_TBLib1.pools
	awk -F"\t" ' BEGIN { OFS="\t" }; { print $$2,"0" } ' $^ > $@


$(GEN2)tag_info2.txt:	$(PRO)barcodes/2014025_TBLib2.pools
	awk -F"\t" ' BEGIN { OFS="\t" }; { print $$2,"1" } ' $^ > $@

######


.PHONY:	new-create-raw
new-create-raw:	$(GEN2)raw_RUFFv0.2_dp6.ped $(GEN2)RUFFv0.2_dp6.tped $(GEN2)RUFFv0.2_dp6.raw

$(GEN2)%.raw:	$(GEN2)%.tped
	Rscript tped2raw.r $^ $(GEN2)$*.tfam $@

$(GEN2)%.tped:	$(GEN2)raw_%.tped
	awk ' { split($$2,a,":"); b=substr(a[1],4,length(a[1])); $$1=b; r+=1; rs=""; while (length(rs)+length(r) != 7) rs=rs"0"; $$2="rs"rs; $$2=$$2r; print $$0 } ' $^ | awk ' BEGIN { a=0; b=0 }; { if (a == 0) { a=1; for (i=5; i<=NF; i++) { if ($$i != 0) b=1 } if (b == 0) { printf $$1" "$$2" "$$3" "$$4" "; for (j=5; j<=NF; j++) { printf "G " } print "" } else print $$0 } else print $$0 } ' > $@	
	mv $(GEN2)raw_$*.tfam $(GEN2)$*.tfam


$(GEN2)raw_%.tped:	$(GEN2)raw_%.ped
	plink --noweb --file $(GEN2)raw_$* --recode --transpose --out $(GEN2)raw_$*


$(GEN2)raw_%_dp6.ped:	$(GEN2)raw_%_edit.vcf
	vcftools --vcf $^ --minDP 6 --remove-indels --plink --out $(GEN2)raw_$*_dp6


$(GEN2)raw_%_edit.vcf:	$(ALN)var_%.vcf.gz
	zcat $^ | awk ' BEGIN { OFS = "\t"}; { gsub("Contig","chr",$$0); gsub("Scaffold","chr",$$0); gsub("scaffold","chr",$$0); gsub("contig=<ID=C","contig=<ID=chr",$$0); if ($$0 ~ "^#") a=1; else gsub("C","chr",$$1) ; if ($$4 != "N") print $$0 } ' > $@
