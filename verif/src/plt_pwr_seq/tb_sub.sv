/*
Author:      Marco Antonio Ramirez Zepeda
Email:       marco.a.ramirez.zepeda@intel.com
Title:       Testbench Subscriber
Description: Class to define the subscriber for the tiny testbench
             This will generate the functional coverage of the testbench
*/
class tb_sub extends uvm_subscriber #(tb_seqit_mon);
    `uvm_component_utils(tb_sub)

    string m_name;  //To use name given in "new" function as name in uvm_info

    logic[15:0] input_a; //To collect information of DUT's input a
    logic[15:0] input_b; //To collect information of DUT's input b
    logic[1:0]  input_ctrl; //To collect information of DUT's input control
    logic[15:0] output_out; //To collect information of DUT's output
    
    //Covergroup for the DUT's inputs
    covergroup inputs;
        coverpoint input_a;
        coverpoint input_b;
        coverpoint input_ctrl;
    endgroup

    //Covergroup for the DUT's output
    covergroup outputs;
        coverpoint output_out;
    endgroup

    //Systemverilog constructor used to create the object out of this class, uses new method from parent class
    function new(string name, uvm_component parent);
        super.new(name, parent);
        m_name  = name;
        inputs  = new();
        outputs = new();
    endfunction

    //UVM defined function which will be called automatically
    //It is used to take information from the monitor's transaction item
    //assign it to internal variables inside the covergroups and then sample
    //the covergroups
    function void write(tb_seqit_mon t);
        input_a    = t.a;
        input_b    = t.b;
        input_ctrl = t.ctrl;
        output_out = t.out;

        inputs.sample();
        outputs.sample();
    endfunction
    
endclass