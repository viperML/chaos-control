FILENAME ?= "main"
PREFIX ?= "output"
TEMPDIR ?= "builddir"

all:
	@latexmk -pdflua \
		-outdir=$(TEMPDIR) \
		./$(FILENAME).tex
.PHONY: all

install:
	@mkdir -p $(PREFIX)
	@cp -av $(TEMPDIR)/*.pdf $(PREFIX)
.PHONY: install
