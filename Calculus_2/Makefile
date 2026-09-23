SHELL := /bin/bash

LATEXMK := latexmk
LATEXFLAGS := -pdf -interaction=nonstopmode -halt-on-error -file-line-error

BUILD := build
PDF := pdf
LECTURE_NUMBERS := 01 02 03 04 05 06 07 08 09

.PHONY: all combined individual clean fresh

all: combined individual

combined:
	@mkdir -p $(BUILD) $(PDF)
	cd src && $(LATEXMK) $(LATEXFLAGS) -outdir=../$(BUILD) lectures.tex
	cp $(BUILD)/lectures.pdf $(PDF)/calculus-2-lectures-01-09.pdf

individual:
	@mkdir -p $(BUILD)/individual $(BUILD)/xr $(PDF)/lectures
	@for n in $(LECTURE_NUMBERS); do \
		echo "First pass: lecture $$n"; \
		(cd src/standalone && $(LATEXMK) $(LATEXFLAGS) -outdir=../../$(BUILD)/individual lecture-$$n.tex) || exit 1; \
	done
	@cp $(BUILD)/individual/lecture-*.aux $(BUILD)/xr/
	@for n in $(LECTURE_NUMBERS); do \
		echo "Cross-reference pass: lecture $$n"; \
		(cd src/standalone && $(LATEXMK) -g $(LATEXFLAGS) -outdir=../../$(BUILD)/individual lecture-$$n.tex) || exit 1; \
		cp $(BUILD)/individual/lecture-$$n.pdf $(PDF)/lectures/calculus-2-lecture-$$n.pdf; \
	done

clean:
	rm -rf $(BUILD)

fresh: clean all
