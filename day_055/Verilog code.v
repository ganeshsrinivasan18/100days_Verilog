module sign_detector(data_in,sign);
input [7:0]data_in;
output sign;
assign sign = data_in[7]; //MSB bit determines the sign of the bit
endmodule
