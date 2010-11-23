.PHONY : all
all : coffee.pdf coffee.sty

coffee.pdf : coffee.sty coffee.dtx
	pdflatex coffee.dtx
	makeindex coffee.glo -s gglo.ist -o coffee.gls
	pdflatex coffee.dtx

coffee.sty coffee.drv : coffee.ins coffee.dtx
	pdflatex coffee.ins

.PHONY : dist
dist : coffee.tar.gz

coffee.tar.gz : coffee.dtx coffee.ins coffee.pdf Makefile
	rm -f $@
	rm -rf coffee
	mkdir coffee
	cp coffee.dtx coffee.ins coffee.pdf Makefile coffee/
	tar czvf $@ coffee/
	rm -rf coffee
