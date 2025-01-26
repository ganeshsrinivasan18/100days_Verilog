module energy_meter_tb();
//Declaring i/o ports
reg [7:0]voltage;
reg [7:0]current;
reg [15:0]threshold;
reg reset;
reg enable;
wire [15:0]power;
wire over_load;
wire protection;


//instantiating the module
energy_meter DUT (.voltage(voltage),
                  .current(current),
                  .threshold(threshold),
                  .reset(reset),
                  .enable(enable),
                  .power(power),
                  .over_load(over_load),
                  .protection(protection));


//instantiating the module and testbench
initial begin 
$dumpfile("energy_meter.vcd");
$dumpvars(0,energy_meter_tb);
end 


//Test cases for the energy meter with overload

initial begin 
$display("Energy Meter with Over Load Protection System.....");


//Test case 1: Normal Operation
voltage = 8'd10 ; current = 8'd5 ; threshold = 16'd100 ; enable = 1 ; reset = 0;
#10;
$display("Test case 1 - Power: %d | Overload: %b | Protection: %b",power,over_load,protection);


//Test case 2: overload condition
voltage = 8'd10 ; current = 8'd20 ; threshold = 16'd100 ; enable = 1 ; reset = 0;
#10;
$display("Test case 2 - Power: %d | Overload: %b | Protection: %b",power,over_load,protection);


//Test case 3: Reset function after overload
reset = 1;
#10;
$display("Test case 3 After Reseet - Power: %d | Overload: %b | Protection: %b",power,over_load,protection);
reset = 0; 


//Test case 4: Again Normal Operation
voltage = 8'd20 ; current = 8'd4 ; threshold = 16'd100 ; enable = 1 ; reset = 0;
#10;
$display("Test case 4 - Power: %d | Overload: %b | Protection: %b",power,over_load,protection);


//Test case 5: Disabled system (enable is low)
 enable = 0 ; reset = 0;
#10;
$display("Test case 5 - Disabled - Power: %d | Overload: %b | Protection: %b",power,over_load,protection);


//Test case 6: Overload operation
voltage = 8'd10 ; current = 8'd40 ; threshold = 16'd100 ; enable = 1 ; reset = 0;
#10;
$display("Test case 6 - Power: %d | Overload: %b | Protection: %b",power,over_load,protection);


//Test case 7: Reset function after overload
reset = 1;
#10;
$display("Test case 7 After Reset - Power: %d | Overload: %b | Protection: %b",power,over_load,protection);
reset = 0; 

#10 $finish;
end
//End of simulation
endmodule
