/*
Author:      Marco Antonio Ramirez Zepeda
Email:       marco.a.ramirez.zepeda@intel.com
Title:       Testbench Package
Description: Package that contains all classes of the DUT
             Here the sequencer is defined
             Used to ease the process of compilation/update
*/
`include "tb_if.sv"

package tb_pwr_pkg;

    `include "uvm_macros.svh"

    import uvm_pkg::*;
    import tb_para_pkg::*;

    `include "tb_usr_cfg.sv"
    `include "tb_if_cfg.sv"
    
    `include "tb_seqit_mon.sv"
    `include "tb_seqit_seq.sv"
    //UVM sequencer used to send information from sequence(s) to driver
    //Uses transaction item tb_txSeq
    typedef uvm_sequencer #(tb_seqit_seq) tb_seqr;
    `include "tb_seq.sv"

    `include "tb_sub.sv"
    `include "tb_mon.sv"
    `include "tb_driver.sv"
    `include "tb_agent.sv"

endpackage