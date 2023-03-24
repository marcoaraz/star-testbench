/*
Author:      Marco Antonio Ramirez Zepeda
Email:       marco.a.ramirez.zepeda@intel.com
Title:       Testbench Interface Configuration
Description: Class to define a virtual interface
             It will be assigned the "real" interface in the testcase
             and then, using "set" method it will be stored in the UVM
             database so that components across the tesbench have access
             to the "real" interface through this class
*/
class tb_if_cfg extends uvm_object;
    `uvm_object_utils(tb_if_cfg)

    virtual tb_if m_if;

endclass