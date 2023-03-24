/*
Author:      Marco Antonio Ramirez Zepeda
Email:       marco.a.ramirez.zepeda@intel.com
Title:       Testbench Top Package
Description: Package that contains all the top classes of the testbench
*/
`include "tb_if.sv"

package tb_top_pkg;

    `include "uvm_macros.svh"

    import uvm_pkg::*;
    //parameters created for the plt pwr seq environment
    import tb_para_pkg::*;
    //all classes of plt pwr env
    import tb_pwr_pkg::*;

    `include "tb_env.sv"

endpackage