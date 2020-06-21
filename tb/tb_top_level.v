module tb_top_level();
reg clk, rst, en;
reg [7:0] res [0:255][0:255];

integer i,j;

top_level DUT(
    clk,
    rst,
    en
);

initial begin
    clk = 0;
    rst = 0;
    en = 0;
    #5
    rst = 1;
    #20
    en = 1;
    #10
    en = 0;
end

initial forever #10 clk = ~clk;

initial begin
    $readmemh("D:\\gd\\_tai_lieu\\5_4_ki_2\\VLSI\\btl-vlsi\\fckup\\padded_image.txt", DUT.memory.n_image);
    $readmemh("D:\\gd\\_tai_lieu\\5_4_ki_2\\VLSI\\btl-vlsi\\fckup\\filter_image.txt", res);
    #(20*256*256+15*20)
    for (i=0; i<256; i=i+1) begin
        for(j=0; j<256; j=j+1) begin
            if(DUT.memory.f_image[i][j] !== res[i][j]) begin
                $display("-------Error---------");
                $display("f_image[%d][%d] = %h",i,j,DUT.memory.f_image[i][j]);
                $display("result = %h",res[i][j] );
            end
        end
    end
end

endmodule