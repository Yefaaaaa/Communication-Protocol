module DFF(CLK, D, reset, Q);
  
  input wire CLK, D, reset;
  output reg Q;
  
  
  always @(posedge CLK or negedge reset)begin
    if (reset==1'b1)begin
      Q <= D;
    end else begin
      Q <= 1'b0;
    end
  end
  
  
  
endmodule 
