TEST_NAME = tc_00
.PHONY: case_none

case_none:
ifeq ($(VENDOR), QUESTA)
	make -f ../Makefile.questa sim   TEST_NAME=$(TEST_NAME)
else
	make -f ../Makefile.vcs sim   TEST_NAME=$(TEST_NAME)
endif

clean:
ifeq ($(VENDOR), QUESTA)
	make -f ../Makefile.questa clean
else
	make -f ../Makefile.vcs clean
endif

