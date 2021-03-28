module alu(input [7:0]bus, 
          input la,lb,su,ea,eu,
          input clk , clear,
           output  [7:0]out_accumulator,
           output  [7:0]out_adder
          );
  
  //tri-state buffer before the accumulator
  wire [7:0]out_buff_1 ;
  assign out_buff_1 = la?bus:8'hz;
  
  //tri-state buffer before the b register
  wire[7:0]out_buff_2;
  assign out_buff_2 = lb?bus:8'hz;
  
  //the accumulator and b register
  reg [7:0]accumulator;
  reg [7:0]B;
  
  //the mux to decide addition or subtraction
  wire [7:0]out_alu;
  assign out_alu = su?accumulator-B:accumulator+B;
  
  //tristate buffer to from main bus and the adder output
  assign out_adder= eu?out_alu:8'hz;
  
  //tristate buffer from main bus and accumulator
  assign out_accumulator = ea?accumulator:8'hz;
  
  //the asynchronous clear button
  always @(clear)begin
    if (clear)begin
      accumulator<=0;
      B <= 0;
    end
  end
      
  always @(posedge clk)begin
    
    //check if la and lb is on or else the garbage input will go
    if(la)
      accumulator <= out_buff_1;
    else if (lb)
      B <= out_buff_2;
  end
endmodule