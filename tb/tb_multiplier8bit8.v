module tb_multiplier8bit8 ();
    reg clk;
    reg rst;

    reg [7:0] op1,op2;
    wire [15:0] res;

    multiplier8bit16 DUT(
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
        op1 = 8'b11111111;
        op2 = 8'b11111111;
        #20
        $display("res = %b", res);
        // if(res != 8'b01101101) begin
        //     $display(" ket qua sai");
        // end
    end


endmodule