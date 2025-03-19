module wpt_monitoring (
    input wire clk, reset,               // Clock and reset
    input wire [7:0] vin, iin, vout, iout, // Voltage and current inputs (8-bit ADC)
    output reg [7:0] efficiency,         // Efficiency percentage
    output reg overload, low_eff          // Fault detection outputs
);

    reg [15:0] p_in, p_out;  // 16-bit registers for power calculation

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            efficiency <= 8'd0;
            overload <= 1'b0;
            low_eff <= 1'b0;
        end else begin
            // Calculate input and output power
            p_in  <= vin * iin;  
            p_out <= vout * iout;  

            // Prevent division by zero
            if (p_in != 0)
                efficiency <= (p_out * 100) / p_in; 
            else
                efficiency <= 8'd0; 

            // Overload detection (Example: If input current > 2A)
            overload <= (iin > 8'd200) ? 1'b1 : 1'b0; 

            // Efficiency warning (Example: If efficiency < 75%)
            low_eff <= (efficiency < 8'd75) ? 1'b1 : 1'b0;
        end
    end

endmodule
