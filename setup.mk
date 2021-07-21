MAIN:=tvm

DMAIN:=bin_$(MAIN)/$(MAIN).d

SCRIPTROOT:=${MAINROOT}/scripts/

BINDIR:=$(MAINROOT)/build/bin/
LIBDIR:=$(MAINROOT)/build/lib/

INC+=$(MAINROOT)/tagion_basic/
INC+=$(MAINROOT)/tagion_utils/
INC+=$(MAINROOT)/lib_wasm/
INC+=$(MAINROOT)/lib_tvm/

PROGRAM:=$(BINDIR)/tvm

WAYS+=$(BINDIR)
WAYS+=$(LIBDIR)

LIBWARM:=$(MAINROOT)/lib_tvm/bin/libwarm.a
LDCFLAGS+=$(LIBWARM)
LDCFLAGS+=-defaultlib=libphobos2.so

$(LIBWARM):
	cd $(MAINROOT)/lib_tvm/; make dodi; make -f wasm_lib.mk

ALL+=$(LIBWARM)

ifdef DEBUG
DCFLAGS+=-g
endif

help-setup:
	@echo "make DEBUG=1    : Switch on the debug flag"
	@echo
HELP+=help-setup
