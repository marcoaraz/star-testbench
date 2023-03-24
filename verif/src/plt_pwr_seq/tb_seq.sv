/*
Author:      Marco Antonio Ramirez Zepeda
Email:       marco.a.ramirez.zepeda@intel.com
Title:       Testbench Sequence
Description: Class to define the sequences that the testbench
             can send to the DUT, this information is sent 
             from the sequencer to the driver through a transaction item
*/
class tb_seq extends uvm_sequence;
    `uvm_object_utils(tb_seq)

    string m_name; //To use name given in "new" function as name in uvm_info
    tb_seqit_seq m_tx_seq;//Transaction item that contains the logic that can be sent into the DUT

    test_types_e test_type;//To determine which type of test can be run

    rand logic[15:0] a;
    rand logic[15:0] b;
    rand logic[1:0]  ctrl;

    //Systemverilog constructor used to create the object out of this class, uses new method from parent class
    function new(string name = "tb_seq");
        super.new(name);
        m_name = name;
    endfunction

    //Randomize all values of the transaction item and send them into the driver, repeat 1M times
    task random_sequence();
        repeat(1000000)
        begin
            start_item(m_tx_seq);
            assert(m_tx_seq.randomize());
            finish_item(m_tx_seq); 
            #10;
        end
    endtask

    //Randomize all values of the transaction item and send them into the driver
    //except for control so that it always performs sum operation, repeat 1M times
    task sum_sequence();
        ctrl = 2'b00;
        repeat(1000000)
        begin
            start_item(m_tx_seq);
            assert(m_tx_seq.randomize());
            m_tx_seq.ctrl = ctrl;
            finish_item(m_tx_seq);  
        end
    endtask

    //Randomize all values of the transaction item and send them into the driver
    //except for control so that it always performs substraction operation, repeat 1M times
    task sub_sequence();
        ctrl = 2'b01;
        repeat(1000000)
        begin
            start_item(m_tx_seq);
            assert(m_tx_seq.randomize());
            m_tx_seq.ctrl = ctrl;
            finish_item(m_tx_seq);  
        end
    endtask   

    //Randomize all values of the transaction item and send them into the driver
    //except for control so that it always performs and operation, repeat 1M times
    task and_sequence();
        ctrl = 2'b10;
        repeat(1000000)
        begin
            start_item(m_tx_seq);
            assert(m_tx_seq.randomize());
            m_tx_seq.ctrl = ctrl;
            finish_item(m_tx_seq);  
        end
    endtask 

    //Randomize all values of the transaction item and send them into the driver
    //except for control so that it always performs or operation, repeat 1M times
    task or_sequence();
        ctrl = 2'b11;
        repeat(1000000)
        begin
            start_item(m_tx_seq);
            assert(m_tx_seq.randomize());
            m_tx_seq.ctrl = ctrl;
            finish_item(m_tx_seq);  
        end
    endtask   

    //This is what will be called in the testcase
    task body();
        m_tx_seq = tb_seqit_seq::type_id::create("m_tx_seq"); //Create transaction item
        `uvm_info(m_name, "begin sequence", UVM_LOW)
        case(test_type)//test_type is sent by the testcase and is used to determine which sequence to run
            RANDOM:
            begin
                random_sequence();
            end
            SUM:
            begin
                sum_sequence();
            end
            SUB:
            begin
                sub_sequence();
            end
            AND:
            begin
                and_sequence();
            end
            OR:
            begin
                or_sequence();
            end
            default:
            begin
                random_sequence();
            end
        endcase
        `uvm_info(m_name, "end sequence", UVM_LOW) 
    endtask

endclass