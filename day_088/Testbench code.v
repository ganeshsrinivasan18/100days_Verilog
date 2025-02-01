module digi_pot_tb;

    // Testbench signals
    reg clk;
    reg reset;
    reg inc;
    reg dec;
    reg load;
    reg [7:0] resistance_in;
    wire [7:0] resistance_out;

    // Instantiate the DUT (Device Under Test)
    digi_pot uut (
        .clk(clk),
        .reset(reset),
        .inc(inc),
        .dec(dec),
        .load(load),
        .resistance_in(resistance_in),
        .resistance_out(resistance_out)
    );

    // Clock generation
    always #5 clk = ~clk; // 10ns clock period

    // Test sequence
    initial begin
        // Initialize signals
        clk = 0;
        reset = 1;
        inc = 0;
        dec = 0;
        load = 0;
        resistance_in = 8'd0;

        #10 reset = 0;  // Deassert reset
        #10;            // Small delay

        // Check default resistance value
        $display("Initial resistance: %d", resistance_out);

        // Test increment functionality
        inc = 1;
        #10; inc = 0; #10;
        $display("Resistance after increment: %d", resistance_out);

        // Test multiple increments
        repeat (5) begin
            inc = 1;
            #10;
            inc = 0;
            #10;
        end
        $display("Resistance after 5 more increments: %d", resistance_out);

        // Test decrement functionality
        dec = 1;
        #10; dec = 0; #10;
        $display("Resistance after decrement: %d", resistance_out);

        // Test multiple decrements
        repeat (3) begin
            dec = 1;
            #10;
            dec = 0;
            #10;
        end
        $display("Resistance after 3 more decrements: %d", resistance_out);

        // Test load functionality
        resistance_in = 8'd50;
        load = 1;
        #10 load = 0;
        $display("Resistance after loading 50: %d", resistance_out);


        // Finish simulation
        $finish;
    end

    // Monitor changes in resistance
    initial begin
        $monitor("Time: %t | Resistance: %d", $time, resistance_out);
    end

endmodule
