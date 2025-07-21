SOURCES       = src
SOURCES_EXTRA = view
TARGETS       = $(foreach sources, $(SOURCES), $(wildcard */*/$(sources)/))
TARGETS_EXTRA = $(foreach sources_extra, $(SOURCES_EXTRA), $(wildcard */*/$(sources_extra)/))

INSTALL_DIR ?= install/
EXTRA_DIR   ?= extra/
INSTALL_FILE = $(join $(TARGETS), $(foreach sources, $(SOURCES), $(subst /,-,$(subst /$(sources)/,.pdf,$(TARGETS)))))
EXTRA_FILE   = $(foreach sources_extra, $(SOURCES_EXTRA), $(wildcard */*/$(sources_extra)/*.pdf))

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

clean:     SUBGOAL    := clean
distclean: SUBGOAL    := distclean
tidy:      SUBGOAL    := tidy
install:   ACTIVE_DIR := $(INSTALL_DIR)
extra:     ACTIVE_DIR := $(EXTRA_DIR)

targets: $(TARGETS)

all: targets $(TARGETS_EXTRA)

install: targets $(INSTALL_DIR) $(INSTALL_FILE)

clean: $(TARGETS) $(TARGETS_EXTRA)

distclean: $(TARGETS) $(TARGETS_EXTRA)
	-$(RMDIR) $(INSTALL_DIR)
	-$(RMDIR) $(EXTRA_DIR)

tidy: $(TARGETS) $(TARGETS_EXTRA)

extra: $(TARGETS_EXTRA) $(EXTRA_DIR) $(EXTRA_FILE)

$(TARGETS) $(TARGETS_EXTRA): FORCE_MAKE
	$(MAKE) -C $@ $(SUBGOAL)

$(INSTALL_DIR) $(EXTRA_DIR): FORCE_MAKE
	-$(RMDIR) $@
	$(MKDIR) $@

$(INSTALL_FILE) $(EXTRA_FILE): FORCE_MAKE
	$(CP) $@ $(ACTIVE_DIR)

.PHONY: targets all install clean distclean tidy extra FORCE_MAKE
