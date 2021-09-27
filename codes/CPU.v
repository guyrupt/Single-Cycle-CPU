`include "Control.v"
`include "Adder.v"
`include "PC.v"
`include "Instruction_Memory.v"
`include "Registers.v"
`include "MUX32.v"
`include "Sign_Extend.v"
`include "ALU.v"
`include "ALU_Control.v"

module CPU
(
    clk_i, 
    rst_i,
    start_i
);

// Ports
input               clk_i;
input               rst_i;
input               start_i;
// Wires
wire [31:0] pc_o;
wire [31:0] pc_i;
wire [31:0] instr_o;
wire [6:0] Op_i;
wire [4:0] RS1addr_i;
wire [4:0] RS2addr_i;
wire [4:0] RDaddr_i;
wire [11:0] data_i;
wire [9:0] funct_i;
wire [1:0] ALUOp_o;
wire ALUSrc_o;
wire RegWrite_o;
wire [31:0] RS1data_o;
wire [31:0] RS2data_o;
wire [31:0] data2_i;
wire [31:0] data_o;
wire [2:0] ALUCtrl_i;
wire [31:0] ALUresult;


assign Op_i = instr_o[6:0];
assign RS1addr_i = instr_o[19:15];
assign RS2addr_i = instr_o[24:20];
assign RDaddr_i = instr_o[11:7];
assign data_i = instr_o[31:20];
assign funct_i = {instr_o[31:25],instr_o[14:12]};


Control Control(
    .Op_i       (Op_i),
    .ALUOp_o    (ALUOp_o),
    .ALUSrc_o   (ALUSrc_o),
    .RegWrite_o (RegWrite_o)
);



Adder Add_PC(
    .data1_in   (pc_o),
    .data2_in   (32'b100),
    .data_o     (pc_i)
);


PC PC(
    .clk_i      (clk_i),
    .rst_i      (rst_i),
    .start_i    (start_i),
    .pc_i       (pc_i),
    .pc_o       (pc_o)
);

Instruction_Memory Instruction_Memory(
    .addr_i     (pc_o), 
    .instr_o    (instr_o)
);

Registers Registers(
    .clk_i      (clk_i),
    .RS1addr_i   (RS1addr_i),
    .RS2addr_i   (RS2addr_i),
    .RDaddr_i   (RDaddr_i), 
    .RDdata_i   (ALUresult),
    .RegWrite_i (RegWrite_o), 
    .RS1data_o   (RS1data_o), 
    .RS2data_o   (RS2data_o) 
);


MUX32 MUX_ALUSrc(
    .data1_i    (RS2data_o),
    .data2_i    (data_o),
    .select_i   (ALUSrc_o),
    .data_o     (data2_i)
);



Sign_Extend Sign_Extend(
    .data_i     (data_i),
    .data_o     (data_o)
);

  

ALU ALU(
    .data1_i    (RS1data_o),
    .data2_i    (data2_i),
    .ALUCtrl_i  (ALUCtrl_i),
    .data_o     (ALUresult),
    .Zero_o     ()
);



ALU_Control ALU_Control(
    .funct_i    (funct_i),
    .ALUOp_i    (ALUOp_o),
    .ALUCtrl_o  (ALUCtrl_i)
);


endmodule

