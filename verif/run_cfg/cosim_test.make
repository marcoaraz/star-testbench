#-------------------------------------------------------------------------------
# -*- Makefile -*-
MAKEOVERRIDES=
MAKEFLAGS=-e

#-------------------------------------------------------------------------------
# Directory handles
DEP_DIR  = $(PRJROOT)/verif/dep
COM_DIR  = $(PRJROOT)/verif/dep/common/sv
RAL_DIR  = $(PRJROOT)/verif/ral

SV_DIR   = $(PRJROOT)/verif/sv
TB_DIR   = $(PRJROOT)/verif/top
TEST_DIR = $(PRJROOT)/verif/tests

##EG: added for coverage. Variable defined un launch_regression script
LOG_PATH = $(PRJROOT)/verif/run_cfg
DESIGNWARE = $(DESIGNWARE_HOME)

INC_DIR  = +incdir+$(SV_DIR)
INC_DIR  += +incdir+$(TB_DIR)
INC_DIR  += +incdir+$(TEST_DIR)
INC_DIR  += +incdir+$(DEP_DIR)
INC_DIR  += +incdir+$(COM_DIR)
INC_DIR  += +incdir+$(DESIGNWARE)
#not need include uvm path when add "-ntb_opts uvm" to vlogan 
#INC_DIR += +incdir+$(UVM_HOME)/src

INC_DIR += +incdir+$(SV_DIR)/ioc_lvds_env
INC_DIR += +incdir+$(SV_DIR)/uart_svt

INC_DIR += +incdir+$(TEST_DIR)

# ------------------------------------------------------------------------------
# Choice Vendor is "QUESTA" or "VCS-MX", SETTING EVERYTHING FOR RTL/SIM
CODE_COVERAGE      = false
FUNC_COVERAGE      = false
DUMP_WAVE          = YES

COMP_ESPI_OPT += +define+NUM_SLAVES=1 +define+IS_MASTER_BFM_ACTIVE 

$(info [INFO: AVC] Using VCS to Compile Testbench! )
COMP_VLOG_OPT =
COMP_VLOG_OPT += -kdb
COMP_VLOG_OPT += -full64
COMP_VLOG_OPT += +v2k
ifeq ($(DUMP_WAVE),YES)
   COMP_VLOG_OPT += +define+DUMP
endif

ifeq ($(FUNC_COVERAGE),true)
   COMP_VLOG_OPT += +define+ENABLE_COVERAGE=1
   COMP_ESPI_OPT += +define+COVERAGE=1
endif

COMP_VLOG_OPT += -timescale=1ns/1ps
   
COMP_VCS_OPT  =
COMP_VCS_OPT  += -kdb
COMP_VCS_OPT  += -full64
COMP_VCS_OPT  += -lca
COMP_VCS_OPT  += -timescale=1ns/1ps
COMP_VCS_OPT  += -ntb_opts uvm 
COMP_VCS_OPT  += +lint=all 
ifeq ($(DUMP_WAVE),YES)
   COMP_VCS_OPT  += -debug_access+all 
else
   COMP_VCS_OPT  += -debug_pp
endif
ifeq ($(CODE_COVERAGE),true)
   COMP_VCS_OPT  += -cm tgl+line+cond+fsm+branch+assert
   COMP_VCS_OPT  += -cm_noconst
   COMP_VCS_OPT  += -cm_dir $(LOG_PATH)/cov.vdb
endif
COMP_VCS_OPT  += -debug_pp
COMP_UVM_OPT  = -ntb_opts uvm
COMP_UVM_OPT +=  +define+UVM_NO_DPI +define+SVT_UVM_TECHNOLOGY +define+SYNOPSYS_SV  +define+UVM_PACKER_MAX_BYTES=8000 
  
$(info [INFO: AVC] Using VCS-MX, VERILOG Compile FLAGs: $(COMP_VLOG_OPT) )
$(info [INFO: AVC] Using VCS-MX, VCS Compile FLAGs: $(COMP_VCS_OPT) )
$(info [INFO: AVC] Using VCS-MX, VCS DEBUG Compile FLAGs: $(VCS_DEBUG_FLAGS) )

COMP_VLOG = @vlogan $(COMP_VLOG_OPT) 
COMP_SVLOG = @vlogan $(COMP_VLOG_OPT) -sverilog $(COMP_UVM_OPT)
COMP_VCS = @vcs  $(COMP_VCS_OPT) $(VCS_DEBUG_FLAGS) +warn=noFCICIO 

TB_ARG = 

ifdef BMC_IIC
   TB_ARG += +define+BMC_IIC
endif

$(info [INFO: AVC] Testbench Compile FLAGs: $(TB_ARG) )

# ------------------------------------------------------------------------------
# COMPILING EVERYTHING FOR RTL

# ------------------------------------------------------------------------------
# start to compile all

.PHONY: all uvm ral dw dep sv sim

#all:  uvm ral dw vip env tb sim
all:  uvm ral dep sv sim


#not need compile uvm when add "-ntb_opts uvm" to vlogan 
uvm:
	$(info [INFO: AVC] Use $(VENDOR) to compile uvm lib.) 
	# with partition compile when UVM package is not analyzed separately without any source files.
	$(COMP_SVLOG)  -ntb_opts uvm

ral:
ifeq ($(FUNC_COVERAGE),true)
	cd $(RAL_DIR) ; ralgen -full64 -t avc -c a -l sv -uvm avc_reg_sys.ralf 
else
	cd $(RAL_DIR) ; ralgen -full64 -t avc -l sv -uvm avc_reg_sys.ralf 
endif
	$(COMP_SVLOG)   -work libtest +incdir+$(UVM_HOME) +incdir+$(RAL_DIR) $(RAL_DIR)/ral_avc_pkg.sv

dep:
	#altr_cmm
	$(COMP_SVLOG)  $(INC_DIR) -work libtest  $(TB_ARG)  -file $(PRJROOT)/verif/run_cfg/filelists/dep_files.f

sv:
	$(COMP_SVLOG)  $(INC_DIR) -work libtest  $(TB_ARG)  -file $(PRJROOT)/verif/run_cfg/filelists/cosim_testfiles.f

sim:	
	@echo "VCS-MX begin to compile testbench...";
	@echo "Compile for LVDS and Power Sequence Testcases";
	$(COMP_VCS)  tb_cosim_rtl tb_cosim_sim -l cosim_elabration.log


