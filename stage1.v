module stage1(
    clk,
    rst,
    act,
    p1,p2,p3,p4,p5,p6,p7,p8,p9,
    c1,c2,c3,c4,c5,c6,c7,c8,c9,
    p1_out,
    p2_out,
    p3_out,
    p4_out,
    p5_out,
    p6_out,
    p7_out,
    p8_out,
    p9_out
);

    input clk;
    input rst;
    input act;
    input [7:0] p1,p2,p3,p4,p5,p6,p7,p8,p9;

    output [7:0] c1,c2,c3,c4,c5,c6,c7,c8,c9;

    output reg [7:0] p1_out;
    output reg [7:0] p2_out;
    output reg [7:0] p3_out;
    output reg [7:0] p4_out;
    output reg [7:0] p5_out;
    output reg [7:0] p6_out;
    output reg [7:0] p7_out;
    output reg [7:0] p8_out;
    output reg [7:0] p9_out;

    always@(posedge clk or negedge rst) begin
        if(~rst) begin
            {p1_out,p2_out,p3_out,p4_out,p5_out,p6_out,p7_out,p8_out,p9_out} <= 0;
        end else begin
            {p1_out,p2_out,p3_out,p4_out,p5_out,p6_out,p7_out,p8_out,p9_out}
            <= {p1,p2,p3,p4,p5,p6,p7,p8,p9};
        end
    end

    sub_abs_sub s1_block1(
        .clk(clk),
        .rst(rst),
        .act(act),
        .op1(p1),
        .op2(p5),
        .res(c1)
    );

    sub_abs_sub s1_block2(
        .clk(clk),
        .rst(rst),
        .act(act),
        .op1(p2),
        .op2(p5),
        .res(c2)
    );

    sub_abs_sub s1_block3(
        .clk(clk),
        .rst(rst),
        .act(act),
        .op1(p3),
        .op2(p5),
        .res(c3)
    );

    sub_abs_sub s1_block4(
        .clk(clk),
        .rst(rst),
        .act(act),
        .op1(p4),
        .op2(p5),
        .res(c4)
    );

    sub_abs_sub s1_block5(
        .clk(clk),
        .rst(rst),
        .act(act),
        .op1(p5),
        .op2(p5),
        .res(c5)
    );

    sub_abs_sub s1_block6(
        .clk(clk),
        .rst(rst),
        .act(act),
        .op1(p6),
        .op2(p5),
        .res(c6)
    );

    sub_abs_sub s1_block7(
        .clk(clk),
        .rst(rst),
        .act(act),
        .op1(p7),
        .op2(p5),
        .res(c7)
    );

    sub_abs_sub s1_block8(
        .clk(clk),
        .rst(rst),
        .act(act),
        .op1(p8),
        .op2(p5),
        .res(c8)
    );

    sub_abs_sub s1_block9(
        .clk(clk),
        .rst(rst),
        .act(act),
        .op1(p9),
        .op2(p5),
        .res(c9)
    );






/*
// input [7:0] p1,p2,p3,p4,p5,p6,p7,p8,p9;
// output reg [7:0] c1,c2,c3,c4,c5,c6,c7,c8,c9;

// reg [7:0] reg_p1,reg_p2,reg_p3,reg_p4,reg_p5,reg_p6,reg_p7,reg_p8,reg_p9;
// always @(posedge clk or negedge rst) begin
//     if(~rst) begin
//         {reg_p1,reg_p2,reg_p3,reg_p4,reg_p5,reg_p6,reg_p7,reg_p8,reg_p9} <= 0;
//     end else begin
//         reg_p1 <= p1;
//         reg_p2 <= p2;
//         reg_p3 <= p3;
//         reg_p4 <= p4;
//         reg_p5 <= p5;
//         reg_p6 <= p6;
//         reg_p7 <= p7;
//         reg_p8 <= p8;
//         reg_p9 <= p9;
//     end
// end

// sub_abs_sub block1_1(
//     .op
// )
*/



endmodule