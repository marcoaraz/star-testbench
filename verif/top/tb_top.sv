/*
Author:      Marco Antonio Ramirez Zepeda
Email:       marco.a.ramirez.zepeda@intel.com
Title:       Testbench Top
Description: Top module of the entire testbench
             It creates the wrapper, sends the interface into it
             Creates the clock, puts DUT out of reset, initializes DUT
             and calls the testcase given in console to start running it
*/
`include "uvm_macros.svh"

module tb_top;

    import uvm_pkg::*;

    tb_if dut_if(); //Main interface of the entire testbench

    tb_wrapper dut( //Wrapper that connects DUT and Testbench
            .m_if(dut_if)
    );

    initial
    begin
        //initial values of clock and reset
        dut_if.clk = 1'b0;
        dut_if.rst = 1'b0;
    end

    initial 
    begin //Initial inputs of the DUT to avoid metadata
        dut_if.initInputs();    
    end

    initial 
    begin
        forever 
        begin
            //clock generation   
            #0.25;
            dut_if.clk = ~dut_if.clk; 
        end    
    end

    initial
    begin
        //reset assertion
        repeat(5000) 
        begin //simulate pll_locked of fpga
            @(posedge dut_if.clk);
        end
        dut_if.rst = 1'b1;
    end

    initial
    begin//Set the interface into the database so that it can be obtained from other components
        uvm_config_db#(virtual tb_if)::set(null, "*", "dut_if", dut_if);
    end

    initial 
    begin//Run test given in the console
        run_test();    
    end

endmodule