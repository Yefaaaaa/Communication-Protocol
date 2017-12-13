module USR(data_in,
           select,
           data_out,
           CLK,
           clear,
           MSB_in, 
           LSB_in,);
  
  parameter bit=8;
  
  input [bit:0] data_in;
  input [2:0] select;
  input CLK, clear;
  input MSB_in, LSB_in; 			// Serial inputs
  output reg [bit:0] data_out;
  
  
  USR_tb a(.data_in(data_in),
        .select(select),
        .CLK(CLK),
        .clear(clear),
        .MSB_in(MSB_in), 
        .LSB_in(LSB_in));
  
  always @(posedge CLK or clear)begin
    if (clear==1'b0)
      data_out <= 8'b00000000;
    else begin
     case (select)
       2'b00: begin  // Not changed
          data_out <= data_out;
        end
        2'b01: begin // shift right
          data_out <= {MSB_in,data_out[bit:1]};
       end
       2'b10: begin  // shift left
         data_out <= {data_out[bit-1:0],LSB_in};
       end
       2'b11: begin  // Parallel data in
         data_out <= data_in;
        end
       default: begin
         $display("Wrong selection, Data will be the same");
         data_out <= data_out;
      end
      endcase
    end
  
  
  
   
  end
  
  
  
endmodule
