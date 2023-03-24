/*
Author:      Marco Antonio Ramirez Zepeda
Email:       marco.a.ramirez.zepeda@intel.com
Title:       Testbench transaction item of Monitor
Description: Class to define the tx item of the monitor for the tiny testbench
             This will contain the information that is collected from the 
             DUT to be sent to the subscriber by the monitor
*/
class tb_seqit_mon extends uvm_sequence_item;
    `uvm_object_utils(tb_seqit_mon)

    logic [15:0] a;
    logic [15:0] b;
    logic [1:0]  ctrl;
    logic [15:0] out;

    //Systemverilog constructor used to create the object out of this class, uses new method from parent class
    function new(string name = "tb_txMon");
        super.new(name);
    endfunction

endclass