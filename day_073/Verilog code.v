module queue_management_system(
//declaring i/o ports
input clk,              //clock signal for the synchronization
input reset,            //reset signal for the system
input next,             //next button for the next selection of customer
input [2:0] counter_select, //counter selection button (8 counters)
output reg [2:0]counter_display,  //to display the selected counter
output reg [7:0]customer_number_display //to display the customer number(token)
);
//interrnal signals declaration
reg [7:0]customer_number;
reg [2:0]counter;

//reset signal operation

always @ (posedge clk or posedge reset) begin 
if (reset)begin 
customer_number <= 8'b00000001;
counter <= 3'b000;
counter_display <= 3'b000; 
customer_number_display <= 8'b00000001;
end

// queue management operation

else if (next) begin 
customer_number <= customer_number + 1;
customer_number_display <= customer_number;
end 
end 

//counter selection operation
always @ (counter_select) begin 
counter_display <= counter_select;
end

//end of operation
endmodule
