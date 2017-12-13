module I2C_testbench;
  reg clk;
  reg reset;
  wire i2c_sda;
  wire i2c_scl;  
  
  wire i2c_clk;
  
  

  
  I2C A(
         .clk(clk),
         .reset(reset),
         .i2c_sda(i2c_sda),
         .i2c_scl(i2c_scl));
         
         
/* To adapt to any clock       
  I2C C(
         .clk(clk),
         .reset(reset),
         .i2c_sda(i2c_sda),
         .i2c_scl(i2c_scl));
         
         
         
  i2c_clk_divider B (
      .reset(reset),
      .ref_clk(clk),
      .i2c_clk(i2c_clk) 
  );
 
 */
  
// Intial clock  
initial begin 
  clk = 0;
  forever clk = #1 ~clk;
end

initial begin
  reset = 1;
  
  #10;
  
  reset = 0;
  
  #100;
  
end


endmodule
