module tb_divider16bit8();
    reg clk;
    reg rst;
    reg [15:0] op1;
    reg [7:0] op2;
    wire [7:0] res;


    divider16bit8 DUT(
        .clk(clk),
        .rst(rst),
        .op1(op1),
        .op2(op2),
        .res(res)
    );

    initial begin
        clk = 0;
        rst = 0;
        #5
        rst = 5;
    end
    initial begin
        forever #10 clk = ~clk;
    end
    initial begin
        op1 = 16'h1111;
        op2 = 8'hAA;
        // op1 = 0;
        // op2 = 0;
        #15
        $display("res = %b",res);
    end

endmodule