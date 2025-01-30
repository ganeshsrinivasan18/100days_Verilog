module reg_file(
//Declaring i/o ports

input clk,                         //clock system for the synchronization
input reset,                      //reset signal for clearing the values
input write,                     //write signal to write data in the register
input [4:0]sr1,sr2,dr,          //source register 1 and 2 , destination register
input [31:0]wrdata,            //write data has 32 bit width
output [31:0]rddata1,rddata2, //read data 1 and 2 has also 32 bit  
integer k                       // an integer k for the register value during reset
);

//regsiter bit size and width size
reg [31:0] regfile [31:0];


//assigning the read data 
assign rddata1 = regfile[sr1];
assign rddata2 = regfile[sr2];

//logic for reset and write in to the register
always @ (posedge clk) begin 
//if reset signal is high
if (reset) begin 
//k starts from 0 to 31 for all 32 registers are 0 if reset signal is high
for(k=0 ; k<32 ; k=k+1) begin 
regfile[k] <= 0;
end 
end 

else begin 
//if write signal is high write the data in to the register
if(write)
regfile[dr] <= wrdata;
end 
end 
//end of logic
endmodule
