module Motion_Detector_tb;

    // Testbench signals
    reg clk;
    reg reset;
    reg [7:0] sensor_data;
    reg [7:0] threshold;
    wire motion_detected;

    // Instantiate the Motion Detector
    motion uut (
        .clk(clk),
        .reset(reset),
        .sensor_data(sensor_data),
        .threshold(threshold),
        .motion_detected(motion_detected)
    );

    // Clock generation
    always #5 clk = ~clk; // 10 ns clock period

    // Stimulus generation
    initial begin
        // Initialize signals
        clk = 0;
        reset = 1;
        sensor_data = 0;
        threshold = 10; // Set motion detection threshold

        // Apply reset
        #20 reset = 0;

        // Case 1: No motion
        #50 sensor_data = 8'd5;
        #50 sensor_data = 8'd5;

        // Case 2: Motion detected (increase)
        #50 sensor_data = 8'd20;

        // Case 3: Motion detected (decrease)
        #50 sensor_data = 8'd0;

        // Case 4: No significant motion
        #50 sensor_data = 8'd8;

        // End simulation
        #100 $stop;
    end
endmodule
