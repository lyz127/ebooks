SOURCES = src
SOURCES_EXTRA = view
OBJECTS = $(foreach sources, $(SOURCES), $(wildcard */*/$(sources)/))
OBJECTS_EXTRA = $(foreach sources_extra, $(SOURCES_EXTRA), $(wildcard */*/$(sources_extra)/))

ifeq ($(OS), Windows_NT)
	RM    = del
	RMDIR = rmdir /s /q
	CP    = cp
	MKDIR = mkdir -f
else
	RM    = rm
	RMDIR = rm -r
	CP    = cp
	MKDIR = mkdir -p
endif

targets: $(OBJECTS)

all: targets $(OBJECTS_EXTRA)

$(OBJECTS): FORCE_MAKE
	$(MAKE) -C $@

$(OBJECTS_EXTRA): FORCE_MAKE
	$(MAKE) -C $@

install: targets
	-$(RMDIR) install
	$(MKDIR) install
	$(foreach object, $(OBJECTS), $(CP) $(object)$(subst /,-,$(subst /$(SOURCES)/,.pdf,$(object))) install;)
	$(foreach object, $(OBJECTS) $(OBJECTS_EXTRA), $(MAKE) clean -C $(object);)

clean:
	-$(RMDIR) install
	$(foreach object, $(OBJECTS) $(OBJECTS_EXTRA), $(MAKE) clean -C $(object);)

.PHONY: targets all install clean FORCE_MAKE
