SOURCES = src
OBJECTS = $(wildcard */$(SOURCES)/)
OBJECTS_EXTRA = $(wildcard */view/)

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
	$(foreach object, $(OBJECTS), $(CP) $(object)$(subst /$(SOURCES)/,.pdf,$(object)) install;)
	$(foreach object, $(OBJECTS) $(OBJECTS_EXTRA), $(MAKE) clean -C $(object);)

clean:
	-$(RMDIR) install
	$(foreach object, $(OBJECTS) $(OBJECTS_EXTRA), $(MAKE) clean -C $(object);)

.PHONY: targets all install clean FORCE_MAKE
