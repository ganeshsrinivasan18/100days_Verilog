module morphological_operations (
    input clk,  
    input reset,  
    input [7:0] pixel_in,  // Input binary pixel (0 or 1)
    input mode, // 0 = Erosion, 1 = Dilation
    output reg [7:0] pixel_out  // Processed pixel
);

    reg [7:0] window [0:8]; // 3×3 pixel window buffer
    integer i;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            for (i = 0; i < 9; i = i + 1)
                window[i] <= 8'd0;
            pixel_out <= 8'd0;
        end else begin
            // Shift window values (new pixel enters)
            for (i = 8; i > 0; i = i - 1)
                window[i] <= window[i - 1];

            window[0] <= pixel_in; // New input pixel

            if (mode) begin
                // Dilation: Maximum of 3x3 window
                pixel_out <= (window[0] | window[1] | window[2] | 
                              window[3] | window[4] | window[5] | 
                              window[6] | window[7] | window[8]);
            end else begin
                // Erosion: Minimum of 3x3 window
                pixel_out <= (window[0] & window[1] & window[2] & 
                              window[3] & window[4] & window[5] & 
                              window[6] & window[7] & window[8]);
            end
        end
    end
endmodule
