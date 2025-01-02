module sign_detector_tb();
reg [7:0]data_in;
wire sign;
sign_detector DUT(.data_in(data_in),.sign(sign));
initial begin 
$dumpfile("sign_detector.vcd");
$dumpvars(0,sign_detector_tb);
$monitor($time,"data_in=%b,sign=%b",data_in,sign);
end 
initial begin 
data_in=$random();
#10 data_in=$random();
#10 data_in=$random();
#10 data_in=$random();
#10 data_in=$random();
#10 data_in=$random();
#10 data_in=$random();
#10 data_in=$random();
#10 data_in=$random();
#10 data_in=$random();
$finish;
end
endmodule
