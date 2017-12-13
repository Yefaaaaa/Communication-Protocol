module USR_tb(data_in,
              select,
              CLK,
              clear,
              MSB_in, 
              LSB_in);
  
  parameter bit=8;
  
  output reg [bit:0] data_in;
  output reg [2:0] select;
  output reg CLK, clear,MSB_in, LSB_in;
 

  initial begin
    CLK=1'b1;
    clear = 1'b0;
    #15 clear =1'b1;
    select = 2'b00;
    # 20 select = 2'b01;
         MSB_in = 1'b1;
    # 10 MSB_in = 1'b0;
    # 10 MSB_in = 1'b1;
    # 10 select = 2'b00;
    # 10 select = 2'b10;
         LSB_in = 1'b1;
    # 10 LSB_in = 1'b0;
    # 10 LSB_in = 1'b0;
    # 10 select = 2'b11;
    data_in = 8'hA6;
    # 10 select = 2'b00;   
  end
  
  always #5 CLK = ~CLK;
  
  
  
  
  
  
endmodule