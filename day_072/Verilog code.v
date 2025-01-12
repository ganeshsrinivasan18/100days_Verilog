module signal_pattern_detector(clk,reset,serial_in,detected);
parameter [3:0] PATTERN=4'b1011; //pre-defined value for the detection
input clk; // clock signal for the synchronization
input reset; // reset signal 
input serial_in;  //serial data input 
output reg detected; //high if the data matches the pattern

reg [3:0] shift_reg; //shifter for the detection of pattern

//logic operation for the shift register

always @ (posedge clk or posedge reset) begin 
if (reset) 
shift_reg <= 4'b0000;
else 
shift_reg <= {shift_reg[2:0],serial_in};
end 

//logic operation for the detection of signal

always @ (posedge clk or posedge reset) begin 
if (reset) 
detected <= 1'b0;
else 
detected <= (shift_reg == PATTERN);
end

endmodule
