module main_ram(input ce , clk,
                input [3:0] in_reg,
                output [7:0] out_final);
  
  //wire before the buffer and after the ram
  reg [7:0]out_ram;
  
  //buffer
  assign out_final = ce?out_ram:8'hz;
  
  //when the input changes in the ram
  //assign the control signal 
  always @(in_reg)begin
    case(in_reg)
      0:out_ram <= 8'h08;
      1:out_ram <= 8'h1a;
      2:out_ram <= 8'he0;
      3:out_ram <= 8'h0d;
      4:out_ram <= 8'h2e;
      5:out_ram <= 8'he0;
      6:out_ram <= 8'h00;
      7:out_ram <= 8'h00;
      8:out_ram <= 8'h10;
      9:out_ram <= 8'h00;
      10:out_ram <= 8'h02;
      11:out_ram <= 8'h05;
      12:out_ram <= 8'h12;
      13:out_ram <= 8'h13;
      14:out_ram <= 8'h03;
      15:out_ram <= 8'h00;
    endcase
  end
endmodule