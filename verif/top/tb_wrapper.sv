module tb_wrapper(
        tb_if m_if
    );

    alu alu_dut(
        .clk  (m_if.clk),
        .rst  (m_if.rst),
        .a    (m_if.a),
        .b    (m_if.b),
        .ctrl (m_if.ctrl),
        .out  (m_if.out)
    );
endmodule