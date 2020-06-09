module controller(
    clk,
    rst,
    en,
    act,
    rd,
    wr,
    addr_row_w,
    addr_col_w,
    addr_row_r,
    addr_col_r
    );


input clk;
input rst;
input en;

 output reg act; 
 output reg rd;
 output reg wr;
 output reg [7:0] addr_row_w;
 output reg [7:0] addr_col_w;
 output reg [7:0] addr_row_r;
 output reg [7:0] addr_col_r;

reg working;

integer count;

always @(posedge clk or negedge rst) begin
    if(~rst) begin
        act <= 0;
        rd <= 0;
        wr <= 0;
        addr_row_r <= 0;
        addr_col_r <= 0;
        addr_row_w <= 0;
        addr_row_w <= 0;
        count = 0;
    end else begin
        if(en) begin
            act <= 0;
            rd <= 1;
            wr <= 0;
            addr_row_r <= 0;
            addr_col_r <= 0;
            addr_row_w <= 0;
            addr_col_w <= 0;
            working <= 1;
        end else if(working) begin
            addr_col_r = addr_col_r + 1;
            if(addr_col_r>7) begin
                addr_col_r <= 0;
                addr_row_r <= addr_row_r +1;
            end
            count = count + 1;
            if(count == 1) begin
                act <= 1;
            end else if(count == 9) begin
                wr <= 1;
            end else if (count == 256*256) begin
                rd <= 0;
            end else if (count == 256*256+1) begin
                act <= 0;
            end else if(count == 256*256+9) begin
                wr <= 0;
                working <= 0;
            end
        end
    end
end


endmodule