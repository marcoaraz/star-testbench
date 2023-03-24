/*
Author:      Marco Antonio Ramirez Zepeda
Email:       marco.a.ramirez.zepeda@intel.com
Title:       Testbench Agent
Description: Class to define the agent for the tiny testbench
             This will hold the specified driver to drive the signals to the DUT.
             and the monitor to collect signals from the DUT
*/
class tb_agent extends uvm_agent;
    `uvm_component_utils(tb_agent)

    string    m_name;   //To use name given in "new" function as name in uvm_info
    tb_seqr   m_seqr;   //Takes the info from tb_seq and sends it to the driver
    tb_driver m_driver; //Send the information from the testbench to the DUT
    tb_mon    m_mon;    //Collects info from DUT to send to subscriber

    //Analysis port to connect monitor with subscriber
    //Uses transaction item tb_txMon
    uvm_analysis_port#(tb_txMon) mon_port; 

    //Systemverilog constructor used to create the object out of this class, uses new method from parent class
    function new(string name, uvm_component parent);
        super.new(name, parent);
        m_name = name;
    endfunction

    //UVM dedicated function which will be called automatically
    //It is used to create the instances of the monitor port, sequencer, driver and monitor
    function void build_phase(uvm_phase phase);
        `uvm_info(m_name, "begin build phase", UVM_LOW)
        mon_port = new("mon_port", this);
        m_seqr   = tb_seqr::type_id::create("m_seqr", this);
        m_driver = tb_driver::type_id::create("m_driver", this);
        m_mon    = tb_mon::type_id::create("m_mon", this);
        `uvm_info(m_name, "end build phase", UVM_LOW)
    endfunction

    //UVM defined function which will be called automatically
    //It is used to connect the driver's sequence item port
    //with the sequencer sequence item export, as well as connecting
    //the agent's analysis port with the monitor analysis export
    function void connect_phase(uvm_phase phase);
        `uvm_info(m_name, "begin connect phase", UVM_LOW)
        m_driver.seq_item_port.connect(m_seqr.seq_item_export);
        m_mon.mon_port.connect(mon_port);
        `uvm_info(m_name, "end connect phase", UVM_LOW)
    endfunction


endclass