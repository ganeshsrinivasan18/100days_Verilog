module lifo_stack (
    input clk,            // Clock signal
    input rst,            // Synchronous reset
    input push,           // Push enable
    input pop,            // Pop enable
    input [7:0] din,      // Data input (8-bit)
    output reg [7:0] dout,// Data output (8-bit)
    output reg full,      // Full flag
    output reg empty      // Empty flag
);
    
    parameter DEPTH = 16;       // Stack depth
    parameter ADDR_WIDTH = 4;   // Address width (log2(16) = 4)

    reg [7:0] stack_mem [DEPTH-1:0]; // Memory block for stack
    reg [ADDR_WIDTH-1:0] sp; // Stack pointer

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            sp <= 0;
        end 
        else begin
            if (push && !full) begin
                stack_mem[sp] <= din;  // Store data at stack top
                sp <= sp + 1;          // Increment stack pointer
            end
            if (pop && !empty) begin
                sp <= sp - 1;          // Decrement stack pointer
            end
        end
    end

    always @(*) begin
        if (sp > 0)
            dout = stack_mem[sp-1];  // Output the top value
        else
            dout = 8'b0;
    end

    always @(*) begin
        full = (sp == DEPTH);   // Full when SP reaches depth
        empty = (sp == 0);      // Empty when SP is 0
    end

endmodule
