`timescale 1ns/1ns
`include "MUX32.v"

module MUX32_tb;

reg [31:0] a0, a1;
wire [31:0] out;
reg control;

MUX32 uut (.Control(control),.src0(a0),.src1(a1),.out(out));

initial begin
    $dumpfile("MUX32_tb.vcd");
    $dumpvars;
    a0 = 32'b0;
    a1 = 32'b1;
    control = 1'b0; #20;
    control = 1'b1; #20;

end
endmodule