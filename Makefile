FILENAME ?= "main"
PREFIX ?= "output"

all:
	@latexmk -pdflua \
		-interaction=nonstopmode \
		-outdir=$(PREFIX)
		./$(FILENAME).tex
.PHONY: all
