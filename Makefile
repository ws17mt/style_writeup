.PHONY: dvi ps pdf all space clean veryclean distclean

SHELL = /bin/sh
MAKE  = gmake

TEX = pdflatex
BIB = bibtex

PAPERSIZE=a4

TARGET = style
BIBFILE = main.bib

tmp_files = $(TARGET).blg $(TARGET).log $(TARGET).bbl $(TARGET).aux $(TARGET).dvi $(TARGET).log

######################################################################
# make targets

all: $(TARGET).pdf

$(TARGET).pdf : $(TARGET).tex $(TARGET).bbl
	$(TEX) $(TARGET)
	$(TEX) $(TARGET)

$(TARGET).bbl : $(TARGET).tex $(BIBFILE)
	$(TEX) $(TARGET)
	$(BIB) $(TARGET)

clean:
	/bin/rm -f ${tmp_files} *~ $(TARGET).pdf $(TARGET).ps

.PHONY: all clean
