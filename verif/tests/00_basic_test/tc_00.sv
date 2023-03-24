/*
Author:      Marco Antonio Ramirez Zepeda
Email:       marco.a.ramirez.zepeda@intel.com
Title:       Testbench Testcase 01
Description: Class that is used to run a sequence 
             Contains the enrivonment, the interface config and the user config
*/
class tc_00 extends uvm_test;
    `uvm_component_utils(tc_00)

    string     m_name; //To use name given in "new" function as name in uvm_info
    tb_env     m_env;  //Environment that contains the rest of the objects in the testbench
    tb_if_cfg  m_cfg;  //Contains the virtual interface generated in the testcase
    tb_usr_cfg m_usr_cfg;//User config used to fine tune the testcase, can be randomized

    //Systemverilog constructor used to create the object out of this class, uses new method from parent class
    function new(string name, uvm_component parent);
        super.new(name, parent);
        m_name = name;
    endfunction

    //UVM dedicated function which will be called automatically
    //It is used to get the interface created by tb_top and set it into itf_cfg 
    //o that other components can use it, user config is also created in this phase
    function void build_phase(uvm_phase phase);
        `uvm_info(m_name, "begin build phase", UVM_LOW)

        m_usr_cfg = new();
        
        m_env = tb_env::type_id::create("m_env", this);
        m_cfg = new();

        if(!uvm_config_db#(virtual tb_if)::get(this, "", "dut_if", m_cfg.m_if))
        begin
            `uvm_fatal(m_name, "Could not get interface tc_01")
        end

        uvm_config_db#(tb_if_cfg)::set(this, "*", "m_cfg", m_cfg);
        `uvm_info(m_name, "end build phase", UVM_LOW)
    endfunction

    //UVM defined task which will be called automatically
    //It is used to randomize the user config, create the sequence
    //assign the user config into the sequence and run it
    task run_phase(uvm_phase phase);
        tb_seq m_seq;

        if(!m_usr_cfg.randomize()) //Randomize user configuration
        begin
            `uvm_fatal(m_name, "Randomizing user settings couldnt be possible, exiting")
        end

        m_usr_cfg.test_type = SUM; //Comment this line to make effect of the randomization above

        m_seq = tb_seq::type_id::create("m_seq");//Create tb_seq
        m_seq.test_type = m_usr_cfg.test_type;   //Assign values of user config into sequence

        `uvm_info(m_name, "begin run phase", UVM_LOW)        

        phase.raise_objection(this); //Begin run phase
            #1ms; //Just wait because I feel like it
            m_seq.start(m_env.m_agent.m_seqr); //Start sequence, send the sequencer inside the environment which is connected to the driver
            #1ms; //Just wait because I feel like it
        phase.drop_objection(this); //End run phase
        `uvm_info(m_name, "end run phase", UVM_LOW)
    endtask


endclass