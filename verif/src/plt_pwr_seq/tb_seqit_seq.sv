/*
Author:      Marco Antonio Ramirez Zepeda
Email:       marco.a.ramirez.zepeda@intel.com
Title:       Testbench transaction item of Sequence
Description: Class to define the tx item of the sequence for the tiny testbench
             This will contain the information generated by the sequence
             and get sent to the sequencer to be collected by the driver
             to decode it (if needed) and send it to the DUT
*/
class tb_seqit_seq extends uvm_sequence_item;
    `uvm_object_utils(tb_seqit_seq)

    logic rst;

    randc logic [15:0] a;
    randc logic [15:0] b;
    rand  logic [1:0]  ctrl;
    
    //Systemverilog constructor used to create the object out of this class, uses new method from parent class
    function new(string name = "tb_seqit_seq");
        super.new(name);
    endfunction

endclass