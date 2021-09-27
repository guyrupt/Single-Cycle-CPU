`timescale 1ns/1ns
`include "ALU_Control.v"

module ALU_Control_tb;

reg [9:0] Ins;
reg [1:0] ALUOp;
wire [2:0] ALUControl;

ALU_Control uut(.funct_i(Ins),
    .ALUOp_i(ALUOp),
    .ALUCtrl_o(ALUControl));

initial begin
    $dumpfile("ALU_Control_tb.vcd");
    $dumpvars;
    // Ins = 10'b111; ALUOp = 2'b10; #20;
    // Ins = 10'b100; ALUOp = 2'b10; #20;
    // Ins = 10'b001; ALUOp = 2'b10; #20;
    // Ins = 10'b000; ALUOp = 2'b10; #20;
    // Ins = 10'b0100000000; ALUOp = 2'b10; #20;
    // Ins = 10'b0000001000; ALUOp = 2'b10; #20;
    // Ins = 10'bxxxxxxx000; ALUOp = 2'b0;  #20;
    // Ins = 10'bxxxxxxx101; ALUOp = 2'b0;  #20;
    Ins = 10'b0100000101; ALUOp = 2'b0; #20;
    
end
    
endmodule