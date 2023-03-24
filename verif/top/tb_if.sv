/*
Author:      Marco Antonio Ramirez Zepeda
Email:       marco.a.ramirez.zepeda@intel.com
Title:       Testbench Interface
Description: Interface that contains logic values that will be driven by
             by the testbench; these values are connected to the DUT in the wrapper
*/
import tb_para_pkg::*;

interface tb_if;

    logic clk;
    logic rst;
    logic[15:0] a;
    logic[15:0] b;
    logic[1:0]  ctrl;
    logic[15:0] out;

    //Called by tb_top to define initial values for the DUT's inputs
    task initInputs();
        a    = 'd0;
        b    = 'd0;
        ctrl = 'd0;
    endtask

endinterface