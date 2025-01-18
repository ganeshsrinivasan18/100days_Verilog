module digital_toll_system_tb();
//declaring i/o ports
reg reset;
reg enable;
reg [1:0]vehicle_type;
reg [7:0]balance;
wire [7:0]updated_balance;
wire [7:0]toll_fee;
wire reject;

//instantiating the module
digital_toll_system DUT(.reset(reset),
                        .enable(enable),
                        .vehicle_type(vehicle_type),
                        .balance(balance),
                        .updated_balance(updated_balance),
                        .toll_fee(toll_fee),
                        .reject(reject));
                        
//declaring the module and the testbench
initial begin 
$dumpfile("digital_toll_system.vcd");
$dumpvars(0,digital_toll_system_tb);
end

//various test scenario for the toll system
initial begin 
//Test case 1: Bike with sufficient balance
vehicle_type = 2'b00 ; balance = 8'd15 ; enable = 1 ; reset = 0 ;
#20
$display("Vehicle : Bike | Toll Fee = %d |  Balance = %d | Updated Balance = %d | Reject = %b",toll_fee,balance,updated_balance,reject);

//Test case 2: Car with sufficient balance
vehicle_type = 2'b01 ; balance = 8'd20 ; enable = 1 ; reset = 0 ;
#20
$display("Vehicle : Car | Toll Fee = %d |  Balance = %d | Updated Balance = %d | Reject = %b",toll_fee,balance,updated_balance,reject);

//Test case 3: Bus with sufficient balance
vehicle_type = 2'b10 ; balance = 8'd25 ; enable = 1 ; reset = 0 ;
#20
$display("Vehicle : Bus | Toll Fee = %d |  Balance = %d | Updated Balance = %d | Reject = %b",toll_fee,balance,updated_balance,reject);

//Test case 4: Truck with sufficient balance
vehicle_type = 2'b11 ; balance = 8'd30 ; enable = 1 ; reset = 0 ;
#20
$display("Vehicle : Truck | Toll Fee = %d |  Balance = %d | Updated Balance = %d | Reject = %b",toll_fee,balance,updated_balance,reject);

//Test case 5: Truck with insufficient balance
vehicle_type = 2'b11 ; balance = 8'd10 ; enable = 1 ; reset = 0 ;
#20
$display("Vehicle : Truck | Toll Fee = %d |  Balance = %d | Updated Balance = %d | Reject = %b",toll_fee,balance,updated_balance,reject);

//Test case 6: Bus with insufficient balance
vehicle_type = 2'b10 ; balance = 8'd12 ; enable = 1 ; reset = 0 ;
#20
$display("Vehicle : Bus | Toll Fee = %d |  Balance = %d | Updated Balance = %d | Reject = %b",toll_fee,balance,updated_balance,reject);

//Test case 7: Car with insufficient balance
vehicle_type = 2'b01 ; balance = 8'd5 ; enable = 1 ; reset = 0 ;
#20
$display("Vehicle : Car | Toll Fee = %d |  Balance = %d | Updated Balance = %d | Reject = %b",toll_fee,balance,updated_balance,reject);

//Test case 8: Bike with insufficient balance
vehicle_type = 2'b00 ; balance = 8'd2 ; enable = 1 ; reset = 0 ;
#20
$display("Vehicle : Bike | Toll Fee = %d |  Balance = %d | Updated Balance = %d | Reject = %b",toll_fee,balance,updated_balance,reject);

#10 $finish; 
end
//End of simulation
endmodule
