module single_port_ram_tb();
//Declaration of the PORTS SIZE
parameter ADDR_WIDTH = 10;
parameter DATA_WIDTH = 8;
parameter MEMORY_SIZE = 1024;
//Declaration of i/o ports
reg clk;
reg wr;
reg[ADDR_WIDTH -1:0]addr;
reg[DATA_WIDTH -1:0]data_in;
wire [DATA_WIDTH-1:0]data_out;

//instantiating the module
single_port_ram DUT(.clk(clk),
                    .wr(wr),
                    .addr(addr),
                    .data_in(data_in),
                    .data_out(data_out));
                    
//initializing the clock
initial begin 
clk=0;
forever #5 clk=~clk;
end

//instantiating the module and the testbech 
initial begin 
$dumpfile("single_port_ram.vcd");
$dumpvars(0,single_port_ram_tb);
end

//declaring initial values
initial begin 
wr=0;
addr=0;
data_in=0;

//Test cases for various WRITE  and READ operations

//Write data to address 3 
#10 wr=1; addr=3; data_in=8'hA5;
#10 $display ("Time: %0t | Write Enable: %b | Address: %d | Input Data: %d | Output Data: %d",$time,wr,addr,data_in,data_out);

//Read data from address 3
#10 wr=0; addr=3;
#10 $display ("Time: %0t | Write Enable: %b | Address: %d | Output Data: %d",$time,wr,addr,data_out);

//Write data to address 5
#10 wr=1; addr=5; data_in=8'h5A;
#10 $display ("Time: %0t | Write Enable: %b | Address: %d | Input Data: %d | Output Data: %d",$time,wr,addr,data_in,data_out);

//Read data from address 5
#10 wr=0; addr=5;
#10 $display ("Time: %0t | Write Enable: %b | Address: %d | Output Data: %d",$time,wr,addr,data_out);

//Write data to address 6 
#10 wr=1; addr=6; data_in=8'hB6;
#10 $display ("Time: %0t | Write Enable: %b | Address: %d | Input Data: %d | Output Data: %d",$time,wr,addr,data_in,data_out);

//Read data from address 6
#10 wr=0; addr=6;
#10 $display ("Time: %0t | Write Enable: %b | Address: %d | Output Data: %d",$time,wr,addr,data_out);

//Write data to address 9 
#10 wr=1; addr=9; data_in=8'h76;
#10 $display ("Time: %0t | Write Enable: %b | Address: %d | Input Data: %d | Output Data: %d",$time,wr,addr,data_in,data_out);

//Read data from address 9
#10 wr=0; addr=9;
#10 $display ("Time: %0t | Write Enable: %b | Address: %d | Output Data: %d",$time,wr,addr,data_out);

$finish;

end
//end of simulation
endmodule
