module SumBlock(clk, rst, Pi, Gki, Si);
  input clk, rst, Pi, Gki;
  output Si;
  
  reg Si;
  
  wire w1;
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      Si = 1'b0;
    end else begin
      xor(w1, Pi, Gki);
    end
  end
  
  assign Si = w1;
  
endmodule
