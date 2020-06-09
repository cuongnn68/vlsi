module stage2_3_4(
    clk,
    rst,
    p1,p2,p3,p4,p5,p6,p7,p8,p9,
    c1,c2,c3,c4,c5,c6,c7,c8,c9,
    c1_out,c2_out,c3_out,c4_out,c5_out,c6_out,c7_out,c8_out,c9_out,
    p1_out,p2_out,p3_out,p4_out,p5_out,p6_out,p7_out,p8_out,p9_out
);
    input clk;
    input rst;
    input [7:0] p1,p2,p3,p4,p5,p6,p7,p8,p9;
    input [7:0] c1,c2,c3,c4,c5,c6,c7,c8,c9;

    output [7:0] c1_out,c2_out,c3_out,c4_out,c5_out,c6_out,c7_out,c8_out,c9_out;
    output [7:0] p1_out,p2_out,p3_out,p4_out,p5_out,p6_out,p7_out,p8_out,p9_out;

    always@(posedge clk or negedge rst) begin
        if(~rst) begin
            {p1_out,p2_out,p3_out,p4_out,p5_out,p6_out,p7_out,p8_out,p9_out} <= 0;
        end else begin
            {p1_out,p2_out,p3_out,p4_out,p5_out,p6_out,p7_out,p8_out,p9_out}
            <= {p1,p2,p3,p4,p5,p6,p7,p8,p9};
        end
    end

    multiplier8bit8 s2_m1(
        .clk(clk),
        .rst(rst),
        .op1(c1),
        .op2(c1),
        .res(c1_out)
    );
    multiplier8bit8 s2_m2(
        .clk(clk),
        .rst(rst),
        .op1(c2),
        .op2(c2),
        .res(c2_out)
    );
    multiplier8bit8 s2_m3(
        .clk(clk),
        .rst(rst),
        .op1(c3),
        .op2(c3),
        .res(c3_out)
    );
    multiplier8bit8 s2_m4(
        .clk(clk),
        .rst(rst),
        .op1(c4),
        .op2(c4),
        .res(c4_out)
    );
    multiplier8bit8 s2_m5(
        .clk(clk),
        .rst(rst),
        .op1(c5),
        .op2(c5),
        .res(c5_out)
    );
    multiplier8bit8 s2_m6(
        .clk(clk),
        .rst(rst),
        .op1(c6),
        .op2(c6),
        .res(c6_out)
    );
    multiplier8bit8 s2_m7(
        .clk(clk),
        .rst(rst),
        .op1(c7),
        .op2(c7),
        .res(c7_out)
    );
    multiplier8bit8 s2_m8(
        .clk(clk),
        .rst(rst),
        .op1(c8),
        .op2(c8),
        .res(c8_out)
    );
    multiplier8bit8 s2_m9(
        .clk(clk),
        .rst(rst),
        .op1(c9),
        .op2(c9),
        .res(c9_out)
    );


endmodule