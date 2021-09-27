module Control (
    Op_i,
    ALUOp_o,
    ALUSrc_o,
    RegWrite_o
);


input [6:0] Op_i;
output [1:0] ALUOp_o;
output ALUSrc_o;
output RegWrite_o;

assign ALUSrc_o = (Op_i[5]==0) ? 1:0;
assign RegWrite_o = 1;
assign ALUOp_o = (Op_i[5]==0) ? 2'b00: 2'b10;

endmodule