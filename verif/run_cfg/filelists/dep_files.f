+incdir+$PRJROOT/verif/dep/common
+incdir+$PRJROOT/verif/dep/common/sv

+incdir+$PRJROOT/verif/dep/common/sv/smb_env
+incdir+$PRJROOT/verif/dep/common/sv/espi_testbench
+incdir+$PRJROOT/verif/dep/common/sv/espi_testbench/common/env
+incdir+$PRJROOT/verif/dep/common/sv/altr_cmn
+incdir+$PRJROOT/verif/dep/common/sv/avmm



+incdir+$PRJROOT/verif/dep/common/sv/iic_agent
+incdir+$PRJROOT/verif/dep/common/sv/iic_agent/bits
+incdir+$PRJROOT/verif/dep/common/sv/iic_agent/sequences

+incdir+$PRJROOT/verif/dep/common/sv/smb_env/smb_cmd_agt
+incdir+$PRJROOT/verif/dep/common/sv/smb_env/smb_seqlib

+incdir+$PRJROOT/verif/sv/iic_avmm




$PRJROOT/verif/dep/common/sv/altr_cmn/altr_cmn_macros.sv
$PRJROOT/verif/dep/common/sv/altr_cmn/altr_verbosity_uvm_pkg.sv
$PRJROOT/verif/dep/common/sv/altr_cmn/altr_cmn_macros.sv
$PRJROOT/verif/dep/common/sv/altr_cmn/reporting_pkg.sv

$PRJROOT/verif/dep/common/sv/sopc_builder_ip/verification/lib/avalon_mm_pkg.sv
$PRJROOT/verif/dep/common/sv/sopc_builder_ip/verification/lib/avalon_utilities_pkg.sv
+define+ENABLE_ALTERA_AVALON_TRANSACTION_RECORDING $PRJROOT/verif/dep/common/sv/sopc_builder_ip/verification/altera_avalon_mm_master_bfm/altera_avalon_mm_master_bfm_iface.sv
$PRJROOT/verif/dep/common/sv/sopc_builder_ip/verification/altera_avalon_mm_monitor_bfm/altera_avalon_mm_monitor_iface.sv
$PRJROOT/verif/dep/common/sv/sopc_builder_ip/verification/altera_avalon_mm_monitor_bfm/altera_avalon_mm_monitor_transactions_iface.sv
$PRJROOT/verif/dep/common/sv/sopc_builder_ip/verification/altera_avalon_mm_monitor_bfm/altera_avalon_mm_monitor_coverage_iface.sv
$PRJROOT/verif/dep/common/sv/sopc_builder_ip/verification/altera_avalon_mm_monitor_bfm/altera_avalon_mm_monitor_assertion_iface.sv
$PRJROOT/verif/dep/common/sv/avmm/avmm_pkg.sv

+define+NUM_SLAVES=1 +define+IS_MASTER_BFM_ACTIVE +define+COVERAGE=1 $PRJROOT/verif/dep/common/sv/espi_testbench/espi_test_bfm_pkg.sv
+define+NUM_SLAVES=1 +define+IS_MASTER_BFM_ACTIVE +define+COVERAGE=1 $PRJROOT/verif/dep/common/sv/espi_testbench/common/interface/espi_interface.sv
+define+NUM_SLAVES=1 +define+IS_MASTER_BFM_ACTIVE +define+COVERAGE=1 $PRJROOT/verif/dep/common/sv/espi_testbench/compliance_checker/assertion/espi_assertion.sv


$PRJROOT/verif/dep/common/sv/iic_agent/iic_test_defs_pkg.sv
$PRJROOT/verif/dep/common/sv/iic_agent/iic_agent_pkg.sv
$PRJROOT/verif/dep/common/sv/iic_agent/sequences/iic_seq_pkg.sv

$PRJROOT/verif/dep/common/sv/smb_env/smb_cmd_agt/smb_cmd_agt_pkg.sv
$PRJROOT/verif/dep/common/sv/smb_env/smb_env_pkg.sv
$PRJROOT/verif/dep/common/sv/smb_env/smb_seqlib/smb_seq_pkg.sv

$PRJROOT/verif/sv/iic_avmm/iic_avmm_cfg_pkg.sv
$PRJROOT/verif/sv/iic_avmm/iic_avmm_pkg.sv
$PRJROOT/verif/sv/iic_avmm/iic_avmm_master_bfm.sv
$PRJROOT/verif/sv/iic_avmm/iic_avmm_monitor_bfm.sv
