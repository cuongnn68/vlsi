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

// reg [7:0] next_addr_row_w;
// reg [7:0] next_addr_col_w;
// reg [7:0] next_addr_row_r;
// reg [7:0] next_addr_col_r;

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
        addr_col_w <= 0;
        // next_addr_row_w <= 0;
        // next_addr_col_w <= 0;
        // next_addr_row_r <= 0;
        // next_addr_col_r <= 0;
        working <= 0;
        count <= 0;
    end else begin
        if(en) begin
            count <= 0;
            act <= 0;
            rd <= 1;
            wr <= 0;
            addr_row_r <= 0;
            addr_col_r <= 0;
            addr_row_w <= 0;
            addr_col_w <= 0;
            // next_addr_row_w <= 0;
            // next_addr_col_w <= 1;
            // next_addr_row_r <= 0;
            // next_addr_col_r <= 1;
            working <= 1;
        end else if(working == 1) begin
            count <= count + 1;
        end
    end
end

always @(count)begin
    if(working && ~en && rst) begin
        if(count == 1) begin
            act <= 1;
        end
        if(count == 8) begin
            wr <= 1;
        end
        if(count == 256*256) begin
            rd <= 0;
        end
        if(count == 256*256+1) begin
            act <= 0;
        end
        
        if(count == 8 + 256*256) begin
            wr <= 0;
            working <= 0;
        end
        if(count>=1 && count<=(256*256)) begin //rd
            if(addr_col_r == 255) begin
                addr_row_r <= addr_row_r + 1;
                addr_col_r <= 0;
            end else begin
                addr_col_r <= addr_col_r + 1;
            end
            // addr_row_r;
            // addr_col_r;
        end
        if(count>=9 && count<=(256*256 + 8)) begin //wr
            if(addr_col_w == 255) begin
                addr_col_w <= 0;
                addr_row_w <= addr_row_w + 1;
            end else begin
                addr_col_w <= addr_col_w + 1;
            end
            // addr_row_w;
            // addr_col_w;
        end
    end
end

endmodule