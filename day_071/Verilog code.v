module motion (
    input wire clk,                    // Clock signal
    input wire reset,                  // Reset signal
    input wire [7:0] sensor_data,      // Sensor data input (8-bit array)
    input wire [7:0] threshold,        // Threshold for detecting motion
    output reg motion_detected         // Output: motion detected flag
);

    // Register to store previous sensor data
    reg [7:0] prev_sensor_data;

    // Combinational logic for motion detection
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            motion_detected <= 0;      // Reset motion detection flag
            prev_sensor_data <= 0;    // Clear previous sensor data
        end else begin
            // Compare current and previous sensor data
            if ((sensor_data > prev_sensor_data + threshold) || 
                (sensor_data < prev_sensor_data - threshold)) begin
                motion_detected <= 1; // Motion detected
            end else begin
                motion_detected <= 0; // No motion
            end
            // Update previous sensor data
            prev_sensor_data <= sensor_data;
        end
    end
endmodule
