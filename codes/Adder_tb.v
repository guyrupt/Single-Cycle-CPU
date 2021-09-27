`timescale 1ns/1ns
`include "Adder.v"

module Adder_tb;
reg [31:0] a;
wire [31:0] b;

Adder uut(a,b);

initial begin
    $dumpfile("Adder_tb.vcd");
    $dumpvars;
    a = 32'h0000; #20;
    a = 32'h0008; #20;
end
endmodule