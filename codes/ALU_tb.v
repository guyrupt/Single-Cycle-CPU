`timescale 1ns/1ns
`include "ALU.v"

module ALU_tb;

reg [31:0] d1, d2;
wire [31:0] out;
reg [2:0] ALUcontrol;

ALU uut(.data1_i(d1),
    .data2_i(d2),
    .ALUCtrl_i(ALUcontrol),
    .data_o(out));

initial begin
    $dumpfile("ALU_tb.vcd");
    $dumpvars;
    d1 = 32'd1;
    d2 = 32'd2;
    ALUcontrol = 3'b000; #20;
    ALUcontrol = 3'b001; #20;
    ALUcontrol = 3'b010; #20;
    ALUcontrol = 3'b110; #20;
    ALUcontrol = 3'b111; #20;
    ALUcontrol = 3'b101; #20;
    ALUcontrol = 3'b011; #20;
end
    
endmodule