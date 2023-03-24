/*
Author:      Marco Antonio Ramirez Zepeda
Email:       marco.a.ramirez.zepeda@intel.com
Title:       Testbench Monitor
Description: Class to define the monitor for the tiny testbench
             This will collect the information from the DUT's
             internal and external signals and send that info into 
             the subscriber for functional coverage
*/
class tb_mon extends uvm_monitor;
    `uvm_component_utils(tb_mon)

    string m_name; //To use name given in "new" function as name in uvm_info
    //Analysis port to connect monitor with subscriber
    //Uses transaction item tb_seqit_mon
    uvm_analysis_port #(tb_seqit_mon) mon_port;
    tb_if_cfg     m_cfg; //Contains the virtual interface generated in the testcase
    virtual tb_if m_if;  //Virtual interface to use in this class

    //Systemverilog constructor used to create the object out of this class, uses new method from parent class
    function new(string name, uvm_component parent);
        super.new(name, parent);
        m_name = name;
    endfunction

    //UVM dedicated function which will be called automatically
    //It is used to get the virtual interface and assign it to a local interface for monitoring
    function void build_phase(uvm_phase phase);
        `uvm_info(m_name, "begin build phase", UVM_LOW)

        mon_port = new("mon_port", this);

        //UVM method to get the interface set in the testcase which contains the general interface's info
        if(!uvm_config_db#(tb_if_cfg)::get(this, "", "m_cfg", m_cfg))
        begin
            `uvm_fatal(m_name, "Could not get interface")
        end

        //Assign that interface into local interface to monitor the signals
        m_if = m_cfg.m_if;
        `uvm_info(m_name, "end build phase", UVM_LOW)
    endfunction

    //UVM defined task which will be called automatically
    //It is used to get the information from the interface
    //and assign it to the monitor's transaction item
    //information that will be consumed by subscriber
    task run_phase(uvm_phase phase);
        tb_seqit_mon m_txMon;

        `uvm_info(m_name, "begin run phase", UVM_LOW) 
        m_txMon = tb_seqit_mon::type_id::create("m_txMon", this);

        forever 
        begin
            @(negedge m_if.clk);//Wait until negedge of clock for data to be stable
            m_txMon.a    = m_if.a; //Assign data into the monitor's transaction item
            m_txMon.b    = m_if.b;
            m_txMon.ctrl = m_if.ctrl;
            m_txMon.out  = m_if.out;

            mon_port.write(m_txMon); //Send the data through the analysis port
        end
        `uvm_info(m_name, "end run phase", UVM_LOW) 
    endtask

endclass