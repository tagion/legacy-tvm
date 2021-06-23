MAIN:=tvm

DMAIN:=bin_$(MAIN)/$(MAIN).d

SCRIPTROOT:=${MAINROOT}/scripts/

BINDIR:=$(MAINROOT)/build/bin/
LIBDIR:=$(MAINROOT)/build/lib/

PACKAGE+=$(MAINREPOT)/tagion_basic/
PACKAGE+=$(MAINREPOT)/tagion_utils/
PACKAGE+=$(MAINREPOT)/lib_wasm/
PACKAGE+=$(MAINREPOT)/lib_tvm/

PROGRAM:=$(BINDIR)/tvm

WAYS+=$(BINDIR)
WAYS+=$(LIBDIR)
