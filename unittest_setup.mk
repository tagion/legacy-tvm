UNITTEST:=$(BINDIR)/uinttest_tvm

TESTINC:=$(REPOROOT)/lib_tvm/
TESTDCFLAGS+=-I$(TESTINC) #REPOROOT)/lib_tvm/tests/basic/d/
TESTDCFLAGS+=$(TESTINC)/tests/wasm_samples.d

TESTDCFLAGS+=-g
TESTDCFLAGS+=-main
TESTDCFLAGS+=-unittest
TESTDCFLAGS+=-J$(REPOROOT)/lib_tvm/
