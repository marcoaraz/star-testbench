# -*- Makefile -*-

MAKEOVERRIDES=
MAKEFLAGS=
# variable so we can call setup but only doing the vmap command.
#   This allows the modelsim.ini file to be overwritten during sourceme
#   and then calling make setup VMAP_ONLY=yes
VMAP_ONLY=no
# ------------------------------------------------------------------------------
$(info [INFO: NFPGA] Compile with the vendor of $(VENDOR) )

# -------------------------------------------------------------------------------------------------
# SETTING EVERYTHING FOR RTL/SIM
INIT_SEED          =$(shell echo $$RANDOM)
top_rtl_param      =
top_verif_param    =

# NFPGA SPECIFIC
CODE_COVERAGE      =false
FUNC_COVERAGE      =false

ifdef COV
CODE_COVERAGE      =true
FUNC_COVERAGE      =true
endif

#parameters to add to the compilation for the testbench to use
BMC_IIC=0

#if we want to gather coverage or not, setup in compilation command
ifeq ($(CODE_COVERAGE),false)
   top_rtl_param   +=CODE_COVERAGE=false
   top_verif_param +=CODE_COVERAGE=false INIT_SEED=$(INIT_SEED)

else ifeq ($(CODE_COVERAGE),true)
   top_rtl_param   +=CODE_COVERAGE=true
   top_verif_param +=CODE_COVERAGE=true INIT_SEED=$(INIT_SEED)

else
   $(error [ERROR: IOC] Unsupported CODE_COVERAGE Value:$(CODE_COVERAGE) [Should be true/false] )
endif

ifeq ($(FUNC_COVERAGE),false)
   top_rtl_param   +=FUNC_COVERAGE=false
   top_verif_param +=FUNC_COVERAGE=false INIT_SEED=$(INIT_SEED)

else ifeq ($(FUNC_COVERAGE),true)
   top_rtl_param   +=FUNC_COVERAGE=true
   top_verif_param +=FUNC_COVERAGE=true INIT_SEED=$(INIT_SEED)

else
   $(error [ERROR: IOC Unsupported FUNC_COVERAGE Value:$(FUNC_COVERAGE) [Should be true/false] )
endif

#if this compilation will be part of a regression, add parameter to compilation command
ifdef REGRESSION
   top_verif_param += DUMP_WAVE=NO
else
   top_verif_param += DUMP_WAVE=YES
endif

#add any valid defined parameters setup by the user
ifeq ($(BMC_IIC),1)
	top_verif_param += BMC_IIC=1
endif

#setup compilation to be done by VCS environment
CFG_DIR=$(PRJROOT)/verif/run_cfg
LIBRARY_DIR=$(CFG_DIR)/vcs_mx/libs
top_rtl_param +=SYNOPSYS_SIM_SETUP=$(CFG_DIR)/vcs_mx/synopsys_sim.setup
top_verif_param +=SYNOPSYS_SIM_SETUP=$(CFG_DIR)/vcs_mx/synopsys_sim.setup
top_verif_param +=UVM_HOME=$(VCS_HOME)/etc/uvm-1.1
top_verif_param +=VCS_UVM_HOME=$(VCS_HOME)/etc/uvm-1.1



.PHONY: all rm_% vlib_%

# -------------------------------------------------------------------------------------------------
# From scratch:
#  - first run environment_setup scripts
#  - "make all"

all : clean prep comp

clean:   clean_altera clean_rtl clean_verif clean_tmp
prep:    setup_tools setup_altera setup_rtl setup_verif
comp:    compile_rtl compile_verif

# -------------------------------------------------------------------------------------------------
#  TOOLS SETUP AND LIBS 

setup_tools: 
	$(CFG_DIR)/vcs_mx/setup.sh

# -------------------------------------------------------------------------------------------------
# COMPILING EVERYTHING FOR RTL

clean_altera: \
	rm_altera_ver       \
	rm_lpm_ver          \
	rm_sgate_ver        \
	rm_altera_mf_ver    \
	rm_altera_lnsim_ver \
	rm_fiftyfivenm_ver  
	
clean_rtl: \
	rm_libavc   

clean_tmp: 
	rm -rf $(LIBRARY_DIR) \
	rm -rf vhdlanLog csrc simv.daidir simv work.lib++ AN.DB 64 *log vc_hdrs.h


setup_altera: \
	vlib_altera_ver       \
	vlib_lpm_ver          \
	vlib_sgate_ver        \
	vlib_altera_mf_ver    \
	vlib_altera_lnsim_ver \
	vlib_fiftyfivenm_ver 

setup_rtl: \
	vlib_libavc   

compile_rtl: \
	$(info [INFO: AVC] Compile ALL FPGA param: $(top_rtl_param) )
	@$(MAKE)                             -f dut_cpufpga_rtl.make $(top_rtl_param) all 
	@$(MAKE)                             -f dut_scmfpga_rtl.make $(top_rtl_param)
	@$(MAKE)                             -f dut_debugfpga_rtl.make $(top_rtl_param)   

# -------------------------------------------------------------------------------------------------
# COMPILING EVERYTHING FOR TESTBENCH

clean_verif: \
	rm_libtest

setup_verif: \
	vlib_libtest  

compile_verif: \
	$(info [INFO: AVC] Compile DEP FPGA param: $(top_verif_param) )
	@$(MAKE)                             -f testbench_src.make $(top_verif_param)
	$(info [INFO: AVC] Compile CPU FPGA param: $(top_verif_param) )
	@$(MAKE)                             -f testbench_top.make $(top_verif_param) 
	
vlib_%:
	mkdir -p $(LIBRARY_DIR)/$(subst vlib_,,$@)
	@echo "$(subst vlib_,,$@) : $(LIBRARY_DIR)/$(subst vlib_,,$@)"   >>  $(LIBRARY_DIR)/../synopsys_sim.setup;



rm_%:
	rm -rf $(LIBRARY_DIR)/$(subst rm_,,$@) vhdlanLog csrc simv.daidir simv work.lib++ AN.DB 64 *log vc_hdrs.h

