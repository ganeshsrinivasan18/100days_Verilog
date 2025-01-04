module barrel_shifter(data_in,shift_amt,shift_dir,data_out);
parameter WIDTH = 8;  //width of the input
input [WIDTH-1 : 0] data_in;  // data_in (input)
input [3:0] shift_amt;        // shift amount to shift the data (0-15)
input shift_dir;              // shift direction left=0;right=1
output reg [WIDTH-1 : 0] data_out;  // shifted data

//shifting operation
always @ (*) begin 
if(shift_dir)
data_out <= data_in >> shift_amt;
else 
data_out <= data_in << shift_amt;
end
endmodule
