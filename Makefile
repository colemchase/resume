LATEXMK = latexmk
MAIN = resume
OUTDIR = build
TEXMFVAR = $(CURDIR)/$(OUTDIR)/texmf-var

.PHONY: all clean

all: $(OUTDIR)/$(MAIN).pdf

$(OUTDIR)/$(MAIN).pdf: $(MAIN).tex
	mkdir -p $(OUTDIR) $(TEXMFVAR)
	TEXMFVAR=$(TEXMFVAR) $(LATEXMK) -pdf -interaction=nonstopmode -halt-on-error -outdir=$(OUTDIR) $(MAIN).tex

clean:
	TEXMFVAR=$(TEXMFVAR) $(LATEXMK) -C -outdir=$(OUTDIR) $(MAIN).tex
	rm -rf $(OUTDIR)
