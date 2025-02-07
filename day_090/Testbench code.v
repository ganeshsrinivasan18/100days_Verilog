module car_parking_sensor_tb;

    // Testbench signals
    reg clk;
    reg reset;
    reg [7:0] distance;
    wire [2:0] led_display;
    wire buzzer;

    // Instantiate the DUT (Device Under Test)
    car_parking_sensor dut (
        .clk(clk),
        .reset(reset),
        .distance(distance),
        .led_display(led_display),
        .buzzer(buzzer)
    );

    // Clock generation (50 MHz => 20 ns period)
    always #10 clk = ~clk;

    // Test stimulus
    initial begin
        // Initialize signals
        clk = 0;
        reset = 1;
        distance = 8'd0;
        
        // Apply reset
        #20 reset = 0;
        
        //Pre message
        
        $display("Car Parking Sensor.....");
        
        // Test Case 1: Safe Zone (> 100 cm)
        #20 distance = 8'd120;  // Safe distance
        #40;                    // Wait and observe
        $display("Safe Zone: Distance = %d cm | LED = %b | Buzzer = %b", distance, led_display, buzzer);

        // Test Case 2: Caution Zone (50 - 100 cm)
        #20 distance = 8'd75;  // Caution distance
        #40;                   // Wait and observe
        $display("Caution Zone: Distance = %d cm | LED = %b | Buzzer = %b", distance, led_display, buzzer);

        // Test Case 3: Danger Zone (< 50 cm)
        #20 distance = 8'd30;  // Danger distance
        #40;                   // Wait and observe
        $display("Danger Zone: Distance = %d cm | LED = %b | Buzzer = %b", distance, led_display, buzzer);

        // Test Case 4: Edge Case - Exactly at threshold
        #20 distance = 8'd50;  // Edge case at caution limit
        #40;                   
        $display("Edge Case (Caution): Distance = %d cm | LED = %b | Buzzer = %b", distance, led_display, buzzer);

        #20 distance = 8'd100;  // Edge case at safe limit
        #40;
        $display("Edge Case (Safe): Distance = %d cm | LED = %b | Buzzer = %b", distance, led_display, buzzer);

        // End simulation
        #20;
        $stop;
    end
endmodule
