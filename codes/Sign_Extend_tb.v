`timescale 1ns/1ns
`include "Sign_Extend.v"

module Sign_Extend_tb;

reg [11:0] a;
wire [31:0] b;

Sign_Extend uut(.in(a),.out(b));

initial begin
    $dumpfile("Sign_Extend_tb.vcd");
    $dumpvars;
    a = 12'd4; #20;
    a = -12'd4; #20;
end
    
endmodule
