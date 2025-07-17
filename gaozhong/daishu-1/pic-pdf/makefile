TARGETS = $(basename $(wildcard *.tex))
OBJECTS = $(addsuffix .pdf, $(TARGETS))

EXT     = synctex.gz
TEMP    = $(foreach target, $(TARGETS),$(foreach ext, $(EXT), $(target).$(ext)))

TEX     = latexmk -xelatex
MODE    = -interaction=nonstopmode -synctex=1 -auxdir=build

ifeq ($(OS), Windows_NT)
	RM    = del
	RMDIR = rmdir /s /q
else
	RM    = rm
	RMDIR = rm -r
endif

targets: $(OBJECTS)

$(OBJECTS): %.pdf : %.tex FORCE_MAKE
	$(TEX) $(MODE) $<

all:
	$(TEX) $(MODE)

install: targets
	-$(TEX) -c
	-$(RMDIR) build
	-$(RM) $(TEMP)

clean:
	-$(TEX) -C
	-$(RMDIR) build
	-$(RM) $(TEMP)

.PHONY: targets all install clean FORCE_MAKE