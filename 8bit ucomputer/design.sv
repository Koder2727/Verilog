`include "ALU.sv" 
`include "Control_unit.sv" 
`include "Program_counter.sv" 
`include "Mar.sv" 
`include "main_ram.sv" 
`include "instruction_register.sv"
`include "output_register.sv" 

module ucomputer(input clk , clear , reset,
                 output [7:0]out );
  
  //the connection wires between the components and control bus and main bus
  wire [3:0]inst_cu;
  wire [3:0]mar_ram;
  wire [11:0]control_bus;
  wire [7:0]main_bus;
  
  //declare the control unit
  control_unit control_unit(inst_cu,reset,clk,clear,control_bus);
  
  //declaration of the alu
  alu alu(main_bus , ~control_bus[5],~control_bus[1],control_bus[3],control_bus[4],control_bus[2],clk,clear,main_bus,main_bus);
  
  //declaration of program counter
  program_counter program_counter(control_bus[11],control_bus[10],clk,clear,main_bus[3:0]);
  
  //declaration of mar
  Mar Mar(~control_bus[9] , clk , main_bus[3:0] , mar_ram);
  
  //declaration of ram
  main_ram main_ram(~control_bus[8],clk,mar_ram , main_bus);
  
  //declaration of instruction register
  instruction_register instruction_register (~control_bus[7],~control_bus[6],clk,clear,main_bus,main_bus[3:0] , inst_cu);
  
  //declaration of output register
  output_register output_register (~control_bus[0] , clk,clear,main_bus,out);
  
endmodule