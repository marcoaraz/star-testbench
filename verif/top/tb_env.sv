/*
Author:      Marco Antonio Ramirez Zepeda
Email:       marco.a.ramirez.zepeda@intel.com
Title:       Testbench Environment
Description: Class to define the environment for the tiny testbench
             This will hold the specified agent and subscriber for the required coverage
*/
class tb_env extends uvm_env;
    `uvm_component_utils(tb_env)

    string   m_name;  //To use name given in "new" function as name in uvm_info
    tb_agent m_agent; //Agent that holds the platform monitor and general driver
    tb_sub   m_sub;   //Subscriber that takes data sent from monitor to generate functional coverage

    //Systemverilog constructor used to create the object out of this class, uses new method from parent class
    function new(string name, uvm_component parent);
        super.new(name, parent);
        m_name = name;
    endfunction

    //UVM dedicated function which will be called automatically
    //It is used to create the instances of the agent and subscriber 
    function void build_phase(uvm_phase phase);
        `uvm_info(m_name, "begin build phase", UVM_LOW)
        m_agent = tb_agent::type_id::create("m_agent", this);
        m_sub   = tb_sub::type_id::create("m_sub", this);
        `uvm_info(m_name, "end build phase", UVM_LOW)
    endfunction

    //UVM defined function which will be called automatically
    //It is used to connect the agent's analysis port
    //with the subscriber analysis export
    function void connect_phase(uvm_phase phase);
        `uvm_info(m_name, "begin connect phase", UVM_LOW)
        m_agent.mon_port.connect(m_sub.analysis_export);
        `uvm_info(m_name, "end connect phase", UVM_LOW)
    endfunction

endclass