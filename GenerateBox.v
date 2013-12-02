module GenerateBox(clk, rst, Pi, Gi, Gki, G);
  input clk, rst, Pi, Gi, Gki;
  output G;
  
  reg G;
  
  wire w1, w2;
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      G = 1'b0;
    end else begin
      and(w1, Pi, Gki);
      or(w2, w1, Gi);
    end
  end
  
  assign G = w2;
  
endmodule