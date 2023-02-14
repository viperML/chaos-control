FILENAME ?= "main"
PREFIX ?= "output"
TEMPDIR ?= "builddir"

LATEXMK = latexmk \
	-pdflua \
	-interaction=nonstopmode \
	-synctex=1 \
	-outdir=$(TEMPDIR)

.PHONY: all install watch

all:
	@$(LATEXMK) \
		$(FILENAME).tex

install:
	@mkdir -p $(PREFIX)
	@cp -avL $(TEMPDIR)/*.pdf $(PREFIX)

watch:
	@$(LATEXMK) \
		-pvc -view=none \
		-f \
		$(FILENAME).tex

clean:
	@rm -rvf $(TEMPDIR)
