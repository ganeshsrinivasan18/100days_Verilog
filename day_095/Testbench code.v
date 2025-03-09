module tb_atm_controller();

    // Inputs
    reg clk, reset, card_inserted, valid_card, pin_entered, correct_pin, transaction_type, balance_sufficient, complete;
    
    // Outputs
    wire [2:0] state;
    wire error, transaction_done;

    // Instantiate the ATM Controller
    atm_controller uut (
        .clk(clk),
        .reset(reset),
        .card_inserted(card_inserted),
        .valid_card(valid_card),
        .pin_entered(pin_entered),
        .correct_pin(correct_pin),
        .transaction_type(transaction_type),
        .balance_sufficient(balance_sufficient),
        .complete(complete),
        .state(state),
        .error(error),
        .transaction_done(transaction_done)
    );

    // Clock Generation
    always #5 clk = ~clk;

    // Monitor Outputs
    always @(posedge clk) begin
        $display("Time: %0t | State: %b | Error: %b | Transaction Done: %b", 
                 $time, state, error, transaction_done);
    end

    // Test Sequence
    initial begin
        // Initialize Inputs
        clk = 0;
        reset = 1;
        card_inserted = 0;
        valid_card = 0;
        pin_entered = 0;
        correct_pin = 0;
        transaction_type = 0;
        balance_sufficient = 0;
        complete = 0;

        // Reset the system
        #10 reset = 0;
        $display("\n[INFO] System Reset Completed");

        // Test Case: Valid Withdrawal
        #10 card_inserted = 1;
        $display("[INFO] Card Inserted");

        #10 valid_card = 1;
        $display("[INFO] Card Validated");

        #10 pin_entered = 1; 
        correct_pin = 1;
        $display("[INFO] PIN Entered and Verified");

        #10 transaction_type = 0;
        $display("[INFO] Withdrawal Selected");

        #10 balance_sufficient = 1;
        $display("[INFO] Balance Check Passed");

        #10 complete = 1;
        $display("[INFO] Transaction Completed");

        #10 complete = 0;

        // Test Case: Invalid Card
        #10 reset = 1;
        #10 reset = 0;
        card_inserted = 1;
        $display("\n[INFO] Card Inserted (Invalid Case)");

        #10 valid_card = 0;
        $display("[ERROR] Invalid Card Detected");

        // Test Case: Incorrect PIN
        #10 reset = 1;
        #10 reset = 0;
        card_inserted = 1;
        valid_card = 1;
        $display("\n[INFO] Card Inserted (Incorrect PIN Case)");

        #10 pin_entered = 1;
        correct_pin = 0;
        $display("[ERROR] Incorrect PIN Entered");

        // Test Case: Deposit
        #10 reset = 1;
        #10 reset = 0;
        card_inserted = 1;
        valid_card = 1;
        $display("\n[INFO] Card Inserted (Deposit Case)");

        #10 pin_entered = 1;
        correct_pin = 1;
        $display("[INFO] PIN Verified");

        #10 transaction_type = 1;
        $display("[INFO] Deposit Selected");

        #10 complete = 1;
        $display("[INFO] Transaction Completed");

        #20 $stop;
    end
endmodule
