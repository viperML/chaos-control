FILENAME ?= "main"
PREFIX ?= "output"
TEMPDIR ?= "builddir"

LATEXMK = latexmk \
	-pdflua \
	-interaction=nonstopmode \
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
		-synctex=1 \
		-pvc -view=none \
		-f \
		$(FILENAME).tex

clean:
	@rm -rvf $(TEMPDIR)
