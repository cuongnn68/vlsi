module stage6(
    clk,
    rst,
    c1,c2,c3,c4,c5,c6,c7,c8,c9,
    cp1,cp2,cp3,cp4,cp5,cp6,cp7,cp8,cp9,
    a,b
);

    input clk;
    input rst;
    input [7:0] c1,c2,c3,c4,c5,c6,c7,c8,c9;
    input [15:0] cp1,cp2,cp3,cp4,cp5,cp6,cp7,cp8,cp9;

    output [7:0] a;
    output [15:0] b;

    adder9x #(16) adder9x_a(
        .clk(clk),
        .rst(rst),
        .op1(cp1),
        .op2(cp2),
        .op3(cp3),
        .op4(cp4),
        .op5(cp5),
        .op6(cp6),
        .op7(cp7),
        .op8(cp8),
        .op9(cp9),
        .res(a)
    );

    adder9x #(8) adder9x_b(
        .clk(clk),
        .rst(rst),
        .op1(c1),
        .op2(c2),
        .op3(c3),
        .op4(c4),
        .op5(c5),
        .op6(c6),
        .op7(c7),
        .op8(c8),
        .op9(c9),
        .res(b)
    );



endmodule