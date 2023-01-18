+incdir+$RTL_PATH/lib/espi_slave
+incdir+$RTL_PATH/lib/includes
+incdir+$RTL_PATH/cpufpga/includes

$RTL_PATH/lib/espi_slave/espi_cmd_det.sv 
$RTL_PATH/lib/espi_slave/espi_condt_det.sv 
$RTL_PATH/lib/espi_slave/espi_crc_gen.sv 
$RTL_PATH/lib/espi_slave/espi_fifo.sv 
$RTL_PATH/lib/espi_slave/espi_pc_channel.sv 
$RTL_PATH/lib/espi_slave/espi_register.sv 
$RTL_PATH/lib/espi_slave/espi_resp_gen.sv
$RTL_PATH/lib/espi_slave/espi_rx_shifter.sv 
$RTL_PATH/lib/espi_slave/espi_slave.sv 
$RTL_PATH/lib/espi_slave/espi_tx_shifter.sv 
$RTL_PATH/lib/espi_slave/espi_vw_channel.sv

$RTL_PATH/lib/espi_slave/espi_pc_io_short_fsm.sv
$RTL_PATH/lib/espi_slave/espi_pc_mem_short_fsm.sv
$RTL_PATH/lib/espi_slave/espi_pc_short_completion_fsm.sv
$RTL_PATH/lib/espi_slave/espi_pc_put_pc_fsm.sv
$RTL_PATH/lib/espi_slave/espi_vw_gpi_update.sv
$RTL_PATH/lib/espi_slave/espi_pc_put_np_fsm.sv

$RTL_PATH/lib/quartus_ip/i2c_master/i2c_mst/simulation/submodules/altera_avalon_i2c_csr.v
$RTL_PATH/lib/quartus_ip/i2c_master/i2c_mst/simulation/submodules/altera_avalon_i2c_mstfsm.v
$RTL_PATH/lib/quartus_ip/i2c_master/i2c_mst/simulation/submodules/altera_avalon_i2c_rxshifter.v
$RTL_PATH/lib/quartus_ip/i2c_master/i2c_mst/simulation/submodules/altera_avalon_i2c_txshifter.v
$RTL_PATH/lib/quartus_ip/i2c_master/i2c_mst/simulation/submodules/altera_avalon_i2c_spksupp.v
$RTL_PATH/lib/quartus_ip/i2c_master/i2c_mst/simulation/submodules/altera_avalon_i2c_condt_det.v
$RTL_PATH/lib/quartus_ip/i2c_master/i2c_mst/simulation/submodules/altera_avalon_i2c_condt_gen.v
$RTL_PATH/lib/quartus_ip/i2c_master/i2c_mst/simulation/submodules/altera_avalon_i2c.v
$RTL_PATH/lib/quartus_ip/i2c_master/i2c_mst/simulation/i2c_mst.v
$RTL_PATH/lib/quartus_ip/i2c_master/i2c_mst/simulation/submodules/altera_avalon_i2c_txout.v
$RTL_PATH/lib/quartus_ip/i2c_master/i2c_mst/simulation/submodules/altera_avalon_i2c_fifo.v
$RTL_PATH/lib/quartus_ip/i2c_master/i2c_mst/simulation/submodules/altera_avalon_i2c_clk_cnt.v


$RTL_PATH/lib/quartus_ip/i2c_slave/i2c_slave/simulation/submodules/altr_i2c_spksupp.v
$RTL_PATH/lib/quartus_ip/i2c_slave/i2c_slave/simulation/submodules/altera_i2cslave_to_avlmm_bridge.v
$RTL_PATH/lib/quartus_ip/i2c_slave/i2c_slave/simulation/submodules/altr_i2c_condt_det.v
$RTL_PATH/lib/quartus_ip/i2c_slave/i2c_slave/simulation/submodules/altr_i2c_databuffer.v
$RTL_PATH/lib/quartus_ip/i2c_slave/i2c_slave/simulation/submodules/altr_i2c_slvfsm.v
$RTL_PATH/lib/quartus_ip/i2c_slave/i2c_slave/simulation/submodules/altr_i2c_avl_mst_intf_gen.v
$RTL_PATH/lib/quartus_ip/i2c_slave/i2c_slave/simulation/submodules/altr_i2c_txshifter.v
$RTL_PATH/lib/quartus_ip/i2c_slave/i2c_slave/simulation/submodules/altr_i2c_rxshifter.v
$RTL_PATH/lib/quartus_ip/i2c_slave/i2c_slave/simulation/submodules/altr_i2c_txout.v
$RTL_PATH/lib/quartus_ip/i2c_slave/i2c_slave/simulation/submodules/altr_i2c_clk_cnt.v
$RTL_PATH/lib/quartus_ip/i2c_slave/i2c_slave/simulation/i2c_slave.v








