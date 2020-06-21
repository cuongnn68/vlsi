module top_level(
    clk,
    rst,
    en
);

input clk, rst, en;


wire act; 
wire rd;
wire wr;
wire [7:0] addr_row_w;
wire [7:0] addr_col_w;
wire [7:0] addr_row_r;
wire [7:0] addr_col_r;

wire [7:0] cl_pixel;

wire [7:0] sw_pixel_1;
wire [7:0] sw_pixel_2;
wire [7:0] sw_pixel_3;
wire [7:0] sw_pixel_4;
wire [7:0] sw_pixel_5;
wire [7:0] sw_pixel_6;
wire [7:0] sw_pixel_7;
wire [7:0] sw_pixel_8;
wire [7:0] sw_pixel_9;

    controller controller(
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
    memory memory(
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
    filter filter(
        clk,
        rst,
        act,
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

endmodule