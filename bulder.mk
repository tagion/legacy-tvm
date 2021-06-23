DC?=dmd
AR?=ar
include $(REPOROOT)/command.mk


DCFLAGS+=$(addprefix -I$(MAINROOT)/,$(DINC))

include setup.mk

-include $(REPOROOT)/dfiles.mk

#BIN:=bin/
LDCFLAGS+=$(LINKERFLAG)-L$(BINDIR)
ARFLAGS:=rcs
BUILD?=$(REPOROOT)/build
#SRC?=$(REPOROOT)

.SECONDARY: $(TOUCHHOOK)
.PHONY: makeway
.SECONDARY: $(LIBS)

INCFLAGS=${addprefix -I,${INC}}

.SECONDARY: .touch

ifdef COV
RUNFLAGS+=--DRT-covopt="merge:1 dstpath:reports"
DCFLAGS+=-cov
endif



HELP+=help-build

help-build:
	@echo "Usage bulder"
	@echo
	@echo "make PRECMD=   : Verbose mode"
	@echo "                 make PRECMD= <tag> # Prints the command while executing"
	@echo

include $(MAINROOT)/source.mk

info:
	@echo "WAYS    =$(WAYS)"
	@echo "DFILES  =$(DFILES)"
	@echo "LDCFLAGS =$(LDCFLAGS)"
	@echo "DCFLAGS  =$(DCFLAGS)"
	@echo "INCFLAGS =$(INCFLAGS)"
	@echo "GIT_REVNO=$(GIT_REVNO)"
	@echo "GIT_HASH =$(GIT_HASH)"



unittest: $(UNITTEST)
	export LD_LIBRARY_PATH=$(LIBBRARY_PATH); $(UNITTEST)

$(UNITTEST): $(LIBS) $(WAYS) $(DFILES)
	$(PRECMD)$(DC) $(DCFLAGS) $(INCFLAGS) $(DFILES) $(TESTDCFLAGS) $(LDCFLAGS) $(OUTPUT)$@


define LINK
$(1): $(1).d $(LIBRARY)
	@echo "########################################################################################"
	@echo "## Linking $(1)"
	$(PRECMD)$(DC) $(DCFLAGS) $(INCFLAGS) $(1).d $(OUTPUT)$(BIN)/$(1) $(LDCFLAGS)
endef

$(eval $(foreach main,$(MAIN),$(call LINK,$(main))))

makeway: ${WAYS}

include $(REPOROOT)/makeway.mk
$(eval $(foreach dir,$(WAYS),$(call MAKEWAY,$(dir))))

%.touch:
	@echo "########################################################################################"
	@echo "## Create dir $(@D)"
	$(PRECMD)mkdir -p $(@D)
	$(PRECMD)touch $@


#include $(DDOCBUILDER)

$(LIBRARY): ${DFILES}
	@echo "########################################################################################"
	@echo "## Library $@"
	@echo "########################################################################################"
	${PRECMD}$(DC) ${INCFLAGS} $(DCFLAGS) $(DFILES) -c $(OUTPUT)$(LIBRARY)

install: $(INSTALL)

CLEANER+=clean-build

clean-build:
#	rm -f $(LIBRARY)
	rm -f ${OBJS}
	rm -f $(UNITTEST) $(UNITTEST).o
	rm -f $(REVISION)
	rm -f dfiles.mk

proper: $(CLEANER)
	rm -fR $(WAYS)
	rm -f dfiles.mk

ALL+=$(PROGRAMS)

$(PROGRAMS): $(WAYS) $(DFILES) $(DMAIN)
	$(DC) $(DCFLAGS) $(DFILES) $(LDCFLAGS) $(OUTPUT) $@
