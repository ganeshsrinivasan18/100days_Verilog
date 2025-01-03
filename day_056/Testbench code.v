module loadable_register_tb();
reg clk,reset,load_enable;
reg [7:0]data_in;
wire [7:0]data_out;
loadable_register DUT(.clk(clk),.reset(reset),.load_enable(load_enable),.data_in(data_in),.data_out(data_out));
initial begin 
$dumpfile("loadable_register.vcd");
$dumpvars(0,loadable_register_tb);
$monitor($time,"clk=%b,reset=%b,load_enable=%b,data_in=%b,data_out=%b",clk,reset,load_enable,data_in,data_out);
end 
initial begin 
clk=0;
forever #5 clk=~clk;
end 
initial begin 
reset=1;
#5 reset=0;load_enable=1;data_in=$random();
#10 data_in=$random();
#10 data_in=$random();
#10 load_enable=0;
#10 data_in=$random();
#10 data_in=$random();
#10 load_enable=1;
#10 data_in=$random();
#10 data_in=$random();
$finish;
end
endmodule
