/*
Author:      Marco Antonio Ramirez Zepeda
Email:       marco.a.ramirez.zepeda@intel.com
Title:       Testbench Tests Package
Description: Package that contains all the testcases classes
*/
package tb_test_pkg;

    `include "uvm_macros.svh"

    import uvm_pkg::*;
    import tb_para_pkg::*;
    import tb_pwr_pkg::*;
    import tb_top_pkg::*;

    `include "00_basic_test/tc_00.sv"

endpackage