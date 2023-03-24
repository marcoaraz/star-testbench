/*
Author:      Marco Antonio Ramirez Zepeda
Email:       marco.a.ramirez.zepeda@intel.com
Title:       Testbench Driver
Description: Class to define the driver for the tiny testbench
             This will take the information sent drom the sequencer
             and use that information to send values into the DUT
             Uses tb_seqit_seq transaction item
*/
class tb_driver extends uvm_driver#(tb_seqit_seq);
    `uvm_component_utils(tb_driver)

    string        m_name; //To use name given in "new" function as name in uvm_info
    tb_if_cfg     m_cfg;  //Contains the virtual interface generated in the testcase
    virtual tb_if m_if;   //Virtual interface to use in this class

    //Systemverilog constructor used to create the object out of this class, uses new method from parent class
    function new(string name, uvm_component parent);
        super.new(name, parent);
        m_name = name;
    endfunction

    //UVM dedicated function which will be called automatically
    //It is used to get the virtual interface and assign it to a local interface for driving   
    function void build_phase(uvm_phase phase);
        `uvm_info(m_name, "begin build phase", UVM_LOW)

        //UVM method to get the interface set in the testcase which contains the general interface's info
        if(!uvm_config_db#(tb_if_cfg)::get(this, "", "m_cfg", m_cfg))
        begin
            `uvm_fatal(m_name, "Could not get interface")
        end

        //Assign that interface into local interface to drive the signals
        m_if = m_cfg.m_if;
        `uvm_info(m_name, "end build phase", UVM_LOW)
    endfunction

    //task used to send info to the DUT
    task driver(logic[15:0] a, logic[15:0] b, logic[1:0] ctrl);
        m_if.a    = a;
        m_if.b    = b;
        m_if.ctrl = ctrl;
    endtask

    //Task used to print the values sent by the driver into the log file
    task print_values(logic[15:0] a, logic[15:0] b, logic[1:0] ctrl);
        `uvm_info(m_name, $sformatf("Sending a as %0d", a), UVM_LOW)
        `uvm_info(m_name, $sformatf("Sending b as %0d", a), UVM_LOW)
        `uvm_info(m_name, $sformatf("Sending ctrl as %0d", a), UVM_LOW)
    endtask

    //UVM defined task which will be called automatically
    //It is used to get the sequence item from the sequencer
    //Decode that information (if needed) and call tasks to
    //send information into the DUT   
    task run_phase(uvm_phase phase);
        tb_seqit_seq m_tx_seq;

        `uvm_info(m_name, "begin run phase", UVM_LOW) 
        forever 
        begin
            @(posedge m_if.clk); //Wait until next posedge of clock
            seq_item_port.get_next_item(m_tx_seq); //Get next item from driver's sequence port
            `uvm_info(m_name, "transaction received", UVM_DEBUG)

            if(m_tx_seq.rst) //If a reset is signaled in sequence, send it to the DUT
            begin
                `uvm_info(m_name, "Generating a reset", UVM_LOW)
                m_if.rst = 1'b0;
                m_if.initInputs;//Initial inputs of the DUT, task defined in interface
            end
            else
            begin
                m_if.rst = 1'b1; //if not reset signaled, keep it as 1
                driver(m_tx_seq.a, m_tx_seq.b, m_tx_seq.ctrl); //Send the info from the transaction item to the DUT
                //print_values(m_tx_seq.a, m_tx_seq.b, m_tx_seq.ctrl); //Commented because it generated too much info in log file
            end

            @(posedge m_if.clk);//Wait until next posedge of clock to finish
            seq_item_port.item_done();//Release sequence item port to collect new information
        end
        `uvm_info(m_name, "end run phase", UVM_LOW)
    endtask

endclass