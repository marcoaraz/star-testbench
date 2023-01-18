# -*- Makefile -*-

MAKEOVERRIDES=
MAKEFLAGS=

#-------------------------------------------------------------------------------
#design define
DESIGN_DEFINE = 

#-------------------------------------------------------------------------------
CODE_COVERAGE      =false
FUNC_COVERAGE      =false
#-------------------------------------------------------------------------------
# ------------------------------------------------------------------------------
# Choice Vendor is "QUESTA" or "VCS-MX", SETTING EVERYTHING FOR RTL/SIM

COMP_VLOG_OPT =
COMP_VLOG_OPT += -kdb
COMP_VLOG_OPT += -full64
COMP_VLOG_OPT += +v2k
#COMP_VLOG_OPT += +nospecify
COMP_VLOG_OPT += +define+SIMULATION

COMP_VLOG_OPT += -timescale=1ns/1ps 
COMP_VLOG_OPT += +incdir+$(UVM_HOME)/src
COMP_VLOG_OPT += -ntb_opts uvm

$(info [INFO: NFPGA] Using VCS-MX, CODE_COVERAGE   FLAGs: $(CODE_COVERAGE) )
$(info [INFO: NFPGA] Using VCS-MX, FUNC_COVERAGE   FLAGs: $(FUNC_COVERAGE) )
$(info [INFO: NFPGA] Using VCS-MX, VERILOG Compile FLAGs: $(COMP_VLOG_OPT) )

COMP_VLOG = @vlogan $(COMP_VLOG_OPT) 
COMP_SVLOG = @vlogan $(COMP_VLOG_OPT) -sverilog 
COMP_VCS = @vcs -full64 -ucli  -debug_access+all -ntb_opts uvm +lint=all 

# Directory handles
# -------------------------------------------------------------------------------------------------
SCM_DIR  = $(RTL_PATH)/scmfpga
QUAR_DIR = $(RTL_PATH)/scmfpga/quartus_ip
LIB_DIR  = $(RTL_PATH)/lib
ALTLIB_DIR = $(QUARTUS_INSTALL_DIR)/eda/sim_lib

INC_DIR  = +incdir+$(LIB_DIR)/LVDS
INC_DIR  += +incdir+$(LIB_DIR)/RSU
INC_DIR  += +incdir+$(LIB_DIR)/dependece
INC_DIR  += +incdir+$(LIB_DIR)/espi_slave
INC_DIR  += +incdir+$(LIB_DIR)/glitchfilter
INC_DIR  += +incdir+$(LIB_DIR)/quartus_ip/i2c_slave
INC_DIR  += +incdir+$(SCM_DIR)
INC_DIR  += +incdir+$(QUAR_DIR)
INC_DIR  += +incdir+$(SCM_DIR)/src/top
INC_DIR  += +incdir+$(SCM_DIR)/includes

LIB_RTL ?= libavc

.PHONY: all compile_altera compile_lib compile_rtl compile_stub

all: compile_altera compile_lib compile_rtl compile_stub

compile_altera:
	$(COMP_VLOG)  -work altera_ver        $(ALTLIB_DIR)/altera_primitives.v
	$(COMP_VLOG)  -work lpm_ver           $(ALTLIB_DIR)/220model.v
	$(COMP_VLOG)  -work sgate_ver         $(ALTLIB_DIR)/sgate.v
	$(COMP_VLOG)  -work altera_mf_ver     $(ALTLIB_DIR)/altera_mf.v
	$(COMP_SVLOG) -work altera_lnsim_ver  $(ALTLIB_DIR)/altera_lnsim.sv
	$(COMP_VLOG)  -work fiftyfivenm_ver   $(ALTLIB_DIR)/fiftyfivenm_atoms.v
	$(COMP_VLOG)  -work fiftyfivenm_ver   $(ALTLIB_DIR)/synopsys/fiftyfivenm_atoms_ncrypt.v

compile_lib:
	$(COMP_SVLOG)  -work $(LIB_RTL)	$(INC_DIR) -file $(PRJROOT)/verif/run_cfg/filelists/lib_files.f

compile_rtl:
	$(COMP_SVLOG)  -work $(LIB_RTL)	$(INC_DIR) -file $(PRJROOT)/verif/run_cfg/filelists/scmfpga_rtlfiles.f

compile_stub:
ifndef BMC_IIC
	$(COMP_SVLOG)  -work $(LIB_RTL)	$(PRJROOT)/verif/sv/stub/i2c_slave_bmc_wrapper.v
else
	$(COMP_SVLOG)  -work $(LIB_RTL) $(RTL_PATH)/scmfpga/quartus_ip/scm_i2c_slave/scm_i2c_slave/simulation/scm_i2c_slave.v
	$(COMP_SVLOG)  -work $(LIB_RTL)	$(RTL_PATH)/scmfpga/src/i2c_slave_bmc_wrapper/i2c_slave_bmc_wrapper.v
endif

