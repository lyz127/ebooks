TARGETS = gaozhong-daishu-2
OBJECTS = $(addsuffix .pdf, $(TARGETS))
DEPENDS = ../pic-pdf

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

$(DEPENDS): FORCE_MAKE
	$(MAKE) -C $@

$(OBJECTS): %.pdf : %.tex $(DEPENDS) FORCE_MAKE
	$(TEX) $(MODE) $<

all:
	$(TEX) $(MODE)

install: targets
	$(foreach depend, $(DEPENDS), $(MAKE) clean -C $(depend);)
	-$(TEX) -c
	-$(RMDIR) build
	-$(RM) $(TEMP)

clean:
	$(foreach depend, $(DEPENDS), $(MAKE) clean -C $(depend);)
	-$(TEX) -C
	-$(RMDIR) build
	-$(RM) $(TEMP)

.PHONY: targets all install clean FORCE_MAKE