module adder9x #(parameter N = 8) (
    clk,
    rst,
    op1,
    op2,
    op3,
    op4,
    op5,
    op6,
    op7,
    op8,
    op9,
    res
);

input clk;
input rst;

input [N-1:0] op1;
input [N-1:0] op2;
input [N-1:0] op3;
input [N-1:0] op4;
input [N-1:0] op5;
input [N-1:0] op6;
input [N-1:0] op7;
input [N-1:0] op8;
input [N-1:0] op9;

output reg  [N-1:0] res;

reg [2*N-1:0] reg_op1;
reg [2*N-1:0] reg_op2;
reg [2*N-1:0] reg_op3;
reg [2*N-1:0] reg_op4;
reg [2*N-1:0] reg_op5;
reg [2*N-1:0] reg_op6;
reg [2*N-1:0] reg_op7;
reg [2*N-1:0] reg_op8;
reg [2*N-1:0] reg_op9;

always @(posedge clk or negedge rst) begin
    if(~rst) begin
        reg_op1 <= 0;
        reg_op2 <= 0;
        reg_op3 <= 0;
        reg_op4 <= 0;
        reg_op5 <= 0;
        reg_op6 <= 0;
        reg_op7 <= 0;
        reg_op8 <= 0;
        reg_op9 <= 0;
        res <= 0;
    end else begin
        reg_op1[N-1:0] <= op1;
        reg_op2[N-1:0] <= op2;
        reg_op3[N-1:0] <= op3;
        reg_op4[N-1:0] <= op4;
        reg_op5[N-1:0] <= op5;
        reg_op6[N-1:0] <= op6;
        reg_op7[N-1:0] <= op7;
        reg_op8[N-1:0] <= op8;
        reg_op9[N-1:0] <= op9;
        // res <= (reg_op1 
        //         + reg_op2
        //         + reg_op3
        //         + reg_op4
        //         + reg_op5
        //         + reg_op6
        //         + reg_op7
        //         + reg_op8
        //         + reg_op9) >> 2;
    end
end

always @(   reg_op1 or reg_op2 or reg_op3 or reg_op4 or 
            reg_op5 or reg_op6 or reg_op7 or reg_op8 or reg_op9) begin
                res <= (reg_op1 + reg_op2+ reg_op3+ reg_op4
                        + reg_op5+ reg_op6+ reg_op7+ reg_op8+ reg_op9) 
                        >> 4;
            end

endmodule