module tb_memory();

    reg clk;
    reg rst;
    reg rd;
    reg wr;
    reg [7:0] addr_row_w;
    reg [7:0] addr_col_w;
    reg [7:0] addr_row_r;
    reg [7:0] addr_col_r;
    reg [7:0] cl_pixel;

    wire [7:0] sw_pixel_1;
    wire [7:0] sw_pixel_2;
    wire [7:0] sw_pixel_3;
    wire [7:0] sw_pixel_4;
    wire [7:0] sw_pixel_5;
    wire [7:0] sw_pixel_6;
    wire [7:0] sw_pixel_7;
    wire [7:0] sw_pixel_8;
    wire [7:0] sw_pixel_9;

    reg [7:0] f_image_res [0:255][0:255];

    memory DUT(
        .clk(clk),
        .rst(rst),
        .rd(rd),
        .addr_row_w(addr_row_w),
        .addr_col_w(addr_col_w),
        .addr_row_r(addr_row_r),
        .addr_col_r(addr_col_r),
        .wr(wr),
        .cl_pixel(cl_pixel),
        .sw_pixel_1(sw_pixel_1),
        .sw_pixel_2(sw_pixel_2),
        .sw_pixel_3(sw_pixel_3),
        .sw_pixel_4(sw_pixel_4),
        .sw_pixel_5(sw_pixel_5),
        .sw_pixel_6(sw_pixel_6),
        .sw_pixel_7(sw_pixel_7),
        .sw_pixel_8(sw_pixel_8),
        .sw_pixel_9(sw_pixel_9)
    );

    initial begin
        $readmemh("D:\\gd\\_tai_lieu\\5_4_ki_2\\VLSI\\btl-vlsi\\fckup\\padded_image.txt", DUT.n_image);
        // $readmemh("D:\\gd\\_tai_lieu\\5_4_ki_2\\VLSI\\btl-vlsi\\fckup\\filter_image.txt", f_image_res);
        // $display("%h",f_image_res[2][2]);
        // $display("%h",f_image_res[2][2]);
    end

    initial begin
        clk = 0;
        rst = 0;
        rd = 0;
        wr = 0;
        #5
        rst = 5;
    end

    initial begin
        forever #10 clk = ~clk;
    end

    initial begin
        addr_row_w = 6;
        addr_col_w = 9;
        addr_row_r = 1;
        addr_col_r = 3;
        cl_pixel = 24;
    end

    initial begin 
        #25
        rd = 1;
        wr = 1;
        #10
        $display("f_image: %h",DUT.f_image[addr_row_w][addr_col_w]);
        $display("cl_pixel: %h",cl_pixel);
        if(DUT.f_image[addr_row_w][addr_col_w] !== cl_pixel) begin
            $display("loi phan ghi");
        end 
        $display("sw_pixel_1: %h", sw_pixel_1);
        $display("n_image: %h", DUT.n_image[addr_row_r][addr_col_r]);
        if(sw_pixel_1 !== DUT.n_image[addr_row_r][addr_col_r]) begin
            $display("loi phan doc");
        end
    end

endmodule