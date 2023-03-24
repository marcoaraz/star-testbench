/*
Author:      Marco Antonio Ramirez Zepeda
Email:       marco.a.ramirez.zepeda@intel.com
Title:       Testbench Parameter Package
Description: Package used to define values that are used across the testbench
*/
package tb_para_pkg;

    `include "uvm_macros.svh"

    import uvm_pkg::*;

    //Used by user config, as well as sequence and testcase to define which type of sequence
    //will be run by the testbench
    typedef enum logic [2:0] {RANDOM = 0, SUM = 1, SUB = 2, AND = 3, OR= 4} test_types_e;

endpackage