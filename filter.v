module filter(
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

input clk, rst, act;

input [7:0] sw_pixel_1;
input [7:0] sw_pixel_2;
input [7:0] sw_pixel_3;
input [7:0] sw_pixel_4;
input [7:0] sw_pixel_5;
input [7:0] sw_pixel_6;
input [7:0] sw_pixel_7;
input [7:0] sw_pixel_8;
input [7:0] sw_pixel_9;

output [7:0] cl_pixel;


wire [7:0] c1_s1s2, c2_s1s2, c3_s1s2, c4_s1s2, c5_s1s2, c6_s1s2, c7_s1s2, c8_s1s2, c9_s1s2;
wire [7:0] p1_s1s2, p2_s1s2, p3_s1s2, p4_s1s2, p5_s1s2, p6_s1s2, p7_s1s2, p8_s1s2, p9_s1s2;

wire [7:0] c1_s2s3, c2_s2s3, c3_s2s3, c4_s2s3, c5_s2s3, c6_s2s3, c7_s2s3, c8_s2s3, c9_s2s3;
wire [7:0] p1_s2s3, p2_s2s3, p3_s2s3, p4_s2s3, p5_s2s3, p6_s2s3, p7_s2s3, p8_s2s3, p9_s2s3;

wire [7:0] c1_s3s4, c2_s3s4, c3_s3s4, c4_s3s4, c5_s3s4, c6_s3s4, c7_s3s4, c8_s3s4, c9_s3s4;
wire [7:0] p1_s3s4, p2_s3s4, p3_s3s4, p4_s3s4, p5_s3s4, p6_s3s4, p7_s3s4, p8_s3s4, p9_s3s4;

wire [7:0] c1_s4s5, c2_s4s5, c3_s4s5, c4_s4s5, c5_s4s5, c6_s4s5, c7_s4s5, c8_s4s5, c9_s4s5;
wire [7:0] p1_s4s5, p2_s4s5, p3_s4s5, p4_s4s5, p5_s4s5, p6_s4s5, p7_s4s5, p8_s4s5, p9_s4s5;

wire [7:0] c1_s5s6,c2_s5s6,c3_s5s6,c4_s5s6,c5_s5s6,c6_s5s6,c7_s5s6,c8_s5s6,c9_s5s6;
wire [15:0] cp1_s5s6,cp2_s5s6,cp3_s5s6,cp4_s5s6,cp5_s5s6,cp6_s5s6,cp7_s5s6,cp8_s5s6,cp9_s5s6;

wire [15:0] a_s6s7;
wire [7:0] b_s6s7;

    stage1 s1(
        clk,
        rst,
        act,
        sw_pixel_1,
        sw_pixel_2,
        sw_pixel_3,
        sw_pixel_4,
        sw_pixel_5,
        sw_pixel_6,
        sw_pixel_7,
        sw_pixel_8,
        sw_pixel_9,
        c1_s1s2, c2_s1s2, c3_s1s2, c4_s1s2, c5_s1s2, c6_s1s2, c7_s1s2, c8_s1s2, c9_s1s2,
        p1_s1s2, p2_s1s2, p3_s1s2, p4_s1s2, p5_s1s2, p6_s1s2, p7_s1s2, p8_s1s2, p9_s1s2
    );
    stage2_3_4 s2(
        clk,
        rst,
        c1_s1s2, c2_s1s2, c3_s1s2, c4_s1s2, c5_s1s2, c6_s1s2, c7_s1s2, c8_s1s2, c9_s1s2,
        p1_s1s2, p2_s1s2, p3_s1s2, p4_s1s2, p5_s1s2, p6_s1s2, p7_s1s2, p8_s1s2, p9_s1s2,
        c1_s2s3, c2_s2s3, c3_s2s3, c4_s2s3, c5_s2s3, c6_s2s3, c7_s2s3, c8_s2s3, c9_s2s3,
        p1_s2s3, p2_s2s3, p3_s2s3, p4_s2s3, p5_s2s3, p6_s2s3, p7_s2s3, p8_s2s3, p9_s2s3
    );
    stage2_3_4 s3(
        clk,
        rst,
        c1_s2s3, c2_s2s3, c3_s2s3, c4_s2s3, c5_s2s3, c6_s2s3, c7_s2s3, c8_s2s3, c9_s2s3,
        p1_s2s3, p2_s2s3, p3_s2s3, p4_s2s3, p5_s2s3, p6_s2s3, p7_s2s3, p8_s2s3, p9_s2s3,
        c1_s3s4, c2_s3s4, c3_s3s4, c4_s3s4, c5_s3s4, c6_s3s4, c7_s3s4, c8_s3s4, c9_s3s4,
        p1_s3s4, p2_s3s4, p3_s3s4, p4_s3s4, p5_s3s4, p6_s3s4, p7_s3s4, p8_s3s4, p9_s3s4
    );
    stage2_3_4 s4(
        clk,
        rst,
        c1_s3s4, c2_s3s4, c3_s3s4, c4_s3s4, c5_s3s4, c6_s3s4, c7_s3s4, c8_s3s4, c9_s3s4,
        p1_s3s4, p2_s3s4, p3_s3s4, p4_s3s4, p5_s3s4, p6_s3s4, p7_s3s4, p8_s3s4, p9_s3s4,
        c1_s4s5, c2_s4s5, c3_s4s5, c4_s4s5, c5_s4s5, c6_s4s5, c7_s4s5, c8_s4s5, c9_s4s5,
        p1_s4s5, p2_s4s5, p3_s4s5, p4_s4s5, p5_s4s5, p6_s4s5, p7_s4s5, p8_s4s5, p9_s4s5
    );
    stage5 s5(
        clk,
        rst,
        c1_s4s5, c2_s4s5, c3_s4s5, c4_s4s5, c5_s4s5, c6_s4s5, c7_s4s5, c8_s4s5, c9_s4s5,
        p1_s4s5, p2_s4s5, p3_s4s5, p4_s4s5, p5_s4s5, p6_s4s5, p7_s4s5, p8_s4s5, p9_s4s5,
        c1_s5s6, c2_s5s6, c3_s5s6, c4_s5s6, c5_s5s6, c6_s5s6, c7_s5s6, c8_s5s6, c9_s5s6, 
        cp1_s5s6,cp2_s5s6,cp3_s5s6,cp4_s5s6,cp5_s5s6,cp6_s5s6,cp7_s5s6,cp8_s5s6,cp9_s5s6
    );
    stage6 s6(
        clk,
        rst,
        c1_s5s6, c2_s5s6, c3_s5s6, c4_s5s6, c5_s5s6, c6_s5s6, c7_s5s6, c8_s5s6, c9_s5s6, 
        cp1_s5s6,cp2_s5s6,cp3_s5s6,cp4_s5s6,cp5_s5s6,cp6_s5s6,cp7_s5s6,cp8_s5s6,cp9_s5s6,
        a_s6s7,
        b_s6s7
    );
    divider16bit8 s7(
        clk,
        rst,
        a_s6s7,
        b_s6s7,
        cl_pixel
    );


endmodule