TARGETS = czds3-pics
DEPENDS = 
EXT     = %.synctex.gz

INSTALL_DIR ?= install/
TEMP    = $(filter $(EXT), $(foreach target, $(TARGETS), $(wildcard $(target).*)))

TEX     = latexmk -xelatex
MODE    = -interaction=nonstopmode -synctex=1 -auxdir=build

ifeq ($(OS), Windows_NT)
	RM    = del
	RMDIR = rmdir /s /q
	CP    = copy
	MKDIR = mkdir
else
	RM    = rm
	RMDIR = rm -r
	CP    = cp
	MKDIR = mkdir -p
endif

all:   SUBGOAL := all
clean: SUBGOAL := clean
distclean: SUBGOAL := distclean
tidy:  SUBGOAL := tidy

targets: $(DEPENDS) $(TARGETS:%=%.pdf)

all: $(DEPENDS)
	$(TEX) $(MODE)

install: targets $(INSTALL_DIR) $(TARGETS)

clean: $(DEPENDS) $(TEMP)
	-$(TEX) -C
	-$(RMDIR) build

distclean: $(DEPENDS) clean
	-$(RMDIR) $(INSTALL_DIR)

tidy: $(DEPENDS) $(TEMP)
	-$(TEX) -c
	-$(RMDIR) build

$(DEPENDS): FORCE_MAKE
	$(MAKE) -C $@ $(SUBGOAL)

$(TARGETS:%=%.pdf): %.pdf : %.tex FORCE_MAKE
	$(TEX) $(MODE) $<

$(TEMP): FORCE_MAKE
	-$(RM) $@

$(INSTALL_DIR): FORCE_MAKE
	-$(RMDIR) $@
	$(MKDIR) $@

$(TARGETS): FORCE_MAKE
	$(CP) $@.pdf $(INSTALL_DIR)

.PHONY: targets all install clean distclean tidy FORCE_MAKE