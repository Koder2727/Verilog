module program_counter(input cp,ep,
                       input clk,clear,
                       output[3:0] final_bus);
  
  //register to store the input of program counter and buffer defination 
  reg[3:0] pc_output;

  //tri-state buffer to connect final bus and pc_ouput
  assign final_bus = ep?pc_output:4'hz;
  
  //the asynchronous clear clock
  always @(clear)begin
    if(clear)
      pc_output <= 0;
  end
  
  
  //increament the counter
  always @(posedge clk)begin
    if (cp)begin
      pc_output <= pc_output+1;
    end
  end
endmodule