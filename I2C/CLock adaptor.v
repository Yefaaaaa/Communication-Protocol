// To adapt to ohter any clk requriment for Hardware
module i2c_clk_divider(reset,ref_clk,i2c_clk);
  input wire reset;
  input wire ref_clk;
  output reg i2c_clk;

reg [9:0] count = 0;

always @(posedge ref_clk)begin
  if (reset == 1 )begin
    i2c_clk = 0;
    count = 0;
  end else begin
    if (count == 500) begin
      i2c_clk = ~i2c_clk;
      count = 0;
    end else begin
      count = count + 1;
    end
  end 
end
endmodule