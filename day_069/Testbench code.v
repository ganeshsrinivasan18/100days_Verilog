module threshold_indicator_tb();
reg clk;
reg reset;
reg [7:0]data_in;
reg [7:0]threshold;
reg [7:0]hysteresis;
wire threshold_exceeded;

threshold_indicator DUT(.clk(clk),.reset(reset),.data_in(data_in),.threshold(threshold),.hysteresis(hysteresis),.threshold_exceeded(threshold_exceeded));

initial begin 
$dumpfile("threshold_indicator.vcd");
$dumpvars(0,threshold_indicator_tb);
end 

initial begin 
clk=0;
forever #5 clk =~clk;
end

initial begin 
reset=1;data_in=8'd0;threshold=8'd100;hysteresis=8'd10;
#5 reset=0;
#10 data_in = 8'd50;
$display("Test case 1 : Data=%d , Exceeded=%b",data_in,threshold_exceeded);

#10 data_in = 8'd150;
$display("Test case 2 : Data=%d , Exceeded=%b",data_in,threshold_exceeded);

#10 data_in = 8'd85;
$display("Test case 3 : Data=%d , Exceeded=%b",data_in,threshold_exceeded);

#10 data_in = 8'd100;
$display("Test case 4 : Data=%d , Exceeded=%b",data_in,threshold_exceeded);

#10 data_in = $random();
$display("Test case 5 : Data=%d , Exceeded=%b",data_in,threshold_exceeded);

#10 data_in = $random();
$display("Test case 6 : Data=%d , Exceeded=%b",data_in,threshold_exceeded);

#10 data_in = $random();
$display("Test case 7 : Data=%d , Exceeded=%b",data_in,threshold_exceeded);

#10 data_in = $random();
$display("Test case 8 : Data=%d , Exceeded=%b",data_in,threshold_exceeded);

#10 data_in = $random();
$display("Test case 9 : Data=%d , Exceeded=%b",data_in,threshold_exceeded);

#10 data_in = $random();
$display("Test case 10 : Data=%d , Exceeded=%b",data_in,threshold_exceeded);

#10 $finish;
end
endmodule
