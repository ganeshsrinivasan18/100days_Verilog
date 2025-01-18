module digital_ticketing_system(
//Declaring i/o ports
input clk,                 //clock signal for the system
input reset,               //reset signal for the system                
input purchase_vip,         //request for the purchase of VIP ticket
input purchase_regular,     //request for the purchase of Regular ticket
input purchase_student,     //request for the purchase of Student ticket
input purchase_senior,      //request for the purchase of senior ticket
output reg [7:0]available_vip, //Remaining ticket for VIP after purchasing
output reg [7:0]available_regular, //Remaining ticket for Regular after purchasing
output reg [7:0]available_student, //Remaining ticket for Student after purchasing
output reg [7:0]available_senior,  //Remaining ticket for Senior after purchasing
output reg purchase_success,  //Success signal if the purchase completed
output reg purchase_failed  //failed signal if the purchase is incompleted due to unavailability of tickets
);

//initial values for the availability of tickets for various categories
reg [7:0]total_vip = 8'd8;
reg [7:0]total_regular = 8'd12;
reg [7:0]total_student = 8'd5;
reg [7:0]total_senior = 8'd3;

//logic if the reset signal is high (clearing of values)
always @ (posedge clk or posedge reset) begin 
if (reset) begin 
available_vip <= total_vip;
available_regular <= total_regular;
available_student <= total_student;
available_senior <= total_senior;
purchase_success <= 0;
purchase_failed <= 0;
end 
//logic operation for the ticket purchasing
else begin 

//purchasing the VIP tickets
if(purchase_vip && available_vip > 0) begin
available_vip <= available_vip - 1;
purchase_success <= 1;
purchase_failed <= 0;
end 
//if VIP tickets is not available
else if (purchase_vip && available_vip == 0) begin 
purchase_failed <= 1;
purchase_success <= 0;
end

//purchasing the Regular tickets
if(purchase_regular && available_regular > 0) begin 
available_regular <= available_regular - 1;
purchase_success <= 1;
purchase_failed <= 0;
end 
//if Regular tickets is not available
else if (purchase_regular && available_regular == 0)begin 
purchase_failed <= 1;
purchase_success <= 0;
end

//purchasing the Student tickets
if(purchase_student && available_student > 0)begin 
available_student <= available_student - 1;
purchase_success <= 1;
purchase_failed <= 0;
end 
//if Student ticket is not available
else if (purchase_student && available_student == 0)begin 
purchase_failed <= 1;
purchase_success <= 0;
end

//purchasing Senior tickets
if(purchase_senior && available_senior > 0) begin 
available_senior <= available_senior - 1;
purchase_success <= 1;
purchase_failed <= 0;
end 
//if senior tickets not available
else if (purchase_senior && available_senior == 0)begin 
purchase_failed <= 1;
purchase_success <= 0;
end
end 
end
//end of operation
endmodule
