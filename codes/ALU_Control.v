module ALU_Control (
    funct_i,
    ALUOp_i,
    ALUCtrl_o
);

input [9:0] funct_i; //[9:3] is funct7, [2:0] is funct3
input [1:0] ALUOp_i;
output [2:0] ALUCtrl_o;

reg [2:0] ALUCtrl_o;
wire [6:0] funct7;
wire [2:0] funct3;

assign funct7 = funct_i[9:3];
assign funct3 = funct_i[2:0];

always @(funct_i or ALUOp_i or funct7 or funct3) begin
    if(ALUOp_i==2'b00) begin// I-type
        case (funct3)
        3'b000: ALUCtrl_o <= 3'b010; // addi 
        3'b101: ALUCtrl_o <= 3'b101; // srai 
        endcase
    end
    else begin
                 // R-type
        if (funct7 == 7'b0000000) begin // and, xor, sll, add
            case (funct3)
            3'b111: ALUCtrl_o <= 3'b000; // and 
            3'b100: ALUCtrl_o <= 3'b001; // xor
            3'b001: ALUCtrl_o <= 3'b111; // sll
            3'b000: ALUCtrl_o <= 3'b010; // add
            endcase
        end
        else begin
            if (funct7 == 7'b0100000) // sub
                ALUCtrl_o <= 3'b110;
            else                      // mul
                ALUCtrl_o <= 3'b011;           
        end
    end
end

endmodule