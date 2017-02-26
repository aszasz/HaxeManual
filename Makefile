dir = HaxeManual
outputdir = output
root = HaxeManual

pdf: $(root).pdf PHONY

md: PHONY
	cd convert && haxe convert.hxml

$(root).pdf: PHONY
	cd $(dir) && latexmk -xelatex $(root).tex
	mv $(dir)/$(root).pdf $(outputdir)/

clean: PHONY
	cd $(dir) && latexmk -c -xelatex $(root).tex
	rm -f convert/convert.n

dist-clean: clean
	git clean -f -- md/manual
	git checkout -- $(root).pdf md/manual todo.txt

.PHONY: PHONY

