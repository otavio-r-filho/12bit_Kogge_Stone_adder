module EntryBox(clk, rst, Ai, Bi, Pi, Gi);
  
  input clk, rst, Ai, Bi;
  output Pi, Gi;
  
  reg Pi, Gi;
  
  wire w1, w2;
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      Gi = 1'b0;
      Pi = 1'b0;
    end else begin
      xor(w1, Ai, Bi);
      and(w2, Ai, Bi);
  end
  
  assign Pi = w1;
  assign Gi = w2;
  
endmodule