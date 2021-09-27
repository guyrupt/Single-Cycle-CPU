module MUX32 (
    select_i,
    data1_i,
    data2_i,
    data_o
);
output [31:0] data_o;
input [31:0] data1_i, data2_i;
input select_i;

// wire [31:0] out;

assign data_o = select_i ? data2_i: data1_i;

endmodule