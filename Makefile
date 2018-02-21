
default: dvidiff

%.dvi:
	latex --jobname=00 sample2e

01.dvi: .FORCE
	latex --jobname=01 sample2e


%.dvi.md5: %.dvi
	dvii -M0 $< >$@

dvidiff: 00.dvi.md5 01.dvi.md5
	diff $^

%.pdf: 
	pdflatex --jobname=$* sample2e

01.pdf: .FORCE
	pdflatex --jobname=01 sample2e


%.qdf: %.pdf
	qpdf  --qdf $< $@


pdfdiff: 00.qdf 01.qdf
	diff -I '^.*Date' -I '^.*/ID' $^

.FORCE:


clean:
	rm -rf 00* 01*

