+incdir+$RTL_PATH/lib/includes
+incdir+$RTL_PATH/cpufpga/includes

$RTL_PATH/cpufpga/quartus_ip/pll_cpu/pll_cpu.v

$RTL_PATH/cpufpga/quartus_ip/max10_flash/cpu_flash/simulation/submodules/altera_onchip_flash.v
$RTL_PATH/cpufpga/quartus_ip/max10_flash/cpu_flash/simulation/submodules/altera_onchip_flash_avmm_csr_controller.v
$RTL_PATH/cpufpga/quartus_ip/max10_flash/cpu_flash/simulation/submodules/altera_onchip_flash_avmm_data_controller.v
$RTL_PATH/cpufpga/quartus_ip/max10_flash/cpu_flash/simulation/submodules/altera_onchip_flash_util.v
$RTL_PATH/cpufpga/quartus_ip/max10_flash/cpu_flash/simulation/cpu_flash.v

+incdir+$RTL_PATH/cpufpga/includes
$RTL_PATH/cpufpga/src/plt_logic/sys_check/sys_check.v
$RTL_PATH/cpufpga/src/plt_logic/master_fub/master_fub.v
$RTL_PATH/cpufpga/src/plt_logic/cpu_aux/cpu_aux.v
$RTL_PATH/cpufpga/src/plt_logic/psu_ctrl/psu_ctrl.v
$RTL_PATH/cpufpga/src/plt_logic/avc_cpu_mem_seq/avc_cpu_mem_seq.v
$RTL_PATH/cpufpga/src/plt_logic/ADR_fub/ADRcounter.v
$RTL_PATH/cpufpga/src/plt_logic/ADR_fub/ADR_fub.v
$RTL_PATH/cpufpga/src/plt_logic/avenue_city_main/avenue_city_main.v
$RTL_PATH/cpufpga/src/plt_logic/vr_bypass/vr_bypass.v
$RTL_PATH/cpufpga/src/plt_logic/ddr5_pwrgd_logic/ddr5_pwrgd_logic.v
$RTL_PATH/cpufpga/src/plt_logic/ddr5_pwrgd_logic_modular/ddr5_pwrgd_logic_modular.v

$RTL_PATH/lib/plt_logic_common/InputsSyncWithDefault.v
$RTL_PATH/lib/plt_logic_common/SyncWithDefault.v

$RTL_PATH/cpufpga/src/plt_logic/avalon_mm_crossing_bridge/altera_avalon_dc_fifo.v
$RTL_PATH/cpufpga/src/plt_logic/avalon_mm_crossing_bridge/altera_avalon_mm_clock_crossing_bridge.v
$RTL_PATH/cpufpga/src/plt_logic/avalon_mm_crossing_bridge/altera_dcfifo_synchronizer_bundle.v
$RTL_PATH/cpufpga/src/plt_logic/avalon_mm_crossing_bridge/altera_std_synchronizer_nocut.v


$RTL_PATH/cpufpga/src/cpu_csr/cpu_global_csr.v
#$RTL_PATH/cpufpga/src/cpu_csr/adc_csr.v
$RTL_PATH/cpufpga/src/cpu_csr/cpu_pfr_csr.v
#$RTL_PATH/cpufpga/src/i2c_mst_wrapper/i2c_mst_wrapper.v

$RTL_PATH/cpufpga/quartus_ip/pll_adc/pll_adc.v
$RTL_PATH/cpufpga/src/plt_logic/adc/adc_wrapper.v
$RTL_PATH/cpufpga/src/plt_logic/perst/perst.v
$RTL_PATH/cpufpga/src/plt_logic/Pmode/Pmode.sv
$RTL_PATH/cpufpga/src/plt_logic/prochot_memhot/prochot_memhot.v
$RTL_PATH/cpufpga/src/plt_logic/sys_throttle/sys_throttle.v

$RTL_PATH/cpufpga/src/vgpio/espi_platform_csr.sv
$RTL_PATH/cpufpga/src/vgpio/vgpio_avc_map.sv
$RTL_PATH/cpufpga/src/vgpio/vgpio_espi_wrapper.sv


$RTL_PATH/cpufpga/quartus_ip/adc/adc/synthesis/submodules/adc_modular_dual_adc_0.v
$RTL_PATH/cpufpga/quartus_ip/adc/adc/synthesis/submodules/altera_modular_adc_sequencer_ctrl.v
$RTL_PATH/cpufpga/quartus_ip/adc/adc/synthesis/submodules/altera_modular_adc_conduit_splitter.v 
$RTL_PATH/cpufpga/quartus_ip/adc/adc/synthesis/submodules/altera_modular_adc_sequencer.v
$RTL_PATH/cpufpga/quartus_ip/adc/adc/synthesis/submodules/altera_modular_adc_control_avrg_fifo.v
$RTL_PATH/cpufpga/quartus_ip/adc/adc/synthesis/submodules/altera_modular_adc_control_fsm.v 
#$RTL_PATH/cpufpga/quartus_ip/adc/adc/synthesis/submodules/altera_reset_controller.v
#$RTL_PATH/cpufpga/quartus_ip/adc/adc/synthesis/submodules/altera_reset_synchronizer.v
$RTL_PATH/cpufpga/quartus_ip/adc/adc/synthesis/submodules/altera_modular_adc_control.v  
$RTL_PATH/cpufpga/quartus_ip/adc/adc/synthesis/submodules/chsel_code_converter_sw_to_hw.v
$RTL_PATH/cpufpga/quartus_ip/adc/adc/synthesis/submodules/altera_modular_adc_dual_sync.v 
$RTL_PATH/cpufpga/quartus_ip/adc/adc/synthesis/submodules/fiftyfivenm_adcblock_primitive_wrapper.v
$RTL_PATH/cpufpga/quartus_ip/adc/adc/synthesis/submodules/altera_modular_adc_sequencer_csr.v 
$RTL_PATH/cpufpga/quartus_ip/adc/adc/synthesis/submodules/fiftyfivenm_adcblock_top_wrapper.v
$RTL_PATH/cpufpga/quartus_ip/adc/adc/synthesis/submodules/altera_modular_adc_sample_store.v
$RTL_PATH/cpufpga/quartus_ip/adc/adc/synthesis/submodules/altera_modular_adc_response_merge.v
$RTL_PATH/cpufpga/quartus_ip/adc/adc/synthesis/submodules/altera_modular_adc_sample_store_ram.v

$RTL_PATH/cpufpga/src/plt_logic/Clkdiv/Clkdiv.v
$RTL_PATH/cpufpga/src/plt_logic/ClkDivTree/ClkDivTree.v
$RTL_PATH/cpufpga/src/plt_logic/Ocp_ctrl/Ocp_ctrl.v
$RTL_PATH/cpufpga/src/plt_logic/Signalvalidationdelay/Signalvalidationdelay.v
$RTL_PATH/cpufpga/src/plt_logic/Edge_Detect/Edge_Detect.v
$RTL_PATH/cpufpga/src/plt_logic/err_det/err_det.v

$RTL_PATH/cpufpga/quartus_ip/adc/adc/synthesis/adc.v

$RTL_PATH/cpufpga/src/i2c_mst_wrapper/i2c_mst_wrapper.v

$RTL_PATH/cpufpga/src/top/cpufpga_top.v
