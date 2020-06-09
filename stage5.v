module stage5(
    clk,
    rst,
    p1,p2,p3,p4,p5,p6,p7,p8,p9,
    c1,c2,c3,c4,c5,c6,c7,c8,c9,
    c1_out,c2_out,c3_out,c4_out,c5_out,c6_out,c7_out,c8_out,c9_out,
    cp1_out,cp2_out,cp3_out,cp4_out,cp5_out,cp6_out,cp7_out,cp8_out,cp9_out
);

    input clk;
    input rst;
    input [7:0] p1,p2,p3,p4,p5,p6,p7,p8,p9;
    input [7:0] c1,c2,c3,c4,c5,c6,c7,c8,c9;

    output reg [7:0] c1_out,c2_out,c3_out,c4_out,c5_out,c6_out,c7_out,c8_out,c9_out;
    output [15:0] cp1_out,cp2_out,cp3_out,cp4_out,cp5_out,cp6_out,cp7_out,cp8_out,cp9_out;

    always@(posedge clk or negedge rst) begin
        if(~rst) begin
            {c1_out,c2_out,c3_out,c4_out,c5_out,c6_out,c7_out,c8_out,c9_out} <= 0;
        end else begin
            {c1_out,c2_out,c3_out,c4_out,c5_out,c6_out,c7_out,c8_out,c9_out}
            <= {c1,c2,c3,c4,c5,c6,c7,c8,c9};
        end
    end

    multiplier8bit16 s2_m1(
        .clk(clk),
        .rst(rst),
        .op1(c1),
        .op2(p1),
        .res(cp1_out)
    );
    multiplier8bit16 s2_m2(
        .clk(clk),
        .rst(rst),
        .op1(c2),
        .op2(p2),
        .res(cp2_out)
    );
    multiplier8bit16 s2_m3(
        .clk(clk),
        .rst(rst),
        .op1(c3),
        .op2(p3),
        .res(cp3_out)
    );
    multiplier8bit16 s2_m4(
        .clk(clk),
        .rst(rst),
        .op1(c4),
        .op2(p4),
        .res(cp4_out)
    );
    multiplier8bit16 s2_m5(
        .clk(clk),
        .rst(rst),
        .op1(c5),
        .op2(p5),
        .res(cp5_out)
    );
    multiplier8bit16 s2_m6(
        .clk(clk),
        .rst(rst),
        .op1(c6),
        .op2(p6),
        .res(cp6_out)
    );
    multiplier8bit16 s2_m7(
        .clk(clk),
        .rst(rst),
        .op1(c7),
        .op2(p7),
        .res(cp7_out)
    );
    multiplier8bit16 s2_m8(
        .clk(clk),
        .rst(rst),
        .op1(c8),
        .op2(p8),
        .res(cp8_out)
    );
    multiplier8bit16 s2_m9(
        .clk(clk),
        .rst(rst),
        .op1(c9),
        .op2(p9),
        .res(cp9_out)
    );


endmodule
