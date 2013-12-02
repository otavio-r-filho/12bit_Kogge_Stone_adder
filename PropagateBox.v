module PropagateBox(clk, rst, Pi, Gi, Pki, Gki, P, G);
  
  input clk, rst, Pi, Gi, Pki, Gki;
  output P, G;
  
  reg P, G;
  
  wire w1;
  
  GenerateBox gbox(.clk(clk), rst(rst), .Pi(Pi), .Gi(Gi), .Gki(Gki), .G(G));
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      P = 1'b0;
    end else begin
      and(w1, Pi, Pki);
  end
  
  assign P = w1; 
  
endmodule