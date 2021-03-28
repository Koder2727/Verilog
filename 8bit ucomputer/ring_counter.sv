module ring_ctr  #(parameter width=6) 
  (  
	input set ,                
	input clk,
    input clear,
    output reg [width-1:0] out
  );    
 
  always @ (negedge clk) begin
   	
    // if the clock set reset 
    if (set)
    	out <= 'b100000;
    
    //if the clock is reset
    else if(clear)
    	out <= 0;
    
    //else do the left  shift of bits 
    else begin
      out[width-1] <= out[0];
      for (int i = 0; i < width-1; i=i+1) begin
         out[i] <= out[i+1];
      end
    end
  end
endmodule