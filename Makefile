all: html pdf pres

html: git-cheat-sheet.html

pdf: git-cheat-sheet.pdf

pres: git-mtm-presentation.pdf

git-cheat-sheet.html: git-cheat-sheet.md
	markdown $< > $@

git-cheat-sheet.pdf: git-cheat-sheet.md
	pandoc -V geometry:margin=1in $< -o $@

git-mtm-presentation.pdf: git-mtm-presentation.tex
	latexmk -pdf git-mtm-presentation

tidy:
	-rm *.html *.log *.aux *.aux.bak *.nav *.out *.snm *.toc *latexmk *synctex.gz *.fls *.vrb

clean:
	-rm *.html *.log *.aux *.aux.bak *.nav *.out *.snm *.toc *latexmk *synctex.gz *.fls *.vrb *.pdf
	-rm -rf auto/
