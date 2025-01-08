module simple_timer_tb();
reg clk,reset,start;
wire time_out;
simple_timer DUT (.clk(clk),.reset(reset),.start(start),.time_out(time_out));
initial begin 
$dumpfile("simple_timer.vcd");
$dumpvars(0,simple_timer_tb);
$monitor($time,"clk=%b,reset=%b,start=%b,time_out=%b",clk,reset,start,time_out);
end
initial begin 
clk=0;
forever #5 clk = ~ clk;
end
initial begin 
$display("Applying Reset....");
reset=1;
start=0;
#5 reset=0;
$display("Starting Timer...");
#10 start=1;
$display("Waiting for timeout...");
#320 start=0;
if(time_out)begin 
$display("Timeout occurred at time %0t",$time);
end else begin 
$display("Timeout did not occur.");
end
$finish;
end
endmodule
