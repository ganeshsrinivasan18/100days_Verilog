module universal_register_tb();
reg clk,reset,shift_right,shift_left,load;
reg [3:0]data_in;
wire [3:0]data_out;
universal_register DUT(.clk(clk),.reset(reset),.load(load),.shift_right(shift_right),.shift_left(shift_left),.data_in(data_in),.data_out(data_out));
initial begin 
$dumpfile("universal_register.vcd");
$dumpvars(0,universal_register_tb);
$monitor($time,"clk=%b,reset=%b,load=%b,data_in=%b,data_out=%b,shift_left=%b,shift_right=%b",clk,reset,load,data_in,data_out,shift_left,shift_right);
end 
initial begin 
clk=0;
forever #5 clk=~clk;
end 
initial begin 
reset=1;load=0;shift_left=0;shift_right=0;data_in=4'b1011;
#5 reset=0;
#10 load=1;
#10 load=0;
#20 shift_left=1;
#10 shift_left=0;
#40 shift_right=1;
#10 shift_right=0;

#40 data_in=4'b1010;
#10 load=1;
#10 load=0;
#20 shift_left=1;
#10 shift_left=0;
#40 shift_right=1;
#10 shift_right=0;

 $finish;
end
endmodule
