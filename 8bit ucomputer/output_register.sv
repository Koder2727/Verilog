module output_register(input lo,clk,clear,
                       input [7:0]in_bus,
                       output reg[7:0]out_reg);
  
  //make tri state buffer from bus to input 
  wire [7:0]in_reg;
  assign in_reg = lo?in_bus:8'hz;
  
  //asynchronous clear
  always @(clear)begin
    if(clear)
      out_reg <= 0;
  end
  
  always @(posedge clk)begin
    if (lo)begin
      out_reg <= in_reg;
    end
  end
  
endmodule