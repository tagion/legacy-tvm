
run: all
	$(MAKE) BIN=$(BINDIR) -C bin_tvm/tests/testapp/ all
	$(MAKE) BIN=$(BINDIR) -C bin_tvm/tests/testapp/betterc all
	$(PROGRAM) $(BINDIR)/libtestapp.so $(BINDIR)/testapp.wasm

%-run:
	$(MAKE) BIN=$(BINDIR) -C bin_tvm/tests/testapp/ $*
	$(MAKE) BIN=$(BINDIR) -C bin_tvm/tests/testapp/betterc $*
