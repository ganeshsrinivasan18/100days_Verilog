module read_only_memory#(
//Declaring the parameter values
parameter ADDR_SIZE = 4,
parameter WORD_SIZE = 8

)
(
//Declaring the i/o ports
input [ADDR_SIZE -1:0]addr,
output reg [WORD_SIZE -1:0]data_out
);
//Defining a ROM of size based on the word size and addrr size
reg [WORD_SIZE -1:0] rom [0:(2**ADDR_SIZE)-1];

//initializing the ROM content
initial begin 
rom[0] = 8'h1A;     //Data at address 0

rom[1] = 8'h2B;     //Data at address 1

rom[2] = 8'h3C;     //Data at address 2

rom[3] = 8'h4D;     //Data at address 3

rom[4] = 8'h5E;     //Data at address 4

rom[5] = 8'h6F;     //Data at address 5

rom[6] = 8'h7A;     //Data at address 6

rom[7] = 8'h8B;     //Data at address 7

end

//data output values based on the address value
always @ (addr) begin 
data_out = rom[addr];
end

endmodule
