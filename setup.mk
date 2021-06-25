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
	$(MAKE) -f $(MAINROOT)/lib_tvm/wasm_lib.mk all
	$(MAKE) -C $(MAINROOT)/lib_tvm/ dodi

ALL+=$(LIBWARM)
