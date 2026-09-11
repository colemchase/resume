LATEXMK = latexmk
MAIN = resume
JOBNAME = ChaseColemanResume
OUTDIR = build
TEXMFVAR = $(CURDIR)/$(OUTDIR)/texmf-var

.PHONY: all clean

all: $(OUTDIR)/$(JOBNAME).pdf

$(OUTDIR)/$(JOBNAME).pdf: $(MAIN).tex Makefile
	mkdir -p $(OUTDIR) $(TEXMFVAR)
	TEXMFVAR=$(TEXMFVAR) $(LATEXMK) -pdf -interaction=nonstopmode -halt-on-error -jobname=$(JOBNAME) -outdir=$(OUTDIR) $(MAIN).tex

clean:
	TEXMFVAR=$(TEXMFVAR) $(LATEXMK) -C -jobname=$(JOBNAME) -outdir=$(OUTDIR) $(MAIN).tex
	rm -rf $(OUTDIR)
