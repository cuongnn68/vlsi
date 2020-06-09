module divider16bi8 (
    clk,
    rst,
    op1,
    op2,
    res
);


input clk;
input rst;
input [15:0] op1;
input [7:0] op2;

output reg [7:0] res;

reg [15:0] o1;
reg [7:0] o2;

always@(posedge clk or negedge rst) begin
    if(~rst) begin
        {o1,o2,res} <= 0;
    end
    begin
        o1 <= op1;
        o2 <= op2;
        res <= o1/o2 ;
    end
end

endmodule