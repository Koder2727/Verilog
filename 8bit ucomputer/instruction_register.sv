module instruction_register(input li,el,clk,clear,
                            input [7:0]bus_in,
                            output [3:0]bus_out,
                            output [3:0]cu_out);
  
  //define a reg out from regisetr
  reg [7:0] out_reg ;
  
  //tri state buffer on the bus out
  assign bus_out = el?out_reg[3:0]:4'hz;
  
  //cu_out
  assign cu_out = out_reg[7:4];
  
  wire [7:0]bus_reg;
  
  //tri state buffer on the reg in
  assign bus_reg = li?bus_in:8'hz;
  
  //clear the register when clear
  always @(clear)begin
    if(clear)begin
      out_reg <= 0;
    end
  end
  
  
  //fill the register
  always @(posedge clk)begin
    if(li)
      out_reg <= bus_reg;
  end
endmodule