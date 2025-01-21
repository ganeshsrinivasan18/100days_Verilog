module single_port_ram
#(
//Declaration of the PORTS SIZE
parameter ADDR_WIDTH = 10,
parameter DATA_WIDTH = 8,
parameter MEMORY_SIZE = 1024
)
//Declaration of i/o ports
(
input clk,                      //clock signal for the synchronization
input [ADDR_WIDTH - 1:0]addr,   //Address for the RAM storage
input [DATA_WIDTH - 1:0]data_in,//Data input for the write operation in RAM
input wr,                       //Write button for the write operation
output reg [DATA_WIDTH - 1:0]data_out   //data output for the Read operation
);

reg [DATA_WIDTH - 1:0] mem [MEMORY_SIZE -1:0]; //RAM for the Read and Write operation

//logic for the Write operation
always @ (posedge clk) begin 
if (wr) begin 
mem[addr] <= data_in;
data_out <= 0;
end 
end 

//logic for the Read operation
always @ (posedge clk) begin
if(!wr)begin 
data_out <= mem[addr];

end 
end
endmodule
