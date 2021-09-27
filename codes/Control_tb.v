`timescale 1ns/1ns
`include "Control.v"

module Control_tb;

reg [6:0] ins;
wire [1:0] ALUOp;
wire ALUsrc, Regwrite;

Control uut(.Ins(ins),.ALUOp(ALUOp),.ALUSrc(ALUsrc),.RegWrite(Regwrite));

initial begin
    $dumpfile("Control_tb.vcd");
    $dumpvars;
    ins = 7'b0110011; #20;
    ins = 7'b0010011; #20;
end
    
endmodule