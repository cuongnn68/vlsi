module tb_sub_abs_sub();
    reg clk,rst;
    reg [7:0] op1,op2;
    wire [7:0] res;

    sub_abs_sub DUT(
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
        rst = 1;
    end

    initial begin
        forever #10 clk = ~clk;
    end

    initial begin
        #35
        op1 = 123;
        op2 = 200;
        #10
        $display("res = %b", res);
        // if(res != 8'b01101101) begin
        //     $display(" ket qua sai");
        // end
    end



endmodule