`include "ring_counter.sv" 
module control_unit
  (	input [3:0]instruction,
    input set,
	input clk,
	input clear,
   output reg [11:0]cu_out
  );
  
  //output wire for the ring counter
  wire [5:0]ring_output ;
  
  //the declarations of two rams
  reg [3:0]rom;
  reg [3:0]out_rom_in;
  
  //including the ring counter
  ring_ctr ring_counter(set,clk,clear,ring_output);
  
  //whenver instructions changes change the rom1 ouput
  always @(instruction)begin
    case(instruction)
      0:rom = 'h3;
      1:rom = 'h6;
      2:rom = 'h9;
      'he:rom = 'hc;
    endcase
  end
  
  //whenver the ring counter changes make changes in control signals
  always @(ring_output)begin
    if (ring_output[5])
      out_rom_in = 0;
    else if(ring_output[4])
      out_rom_in = 1;
    else if(ring_output[3])
      out_rom_in = 2;
    else if(ring_output[2])
      out_rom_in = rom;
    else if (ring_output[1])
      out_rom_in = rom+1;
    else if(ring_output[0])
      out_rom_in = rom+2;
  end
  
      
    
  always @(out_rom_in)begin
    case(out_rom_in)
      0:cu_out = 'h5e3;
      1:cu_out = 'hbe3;
      2:cu_out = 'h263;
      3,6,9:cu_out = 'h1a3;
      4:cu_out = 'h2c3;
      5,13,14:cu_out = 'h3e3;
      7,10:cu_out = 'h2e1;
      8:cu_out = 'h3c7;
      11:cu_out = 'h3cf;
      12:cu_out = 'h3f2;
    endcase
  end
    
    
endmodule