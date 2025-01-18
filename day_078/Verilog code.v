module digital_toll_system(
//declaring i/o ports
input reset,        //reset signal for the system
input enable,       //enable signal to allow the vehicles
input [1:0]vehicle_type,    //2'b00=Bike; 2'b01=Car; 2'b10=Bus; 2'b11=Truck
input [7:0]balance,         //balance signal after the deduction
output reg [7:0]toll_fee,   //toll fee based on the vehicle type
output reg [7:0]updated_balance, //display the remaining balance after the deduction
output reg reject       //reject signal if the balance is less than toll fee                
);

//logic for the toll system
always @ (*) begin 
//if reset signal is high
if(reset) begin 
toll_fee = 8'd0;
updated_balance = 8'd0;
reject = 0; 
end 
//if enable signal is high
else if (enable) begin 
//case statement for the toll fee based on vehicle type
case(vehicle_type)
2'b00: toll_fee = 8'd5;   //Bike
2'b01: toll_fee = 8'd10;  //Car
2'b10: toll_fee = 8'd15;  //Bus
2'b11: toll_fee = 8'd20;  //Truck
default: toll_fee = 8'd0;
endcase
//Balance updation logic
if(balance >= toll_fee) begin 
updated_balance = (balance - toll_fee);
reject = 0;
end 
//logic for the display of updated balance
else begin 
updated_balance = balance;
reject = 1;
end
end
//if none of the condition matches
else begin 
toll_fee = 8'd0;
updated_balance = balance;
reject = 0;
end
end
//end of operation
endmodule