$RTL_PATH/lib/LVDS/train_comma_lock_sm.v
$RTL_PATH/lib/LVDS/frame_comma_lock_sm.v
$RTL_PATH/lib/LVDS/frame_loss_sm.v
$RTL_PATH/lib/LVDS/lvds_rx_0/lvds_rx_sim/altera_soft_lvds/altera_soft_lvds_rx_C4QEN.v
$RTL_PATH/lib/LVDS/lvds_tx_0/lvds_tx_sim/altera_soft_lvds/altera_soft_lvds_tx_OX0kT.v
$RTL_PATH/lib/LVDS/lvds_tx_0/lvds_tx_sim/lvds_tx.v
$RTL_PATH/lib/LVDS/lvds_rx_0/lvds_rx_sim/lvds_rx.v
$RTL_PATH/lib/LVDS/8b10b/encode.v
$RTL_PATH/lib/LVDS/8b10b/decode.v
$RTL_PATH/lib/LVDS/8b10b/encoder_8b10b.v
$RTL_PATH/lib/LVDS/8b10b/decoder_8b10b.v
$RTL_PATH/lib/LVDS/smbus_relay_mst.sv
$RTL_PATH/lib/LVDS/smbus_relay_slv.sv
$RTL_PATH/lib/LVDS/async_input_filter.sv
$RTL_PATH/lib/LVDS/checker/lfsr.v
$RTL_PATH/lib/LVDS/checker/lfsr_prbs_gen.v
$RTL_PATH/lib/LVDS/checker/lfsr_prbs_check.v
$RTL_PATH/lib/LVDS/checker/crc8.v
$RTL_PATH/lib/LVDS/dualpFifo/dualpFifo.v
$RTL_PATH/lib/LVDS/lvds_channel_ctrl_agent.v
$RTL_PATH/lib/LVDS/lvds_channel_ctrl_host.v
$RTL_PATH/lib/LVDS/channel_ctrl_top.sv
$RTL_PATH/lib/LVDS/lvds_mm/lvds_mm_slave.v
$RTL_PATH/lib/LVDS/lvds_mm/lvds_mm_ctrl.v
$RTL_PATH/lib/LVDS/lvds_mm/lvds_mm_sm_slave.v
$RTL_PATH/lib/LVDS/lvds_mm/lvds_mm_sm_master.v
$RTL_PATH/lib/LVDS/lvds_mm/lvds_mm_sm_agent.v
$RTL_PATH/lib/LVDS/lvds_mm/lvds_mm_sm_host.v
$RTL_PATH/lib/LVDS/lvds_mm/lvds_mm.v
$RTL_PATH/lib/LVDS/lvds_mm/crc16_dat8.v
$RTL_PATH/lib/LVDS/lvds_mm/xor6.v
$RTL_PATH/lib/LVDS/mcsi_csr.sv
$RTL_PATH/lib/LVDS/ioc_top.sv



$RTL_PATH/lib/rsu_ip/CRC16_D8.v
$RTL_PATH/lib/rsu_ip/CRC8_D8.v
$RTL_PATH/lib/rsu_ip/i2c_slv.sv
$RTL_PATH/lib/rsu_ip/MAX10_REMOTE_UPDATE.v
$RTL_PATH/lib/rsu_ip/RSU_CSR.v
$RTL_PATH/lib/rsu_ip/RSU_WRAPPER.v
$RTL_PATH/lib/rsu_ip/MAX10_FLASH_INTERFACE.v
$RTL_PATH/lib/rsu_ip/RSU_TOP.v
$RTL_PATH/lib/rsu_ip/ram_ip/MAX10_FLASH_INTERFACE_RAM.v
$RTL_PATH/lib/rsu_ip/i2c_fifo_ip/I2C_SLAVE_WR_FIFO.v

$RTL_PATH/lib/plt_logic_common/GlitchFilter.v
$RTL_PATH/lib/plt_logic_common/counter2.v
$RTL_PATH/lib/plt_logic_common/delay.v

$RTL_PATH/lib/AVMM_MUX/avmm_mux_1to2_with_err_report.sv
$RTL_PATH/lib/AVMM_MUX/avmm_mux_1to4.sv
$RTL_PATH/lib/AVMM_MUX/avmm_mux_1to2.sv

$RTL_PATH/lib/plt_logic_common/ngsx.v

$RTL_PATH/lib/plt_logic_common/pca9555.v
$RTL_PATH/lib/plt_logic_common/pca9555io.v
$RTL_PATH/lib/plt_logic_common/master_ngsx.v
$RTL_PATH/lib/plt_logic_common/HeartBeat.v
$RTL_PATH/lib/plt_logic_common/ClkDiv.v
$RTL_PATH/lib/plt_logic_common/EdgeDetector.v

$RTL_PATH/lib/rst_gen/rst_gen.v