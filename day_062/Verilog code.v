module universal_register(clk,reset,load,data_in,data_out,shift_right,shift_left);
input clk,reset,shift_right,shift_left,load;
input [3:0]data_in;
output reg [3:0]data_out;

always @ (posedge clk or posedge reset)begin 
if(reset)begin 
data_out <= 4'b0;
end 

else if(load)begin 
data_out <= data_in;
end 

else if(shift_left)begin 
data_out <= {data_out[2:0],1'b0};
end 

else if(shift_right)begin 
data_out <= {1'b0,data_out[3:1]};
end
end
endmodule
