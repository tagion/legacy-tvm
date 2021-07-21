UNITTEST:=$(BINDIR)/uinttest_tvm

TESTINC:=$(REPOROOT)/lib_tvm/tests/basic/d/
TESTDCFLAGS+=-I$(TESTINC) #REPOROOT)/lib_tvm/tests/basic/d/
TESTDCFLAGS+=$(TESTINC)/src/native_impl.d

TESTDCFLAGS+=-g
TESTDCFLAGS+=-main
TESTDCFLAGS+=-unittest
TESTDCFLAGS+=-J$(REPOROOT)/lib_tvm/
