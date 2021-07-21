MAINROOT:=${shell git rev-parse --show-toplevel}

include git.mk
-include localsetup.mk
include command.mk

.PHONY: help

HELP+=help-main
help-main:
	@echo "Usage "
	@echo
	@echo "make subdate   : If the repo been clone with out --recursive then run the"
	@echo
	@echo "make spull     : Pulls all submodules"
	@echo
	@echo "make spush     : Pushes all submodules"
	@echo
	@echo "make branch-<branch>     : Creates a new <branch>"
	@echo
	@echo "make checkout-<branch>   : Checkout a new <branch>"
	@echo
	@echo "make install   : Runs make install for all submodules"
	@echo
	@echo "make all       : Build all"
	@echo
	@echo "make lib       : Build submodule lib"
	@echo
	@echo "make help      : Displays a full help text"
	@echo
	@echo "make info      : Prints the Link and Compile setting"
	@echo
	@echo "make proper    : Clean all"
	@echo
	@echo "make clean     : Clean the build"
	@echo
	@echo "make hard-reset: Perform a hard reset on all submodules"
	@echo "                 Don't! if you still haven't secured you files"
	@echo

include setup.mk

include unittest_setup.mk

include builder.mk

include examples.mk

help: $(HELP)

info: $(INFO)

all: $(ALL)

subdate:
	git submodule update --init --recursive

spull:
	git pull --recurse-submodules

spush:
	git push --recurse-submodules=on-demand

checkout-%:
	git submodule foreach --recursive git checkout $*
	git checkout $*

branch-%:
	git submodule foreach --recursive git checkout -b $*
	git checkout $*


hard-reset:
	git submodule foreach --recursive git reset --hard

clean: $(CLEANER)
	rm -fR $(WAYS)

proper: $(CLEANER) $(PROPER)


test:
	@echo $(DFILES)
	@echo $(PROGRAM)
	@echo $(MAIN_SRC)
	@echo $(WAYS)
