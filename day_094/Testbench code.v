
module alu_tb();

//Declaring the ports

wire [15:0] zout;
reg [3:0] rs1,rs2,rd,func;
reg [7:0] addr;
reg clk1,clk2;
integer k;

//Instantiate the module
alu DUT (.zout(zout),
         .rs1(rs1),
         .rs2(rs2),
         .rd(rd),
         .func(func),
         .addr(addr),
         .clk1(clk1),
         .clk2(clk2));
         

//initializing the two phase clock   
initial begin 
clk1=0; clk2=0;
repeat (20) 
begin 
#5 clk1 = 1; #5 clk1 = 0;
#5 clk2 = 1; #5 clk2 = 0;
end 
end 

//Declaring the various operation
initial 
for (k=0; k<16; k=k+1)
DUT.regbank[k] = k;

initial 
begin 

#5 rs1 = 3; rs2 = 5; rd = 10; func = 0; addr = 125; 
#20 rs1 = 3; rs2 = 8; rd = 12; func = 2; addr = 126;
#20 rs1 = 10; rs2 = 5; rd = 14; func = 1; addr = 128;
#20 rs1 = 7; rs2 = 3; rd = 13; func = 11; addr = 127;
#20 rs1 = 10; rs2 = 5; rd = 15; func = 1; addr = 129;
#20 rs1 = 12; rs2 = 13; rd = 16; func = 0; addr = 130;

#60 for (k=125; k<131; k=k+1)
$display ("Mem[%3d] = %3d", k,DUT.mem[k]);
end

//instantiating the module and testbench
initial begin 
$dumpfile ("alu.vcd");
$dumpvars (0,alu_tb);
$monitor ("Time: %3d, F = %3d", $time,zout);
#300 $finish;
end 

//end of simulation
endmodule
