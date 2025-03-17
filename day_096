module fir_filter (
    input wire clk,                      // Clock signal
    input wire reset,                    // Reset signal
    input wire signed [7:0] data_in,      // 8-bit input data
    output reg signed [15:0] data_out     // 16-bit output data
);

    // Filter coefficients (Example values)
    parameter signed [7:0] h0 = 8'd1, h1 = 8'd2, h2 = 8'd3, h3 = 8'd4;

    // Shift registers to store previous input samples
    reg signed [7:0] x0, x1, x2, x3;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            // Clear all stored samples and output on reset
            x0 <= 0;
            x1 <= 0;
            x2 <= 0;
            x3 <= 0;
            data_out <= 0;
        end else begin
            // Shift the previous samples
            x3 <= x2;
            x2 <= x1;
            x1 <= x0;
            x0 <= data_in; // New input sample

            // Perform the FIR filter multiplication and summation
            data_out <= (h0 * x0) + (h1 * x1) + (h2 * x2) + (h3 * x3);
        end
    end
endmodule
