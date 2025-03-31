module vga_controller (
    input clk,           // System clock (e.g., 50 MHz)
    input rst,           // Reset
    output reg hsync,    // Horizontal sync
    output reg vsync,    // Vertical sync
    output reg [9:0] x,  // X-coordinate (column)
    output reg [9:0] y,  // Y-coordinate (row)
    output reg video_on  // Video enable signal
);

    // VGA timing constants for 640x480 @ 60Hz
    parameter H_ACTIVE = 640;  // Active pixels per line
    parameter H_FP = 16;       // Front porch
    parameter H_SYNC = 96;     // Sync pulse width
    parameter H_BP = 48;       // Back porch
    parameter H_TOTAL = 800;   // Total pixels per line

    parameter V_ACTIVE = 480;  // Active lines per frame
    parameter V_FP = 10;       // Front porch
    parameter V_SYNC = 2;      // Sync pulse width
    parameter V_BP = 33;       // Back porch
    parameter V_TOTAL = 525;   // Total lines per frame

    reg [9:0] h_count = 0;  // Horizontal counter
    reg [9:0] v_count = 0;  // Vertical counter

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            h_count <= 0;
            v_count <= 0;
        end else begin
            if (h_count == H_TOTAL - 1) begin
                h_count <= 0;
                if (v_count == V_TOTAL - 1)
                    v_count <= 0;
                else
                    v_count <= v_count + 1;
            end else
                h_count <= h_count + 1;
        end
    end

    always @(*) begin
        hsync = (h_count >= (H_ACTIVE + H_FP) && h_count < (H_ACTIVE + H_FP + H_SYNC)) ? 0 : 1;
        vsync = (v_count >= (V_ACTIVE + V_FP) && v_count < (V_ACTIVE + V_FP + V_SYNC)) ? 0 : 1;
        video_on = (h_count < H_ACTIVE) && (v_count < V_ACTIVE);
        x = h_count;
        y = v_count;
    end
endmodule
