
TEST?=testapp

run: all
	$(MAKE) BIN=$(BINDIR) -C bin_tvm/tests/$(TEST)/ all
	$(MAKE) BIN=$(BINDIR) -C bin_tvm/tests/$(TEST)/betterc all
	$(PROGRAM) $(BINDIR)/lib$(TEST).so $(BINDIR)/$(TEST).wasm

%-run:
	$(MAKE) BIN=$(BINDIR) -C bin_tvm/tests/$(TEST)/ $*
	$(MAKE) BIN=$(BINDIR) -C bin_tvm/tests/$(TEST)/betterc $*
