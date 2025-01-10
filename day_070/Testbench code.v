module voltage_monitoring_system_tb();
//declaring the parameters
parameter ADC_WIDTH = 12; 
parameter UPPER_THRESHOLD = 3000; 
parameter LOWER_THRESHOLD = 1000;
//instantiation the the i/o ports
reg clk;
reg reset;
reg [ADC_WIDTH-1 : 0]adc_value;
wire over_voltage;
wire under_voltage;
wire within_range;

//instantiation of the verilog code
voltage_monitoring_system DUT(.clk(clk),
                              .reset(reset),
                              .adc_value(adc_value),
                              .over_voltage(over_voltage),
                              .under_voltage(under_voltage),
                              .within_range(within_range));
//declaring the files
initial begin 
$dumpfile("voltage_monitoring_system.vcd");
$dumpvars(0,voltage_monitoring_system_tb);
end        

//initialising the clock
initial begin 
clk=0;
forever #5 clk=~clk;  
end               
//initialising the other values
initial begin 
reset=1;
adc_value=0;
#5 reset=0;
//Test case 1 - Voltage Within the range
#10 adc_value=2000;
  $display("Test case 1 : ADC:%d , Over-Voltage:%b , Under-Voltage:%b , Within-Range:%b",adc_value,over_voltage,under_voltage,within_range);

//Test case 2 - Over-Voltage
#10 adc_value=4000;
  $display("Test case 2 : ADC:%d , Over-Voltage:%b , Under-Voltage:%b , Within-Range:%b",adc_value,over_voltage,under_voltage,within_range);

//Test case 3 - Low-Voltage
#10 adc_value=500;
  $display("Test case 3 : ADC:%d , Over-Voltage:%b , Under-Voltage:%b , Within-Range:%b",adc_value,over_voltage,under_voltage,within_range);

//Test case 4 Random values
#10 adc_value=$random();
  $display("Test case 4 : ADC:%d , Over-Voltage:%b , Under-Voltage:%b , Within-Range:%b",adc_value,over_voltage,under_voltage,within_range);

//Test case 5 Random values
#10 adc_value=$random();
  $display("Test case 5 : ADC:%d , Over-Voltage:%b , Under-Voltage:%b , Within-Range:%b",adc_value,over_voltage,under_voltage,within_range);

//Test case 6 Random values
#10 adc_value=$random();
  $display("Test case 6 : ADC:%d , Over-Voltage:%b , Under-Voltage:%b , Within-Range:%b",adc_value,over_voltage,under_voltage,within_range);

//Test case 7 Random values
#10 adc_value=$random();
  $display("Test case 7 : ADC:%d , Over-Voltage:%b , Under-Voltage:%b , Within-Range:%b",adc_value,over_voltage,under_voltage,within_range);

//Test case 8 Random values
#10 adc_value=$random();
  $display("Test case 8 : ADC:%d , Over-Voltage:%b , Under-Voltage:%b , Within-Range:%b",adc_value,over_voltage,under_voltage,within_range);

//Test case 9 Random values
#10 adc_value=$random();
  $display("Test case 9 : ADC:%d , Over-Voltage:%b , Under-Voltage:%b , Within-Range:%b",adc_value,over_voltage,under_voltage,within_range);

//Test case 10 Random values
#10 adc_value=$random();
  $display("Test case 10 : ADC:%d , Over-Voltage:%b , Under-Voltage:%b , Within-Range:%b",adc_value,over_voltage,under_voltage,within_range);

//Test case 11 Random values
#10 adc_value=$random();
  $display("Test case 11 : ADC:%d , Over-Voltage:%b , Under-Voltage:%b , Within-Range:%b",adc_value,over_voltage,under_voltage,within_range);

//Test case 12 Random values
#10 adc_value=$random();
  $display("Test case 12 : ADC:%d , Over-Voltage:%b , Under-Voltage:%b , Within-Range:%b",adc_value,over_voltage,under_voltage,within_range);

//Test case 13 Random values
#10 adc_value=$random();
  $display("Test case 13 : ADC:%d , Over-Voltage:%b , Under-Voltage:%b , Within-Range:%b",adc_value,over_voltage,under_voltage,within_range);

//end of the simulation

#10 $finish;
end
endmodule
