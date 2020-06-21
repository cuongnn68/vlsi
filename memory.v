module memory(
    clk,
    rst,
    rd,
    addr_row_w,
    addr_col_w,
    addr_row_r,
    addr_col_r,
    wr,
    cl_pixel,
    sw_pixel_1,
    sw_pixel_2,
    sw_pixel_3,
    sw_pixel_4,
    sw_pixel_5,
    sw_pixel_6,
    sw_pixel_7,
    sw_pixel_8,
    sw_pixel_9
    );

input clk;
input rst;
input rd;
input wr;
input [7:0] addr_row_w;
input [7:0] addr_col_w;
input [7:0] addr_row_r;
input [7:0] addr_col_r;
input [7:0] cl_pixel;

 output reg [7:0] sw_pixel_1;
 output reg [7:0] sw_pixel_2;
 output reg [7:0] sw_pixel_3;
 output reg [7:0] sw_pixel_4;
 output reg [7:0] sw_pixel_5;
 output reg [7:0] sw_pixel_6;
 output reg [7:0] sw_pixel_7;
 output reg [7:0] sw_pixel_8;
 output reg [7:0] sw_pixel_9;

 reg [7:0] n_image [0:257][0:257];
 reg [7:0] f_image [0:255][0:255];

 reg [7:0] addr_pixel_1_col_r;
 reg [7:0] addr_pixel_1_row_r;

 reg [7:0] addr_pixel_1_col_w;
 reg [7:0] addr_pixel_1_row_w;

 reg [7:0] reg_cl_pixel;

//  reg input_rd;
//  reg input_wr;

always @(posedge clk or negedge rst) begin
    if (~rst) begin
         // reset
        sw_pixel_1 <= 0;
        sw_pixel_2 <= 0;
        sw_pixel_3 <= 0;
        sw_pixel_4 <= 0;
        sw_pixel_5 <= 0;
        sw_pixel_6 <= 0;
        sw_pixel_7 <= 0;
        sw_pixel_8 <= 0;
        sw_pixel_9 <= 0;
        addr_pixel_1_row_r <= 0;
        addr_pixel_1_col_r <= 0;
    end else if(rd) begin
        // $display("testing 1");
        addr_pixel_1_row_r <= addr_row_r;
        addr_pixel_1_col_r <= addr_col_r;
        // sw_pixel_1 <= n_image[addr_pixel_1_row_r][addr_pixel_1_col_r];
        // sw_pixel_2 <= n_image[addr_pixel_1_row_r][addr_pixel_1_col_r+1];
        // sw_pixel_3 <= n_image[addr_pixel_1_row_r][addr_pixel_1_col_r+2];
        // sw_pixel_4 <= n_image[addr_pixel_1_row_r+1][addr_pixel_1_col_r];
        // sw_pixel_5 <= n_image[addr_pixel_1_row_r+1][addr_pixel_1_col_r+1];
        // sw_pixel_6 <= n_image[addr_pixel_1_row_r+1][addr_pixel_1_col_r+2];
        // sw_pixel_7 <= n_image[addr_pixel_1_row_r+2][addr_pixel_1_col_r];
        // sw_pixel_8 <= n_image[addr_pixel_1_row_r+2][addr_pixel_1_col_r+1];
        // sw_pixel_9 <= n_image[addr_pixel_1_row_r+2][addr_pixel_1_col_r+2];
    end
end

always@(addr_pixel_1_row_r or addr_pixel_1_col_r) begin
    if(rst) begin
        sw_pixel_1 <= n_image[addr_pixel_1_row_r][addr_pixel_1_col_r];
        sw_pixel_2 <= n_image[addr_pixel_1_row_r][addr_pixel_1_col_r+1];
        sw_pixel_3 <= n_image[addr_pixel_1_row_r][addr_pixel_1_col_r+2];
        sw_pixel_4 <= n_image[addr_pixel_1_row_r+1][addr_pixel_1_col_r];
        sw_pixel_5 <= n_image[addr_pixel_1_row_r+1][addr_pixel_1_col_r+1];
        sw_pixel_6 <= n_image[addr_pixel_1_row_r+1][addr_pixel_1_col_r+2];
        sw_pixel_7 <= n_image[addr_pixel_1_row_r+2][addr_pixel_1_col_r];
        sw_pixel_8 <= n_image[addr_pixel_1_row_r+2][addr_pixel_1_col_r+1];
        sw_pixel_9 <= n_image[addr_pixel_1_row_r+2][addr_pixel_1_col_r+2];
    end
end



always @(posedge clk or negedge rst) begin
    if(rst) 
        if(wr) begin 
            // $display("testing 2");
        addr_pixel_1_row_w <= addr_row_w;
        addr_pixel_1_col_w <= addr_col_w;
        reg_cl_pixel <= cl_pixel;
        // f_image[addr_pixel_1_row_w][addr_pixel_1_col_w] <= reg_cl_pixel;
        end
end

always@(addr_pixel_1_row_w or addr_pixel_1_col_w or reg_cl_pixel) begin
    if(rst)
        f_image[addr_pixel_1_row_w][addr_pixel_1_col_w] <= reg_cl_pixel;
end

//  always @(posedge clk or rst) begin
//      if (~rst) begin
//          // reset
//         sw_pixel_1 <= 0;
//         sw_pixel_2 <= 0;
//         sw_pixel_3 <= 0;
//         sw_pixel_4 <= 0;
//         sw_pixel_5 <= 0;
//         sw_pixel_6 <= 0;
//         sw_pixel_7 <= 0;
//         sw_pixel_8 <= 0;
//         sw_pixel_9 <= 0;
//      end else begin
//         addr_pixel_1_row_r <= addr_row_r;
//         addr_pixel_1_col_r <= addr_col_r;
//         addr_pixel_1_row_w <= addr_row_w;
//         addr_pixel_1_col_w <= addr_col_w;
//         reg_cl_pixel <= cl_pixel;
//         input_rd <= rd;
//         input_wr <= wr;
//          if (input_rd) begin
//             sw_pixel_1 <= n_image[addr_pixel_1_row_r][addr_pixel_1_col_r];
//             sw_pixel_2 <= n_image[addr_pixel_1_row_r][addr_pixel_1_col_r+1];
//             sw_pixel_3 <= n_image[addr_pixel_1_row_r][addr_pixel_1_col_r+2];
//             sw_pixel_4 <= n_image[addr_pixel_1_row_r+1][addr_pixel_1_col_r];
//             sw_pixel_5 <= n_image[addr_pixel_1_row_r+1][addr_pixel_1_col_r+1];
//             sw_pixel_6 <= n_image[addr_pixel_1_row_r+1][addr_pixel_1_col_r+2];
//             sw_pixel_7 <= n_image[addr_pixel_1_row_r+2][addr_pixel_1_col_r];
//             sw_pixel_8 <= n_image[addr_pixel_1_row_r+2][addr_pixel_1_col_r+1];
//             sw_pixel_9 <= n_image[addr_pixel_1_row_r+2][addr_pixel_1_col_r+2];
//          end else if (input_wr) begin
//             f_image[addr_pixel_1_row_w][addr_pixel_1_col_w] <= reg_cl_pixel;
//          end
//      end
//  end





endmodule