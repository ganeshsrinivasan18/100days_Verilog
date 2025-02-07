module car_parking_sensor(
    input wire clk,                   // Clock signal
    input wire reset,                 // Reset signal
    input wire [7:0] distance,        // Distance from sensor (in cm)
    output reg [2:0] led_display,     // LED display for warning levels
    output reg buzzer                 // Buzzer signal for proximity alert
);

    // Parameters for distance thresholds
    parameter SAFE_THRESHOLD = 8'd100;   // Distance > 100 cm is safe
    parameter CAUTION_THRESHOLD = 8'd50; // Distance between 50 and 100 cm is caution
    parameter DANGER_THRESHOLD = 8'd0;   // Distance < 50 cm is danger

    // Warning levels for LEDs
    parameter SAFE = 3'b001;      // Green LED for safe
    parameter CAUTION = 3'b011;   // Yellow LEDs for caution
    parameter DANGER = 3'b111;    // Red LEDs for danger

    // Always block for distance evaluation
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            led_display <= SAFE;  // Default to safe
            buzzer <= 0;          // Turn off buzzer
        end else begin
            if (distance > SAFE_THRESHOLD) begin
                led_display <= SAFE;  // Safe zone
                buzzer <= 0;          // No buzzer
            end else if (distance > CAUTION_THRESHOLD) begin
                led_display <= CAUTION;  // Caution zone
                buzzer <= 1;             // Beeping buzzer
            end else begin
                led_display <= DANGER;  // Danger zone
                buzzer <= 1;            // Continuous buzzer
            end
        end
    end
endmodule
