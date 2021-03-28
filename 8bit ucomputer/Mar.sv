module Mar(input lm,clk,
           input [3:0] bus,
           output reg [3:0] out_mar_final);
  
  //wire between tristate buffer and regsiter
  wire[3:0] in_reg;
  
  //tristate buffer from main bus and register
  assign in_reg = lm?bus:4'hz;
  
  //check if lm is on or else it will load garbage input
  always @(posedge clk)begin
    if(lm)
      out_mar_final <= in_reg;
  end
endmodule

