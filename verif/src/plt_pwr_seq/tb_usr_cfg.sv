/*
Author:      Marco Antonio Ramirez Zepeda
Email:       marco.a.ramirez.zepeda@intel.com
Title:       Testbench User Configuration
Description: Class to define values in a specific testcase
             Can be randomized or fine tuned by the user to make
             the testbench do specific sequences
*/
class tb_usr_cfg extends uvm_object;
    `uvm_object_utils(tb_usr_cfg)

    string m_name;

    //Type of test that is run by the testcase, can be randomized
    rand test_types_e test_type;

    //This is a constraint of the randomization of test_type so that it falls 
    //within a wanted set of values
    constraint cTest_type{
        test_type inside {[RANDOM:OR]};
    }

    //Systemverilog constructor used to create the object out of this class
    function new(string name = "tb_usr_cfg");
        m_name = name;
    endfunction

endclass