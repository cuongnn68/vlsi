module tb_controller();
reg clk;
reg rst;
reg en;

wire act; 
wire rd;
wire wr;
wire [7:0] addr_row_w;
wire [7:0] addr_col_w;
wire [7:0] addr_row_r;
wire [7:0] addr_col_r;

controller DUT(
    .clk(clk),
    .rst(rst),
    .en(en),
    .act(act),
    .rd(rd),
    .wr(wr),
    .addr_row_w(addr_row_w),
    .addr_col_w(addr_col_w),
    .addr_row_r(addr_row_r),
    .addr_col_r(addr_col_r)
);

initial begin
    en = 0;
    clk = 0;
    rst = 0;
    #5
    rst = 1;
    #60
    en = 1;
    #20
    en = 0;    
end

initial begin
    forever #10 clk = ~clk;
end

endmodule