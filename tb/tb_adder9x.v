module tb_adder9x();
    reg clk;
    reg rst;
    
    parameter N = 8;
    reg [N-1:0] op1;
    reg [N-1:0] op2;
    reg [N-1:0] op3;
    reg [N-1:0] op4;
    reg [N-1:0] op5;
    reg [N-1:0] op6;
    reg [N-1:0] op7;
    reg [N-1:0] op8;
    reg [N-1:0] op9;

    wire [N-1:0] res;

    adder9x #(N) DUT(
        .clk(clk),
        .rst(rst),
        .op1(op1),
        .op2(op2),
        .op3(op3),
        .op4(op4),
        .op5(op5),
        .op6(op6),
        .op7(op7),
        .op8(op8),
        .op9(op9),
        .res(res)
    );
    
    initial begin
        clk = 0;
        rst = 0;
        #5
        rst = 1;
    end
    initial begin
        forever #10 clk = ~clk;
    end

    initial begin
        op1 = 8'b11111111;
        op2 = 8'b11111111;
        op3 = 8'b11111111;
        op4 = 8'b11111111;
        op5 = 8'b11111111;
        op6 = 8'b11111111;
        op7 = 8'b11111111;
        op8 = 8'b11111111;
        op9 = 8'b11111111;
        #15
        $display("res = %b", res);
    end

endmodule