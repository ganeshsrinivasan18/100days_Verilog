module loadable_register(clk,reset,data_in,load_enable,data_out);
input clk,reset,load_enable;
input [7:0]data_in;
output reg [7:0] data_out;
always @ (posedge clk) begin 
if(reset)
data_out <= 8'b0;
else if(load_enable)
data_out <= data_in;
end 
endmodule
