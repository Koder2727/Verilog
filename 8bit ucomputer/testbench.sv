
module testbench();
  reg clk,reset , clear;
  wire [7:0]out;
  
  ucomputer ucomputer(clk,clear,reset,out);
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0);
  end
  
  initial begin
    clk=0;
    forever #5 clk = ~clk;
  end
  
  initial begin 
    clear = 1;
    reset = 1;
    #11 clear = 0;
     reset = 0;
    #400
    $finish;
  end
endmodule