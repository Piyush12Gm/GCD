`timescale 1ns / 1ps

// Parallel input Parallel output
module PIPO(data_out,data_in,load,clk);
input [15:0] data_in;
input load,clk;
output reg [15:0] data_out;

always @ (posedge clk)
if(load) data_out <= data_in;

endmodule


//Multiplexer Module
module MUX(out,in0,in1,sel);
input [15:0] in0,in1;
input sel;
output [15:0] out;
assign out = sel ? in1 : in0;
endmodule

// Subtractor Module
module SUB(out,in1,in2);
input [15:0]in1,in2;
output reg [15:0]out;

always @(*)
out = in1 - in2;

endmodule

// Comparator Module
module comparator(lt,gt,eq,in0,in1);
input [15:0]in0,in1;
output lt,gt,eq;

assign lt=in0<in1;
assign gt=in0>in1;
assign eq=in0==in1;

endmodule



// Data Path Module
module data_path(Aout,Bout,lt,gt,eq,ldA,ldB,sel1,sel2,sel_load,clk,data_in);
input clk,sel1,sel2,sel_load,ldA,ldB;
input [15:0]data_in;
output lt,gt,eq;
output [15:0]Aout,Bout;
wire [15:0] x,y,subout,Bus;

PIPO A(Aout,Bus,ldA,clk);
PIPO B(Bout,Bus,ldB,clk);
MUX MUX1(x,Aout,Bout,sel1);
MUX MUX2(y,Aout,Bout,sel2);
MUX MUX_load(Bus,subout,data_in,sel_load);
SUB SUBTRACTOR(subout,x,y);
comparator COMP(lt,gt,eq,Aout,Bout);
endmodule
