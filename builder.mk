DC?=dmd
AR?=ar
include $(REPOROOT)/command.mk



LDCFLAGS+=$(LINKERFLAG)-L$(BINDIR)
ARFLAGS:=rcs
BUILD?=$(REPOROOT)/build

.SECONDARY: $(TOUCHHOOK)
.PHONY: makeway
.SECONDARY: $(LIBS)

INCFLAGS=${addprefix -I,${INC}}

.SECONDARY: .touch

ifdef COV
RUNFLAGS+=--DRT-covopt="merge:1 dstpath:reports"
DCFLAGS+=-cov
endif
DCFLAGS+=$(DIP25) $(DIP1000)
#$(DIP1018)



HELP+=help-build

help-build:
	@echo "Usage builder"
	@echo
	@echo "make PRECMD=   : Verbose mode"
	@echo "                 make PRECMD= <tag> # Prints the command while executing"
	@echo
	@echo "make COV=      : Switch on code coverage"
	@echo

include $(MAINROOT)/libraries.mk

include $(REPOROOT)/source.mk

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
#	@echo "########################################################################################"
	$(PRECMD)$(DC) $(DCFLAGS) $(INCFLAGS) $(1).d $(OUTPUT)$(BIN)/$(1) $(LDCFLAGS)
endef

$(eval $(foreach main,$(MAIN),$(call LINK,$(main))))

makeway: ${WAYS}

include $(REPOROOT)/makeway.mk
$(eval $(foreach dir,$(WAYS),$(call MAKEWAY,$(dir))))

$(LIBRARY): ${DFILES}
	@echo "########################################################################################"
	@echo "## Library $@"
	@echo "########################################################################################"
	${PRECMD}$(DC) ${INCFLAGS} $(DCFLAGS) $(DFILES) -c $(OUTPUT)$(LIBRARY)

install: $(INSTALL)

CLEANER+=clean-build

clean-build:
	rm -f $(UNITTEST) $(UNITTEST).o

proper: $(CLEANER)

ALL+=$(PROGRAM)

$(PROGRAM): $(WAYS) $(DFILES) $(DMAIN)
	${PRECMD}$(DC) $(INCFLAGS) $(DCFLAGS) $(DFILES) $(DMAIN) $(LDCFLAGS) $(OUTPUT)$@
