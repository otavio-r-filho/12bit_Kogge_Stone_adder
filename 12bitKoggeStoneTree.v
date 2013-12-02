module 12bitKoggeStoneTree(clk, rst, A, S, Co);
  input clk, rst;
  input [11..0] A, B;
  output [11..0] S;
  output Co;
  
  reg [11..0] S;
  reg Co;
  
  //First P and G wires layer
  wire P00, P01, P02, P03, P04, P05, P06, P07, P08, P09, P010, P011; 
  wire G00, G01, G02, G03, G04, G05, G06, G07, G08, G09, G010, G011;
  
  //Second P and G wires layer
  wire P12, P13, P14, P15, P16, P17, P18, P19, P110, P111;      
  wire G11, G12, G13, G14, G15, G16, G17, G18, G19, G110, G111;
  
  //Third P and G wires layer
  wire P24, P25, P26, P27, P28, P210, P211;
  wire G22, G23, G24, G25, G26, G27, G28, G210, G211;
  
  //Fourth P ang G wires layer
  wire P38, P39, P310, P311;
  wire G34, G35, G36, G37, G38, G39, G310, G311;
  
  //Last P and G wires layer
  wire G48, G49, G410;
  
  wire Cin; //This is the Carry in wire, not used in this design;
  
  assign Cin = 1'b0;
    
  //Entry level of the tree
  EntryBox E0  (.clk(rst), .rst(rst), .Ai(A[0]),  .Bi(B[0]),  .Pi(P00),  .Gi(G00)  );
  EntryBox E1  (.clk(rst), .rst(rst), .Ai(A[1]),  .Bi(B[1]),  .Pi(P01),  .Gi(G01)  );
  EntryBox E2  (.clk(rst), .rst(rst), .Ai(A[2]),  .Bi(B[2]),  .Pi(P02),  .Gi(G02)  );
  EntryBox E3  (.clk(rst), .rst(rst), .Ai(A[3]),  .Bi(B[3]),  .Pi(P03),  .Gi(G03)  );
  EntryBox E4  (.clk(rst), .rst(rst), .Ai(A[4]),  .Bi(B[4]),  .Pi(P04),  .Gi(G04)  );
  EntryBox E5  (.clk(rst), .rst(rst), .Ai(A[5]),  .Bi(B[5]),  .Pi(P05),  .Gi(G05)  );
  EntryBox E6  (.clk(rst), .rst(rst), .Ai(A[6]),  .Bi(B[6]),  .Pi(P06),  .Gi(G06)  );
  EntryBox E7  (.clk(rst), .rst(rst), .Ai(A[7]),  .Bi(B[7]),  .Pi(P07),  .Gi(G07)  );
  EntryBox E8  (.clk(rst), .rst(rst), .Ai(A[8]),  .Bi(B[8]),  .Pi(P08),  .Gi(G08)  );
  EntryBox E9  (.clk(rst), .rst(rst), .Ai(A[9]),  .Bi(B[9]),  .Pi(P09),  .Gi(G09)  );
  EntryBox E10 (.clk(rst), .rst(rst), .Ai(A[10]), .Bi(B[10]), .Pi(P010), .Gi(G010) );
  EntryBox E11 (.clk(rst), .rst(rst), .Ai(A[11]), .Bi(B[11]), .Pi(P011), .Gi(G011) );
  
  //Level 1 of the tree
  GenerateBox  GB01  (.clk(clk), .rst(rst), .Pi(P01),  .Gi(G01),  .Gki(G00),  .G(G11) );
  PropagateBox PB02  (.clk(clk), .rst(rst), .Pi(P02),  .Gi(G02),  .Pki(P01),  .Gki(G01),  .P(P12),  .G(G12)  );  
  PropagateBox PB03  (.clk(clk), .rst(rst), .Pi(P03),  .Gi(G03),  .Pki(P02),  .Gki(G02),  .P(P13),  .G(G13)  );
  PropagateBox PB04  (.clk(clk), .rst(rst), .Pi(P04),  .Gi(G04),  .Pki(P03),  .Gki(G03),  .P(P14),  .G(G14)  );
  PropagateBox PB05  (.clk(clk), .rst(rst), .Pi(P05),  .Gi(G05),  .Pki(P04),  .Gki(G04),  .P(P15),  .G(G15)  );
  PropagateBox PB06  (.clk(clk), .rst(rst), .Pi(P06),  .Gi(G06),  .Pki(P05),  .Gki(G05),  .P(P16),  .G(G16)  );
  PropagateBox PB07  (.clk(clk), .rst(rst), .Pi(P07),  .Gi(G07),  .Pki(P06),  .Gki(G06),  .P(P17),  .G(G17)  );
  PropagateBox PB08  (.clk(clk), .rst(rst), .Pi(P08),  .Gi(G08),  .Pki(P07),  .Gki(G07),  .P(P18),  .G(G18)  );
  PropagateBox PB09  (.clk(clk), .rst(rst), .Pi(P09),  .Gi(G09),  .Pki(P08),  .Gki(G08),  .P(P19),  .G(G19)  );
  PropagateBox PB010 (.clk(clk), .rst(rst), .Pi(P010), .Gi(G010), .Pki(P09),  .Gki(G09),  .P(P110), .G(G110) );
  PropagateBox PB011 (.clk(clk), .rst(rst), .Pi(P011), .Gi(G011), .Pki(P010), .Gki(G010), .P(P111), .G(G111) );
  
  //Level 2 of the tree  
  GenerateBox  GB12  (.clk(clk), .rst(rst), .Pi(P12),  .Gi(G12),  .Gki(G00), .G(G22) );
  GenerateBox  GB13  (.clk(clk), .rst(rst), .Pi(P13),  .Gi(G13),  .Gki(G11), .G(G23) );
  PropagateBox PB14  (.clk(clk), .rst(rst), .Pi(P14),  .Gi(G14),  .Pki(P12), .Gki(G12), .P(P24),  .G(G24)  );
  PropagateBox PB15  (.clk(clk), .rst(rst), .Pi(P15),  .Gi(G15),  .Pki(P13), .Gki(G13), .P(P25),  .G(G25)  );
  PropagateBox PB16  (.clk(clk), .rst(rst), .Pi(P16),  .Gi(G16),  .Pki(P14), .Gki(G14), .P(P26),  .G(G26)  );
  PropagateBox PB17  (.clk(clk), .rst(rst), .Pi(P17),  .Gi(G17),  .Pki(P15), .Gki(G15), .P(P27),  .G(G27)  );
  PropagateBox PB18  (.clk(clk), .rst(rst), .Pi(P18),  .Gi(G18),  .Pki(P16), .Gki(G16), .P(P28),  .G(G28)  );
  PropagateBox PB19  (.clk(clk), .rst(rst), .Pi(P19),  .Gi(G19),  .Pki(P17), .Gki(G17), .P(P29),  .G(G29)  );
  PropagateBox PB110 (.clk(clk), .rst(rst), .Pi(P110), .Gi(G110), .Pki(P18), .Gki(G18), .P(P210), .G(G210) );
  PropagateBox PB111 (.clk(clk), .rst(rst), .Pi(P111), .Gi(G111), .Pki(P19), .Gki(G19), .P(P211), .G(G211) );
  
  //Level 3 of the tree
  GenerateBox  GB24  (.clk(clk), .rst(rst), .Pi(P24),  .Gi(G24),  .Gki(G00), .G(G34) );
  GenerateBox  GB25  (.clk(clk), .rst(rst), .Pi(P25),  .Gi(G25),  .Gki(G11), .G(G35) );
  GenerateBox  GB26  (.clk(clk), .rst(rst), .Pi(P26),  .Gi(G26),  .Gki(G22), .G(G36) );
  GenerateBox  GB27  (.clk(clk), .rst(rst), .Pi(P27),  .Gi(G27),  .Gki(G23), .G(G37) );
  PropagateBox PB28  (.clk(clk), .rst(rst), .Pi(P28),  .Gi(G28),  .Pki(P24), .Gki(G24), .P(P38),  .G(G38)  );
  PropagateBox PB29  (.clk(clk), .rst(rst), .Pi(P29),  .Gi(G29),  .Pki(P25), .Gki(G25), .P(P39),  .G(G39)  );
  PropagateBox PB210 (.clk(clk), .rst(rst), .Pi(P210), .Gi(G210), .Pki(P26), .Gki(G26), .P(P310), .G(G310) );
  PropagateBox PB211 (.clk(clk), .rst(rst), .Pi(P211), .Gi(G211), .Pki(P27), .Gki(G27), .P(P311), .G(G311) );

  //Level 4 of the tree
  GenerateBox  GB38  (.clk(clk), .rst(rst), .Pi(P38),  .Gi(G38),  .Gki(G00), .G(G48)  );
  GenerateBox  GB39  (.clk(clk), .rst(rst), .Pi(P39),  .Gi(G39),  .Gki(G11), .G(G49)  );
  GenerateBox  GB310 (.clk(clk), .rst(rst), .Pi(P310), .Gi(G310), .Gki(G22), .G(G410) );
  GenerateBox  GB311 (.clk(clk), .rst(rst), .Pi(P311), .Gi(G311), .Gki(G23), .G(Co)   );
  
  //Result layer
  SumBlock S0  (.clk(clk), .rst(rst), .Pi(P00),  .Gki(Cin),  .Si(S[0]) ); 
  SumBlock S1  (.clk(clk), .rst(rst), .Pi(P01),  .Gki(G00),  .Si(S[1]) );
  SumBlock S2  (.clk(clk), .rst(rst), .Pi(P02),  .Gki(G11),  .Si(S[2]) );
  SumBlock S3  (.clk(clk), .rst(rst), .Pi(P03),  .Gki(G22),  .Si(S[3]) );
  SumBlock S4  (.clk(clk), .rst(rst), .Pi(P04),  .Gki(G23),  .Si(S[4]) );
  SumBlock S5  (.clk(clk), .rst(rst), .Pi(P05),  .Gki(G34),  .Si(S[5]) );
  SumBlock S6  (.clk(clk), .rst(rst), .Pi(P06),  .Gki(G35),  .Si(S[6]) );
  SumBlock S7  (.clk(clk), .rst(rst), .Pi(P07),  .Gki(G36),  .Si(S[7]) );
  SumBlock S8  (.clk(clk), .rst(rst), .Pi(P08),  .Gki(G37),  .Si(S[8]) );
  SumBlock S9  (.clk(clk), .rst(rst), .Pi(P09),  .Gki(G48),  .Si(S[9]) );
  SumBlock S10 (.clk(clk), .rst(rst), .Pi(P010), .Gki(G49),  .Si(S[10]));
  SumBlock S11 (.clk(clk), .rst(rst), .Pi(P011), .Gki(G410), .Si(S[11]));  
  
endmodule
