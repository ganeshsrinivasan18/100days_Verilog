module tb_wpt_monitoring;

    reg clk, reset;
    reg [7:0] vin, iin, vout, iout;
    wire [7:0] efficiency;
    wire overload, low_eff;

    // Instantiate the module
    wpt_monitoring uut (
        .clk(clk), .reset(reset),
        .vin(vin), .iin(iin),
        .vout(vout), .iout(iout),
        .efficiency(efficiency),
        .overload(overload), .low_eff(low_eff)
    );

    // Clock generator
    always #5 clk = ~clk;

    initial begin
        // Initialize
        clk = 0; reset = 1;
        vin = 0; iin = 0; vout = 0; iout = 0;
        #10 reset = 0;

        // Case 1: Normal operation (V_in = 10V, I_in = 1A, V_out = 9V, I_out = 0.9A)
        #10 vin = 8'd10; iin = 8'd100; vout = 8'd9; iout = 8'd90;

        // Case 2: Low efficiency (V_out drops)
        #10 vout = 8'd5; iout = 8'd50;

        // Case 3: Overload (I_in exceeds threshold)
        #10 iin = 8'd220;

        // Case 4: Power loss (V_in = 0, I_in = 0)
        #10 vin = 8'd0; iin = 8'd0;

        // End simulation
        #50 $finish;
    end

    // Monitor the values
    initial begin
        $monitor("Time=%0t | Vin=%dV Iin=%dmA | Vout=%dV Iout=%dmA | Eff=%d%% | Overload=%b | Low_Eff=%b", 
                  $time, vin, iin, vout, iout, efficiency, overload, low_eff);
    end

endmodule
