module pwm_generator_tb();
//declaring i/o ports
reg clk;
reg reset;
reg [7:0]duty_cycle;
wire pwm_out;
//instantiating the module
pwm_generator DUT (.clk(clk),
                   .reset(reset),
                   .duty_cycle(duty_cycle),
                   .pwm_out(pwm_out));

//instantiating the module and i/o ports
initial begin 
$dumpfile("pwm_generator.vcd");
$dumpvars(0,pwm_generator_tb);
$monitor("Time: %0t | Duty Cycle: %d | PWM_Out: %b",$time,(duty_cycle*100)/256,pwm_out);
end                   

//initialising the clock signal
initial begin 
clk=0;
forever #5 clk=~clk;
end

//initialising the reset and the values for pwm
initial begin 
//reset is high initially
reset=1;duty_cycle=8'b0;
//reset is released
#10 reset=0;

//Test case 1: duty cycle is 64 out off 255
#20duty_cycle = 8'd64;

//Test case 2: duty cycle is 128 out off 255
#200 duty_cycle = 8'd128;

//Test case 3: duty cycle is 192 out off 255
#200 duty_cycle = 8'd192;

//Test case 4: duty cycle is 255 out off 255
#200 duty_cycle = 8'd255;

#200 $finish;
//end of simulation
end
endmodule
