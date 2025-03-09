
module atm_controller(
    input clk,
    input reset,
    input card_inserted,
    input valid_card,
    input pin_entered,
    input correct_pin,
    input transaction_type,  // 0: Withdrawal, 1: Deposit
    input balance_sufficient,
    input complete,
    output reg [2:0] state,
    output reg error,
    output reg transaction_done
);

    // State Encoding
    localparam IDLE = 3'b000,
               CARD_VERIFICATION = 3'b001,
               PIN_ENTRY = 3'b010,
               TRANSACTION_SELECTION = 3'b011,
               WITHDRAWAL = 3'b100,
               DEPOSIT = 3'b101,
               TRANSACTION_COMPLETE = 3'b110,
               ERROR_STATE = 3'b111;

    reg [2:0] next_state;

    // State Transition Logic
    always @(posedge clk or posedge reset) begin
        if (reset)
            state <= IDLE;
        else
            state <= next_state;
    end

    // Next State and Output Logic
    always @(*) begin
        // Default outputs
        next_state = state;
        error = 0;
        transaction_done = 0;

        case (state)
            IDLE: begin
                if (card_inserted)
                    next_state = CARD_VERIFICATION;
            end

            CARD_VERIFICATION: begin
                if (valid_card)
                    next_state = PIN_ENTRY;
                else
                    next_state = ERROR_STATE;
            end

            PIN_ENTRY: begin
                if (pin_entered) begin
                    if (correct_pin)
                        next_state = TRANSACTION_SELECTION;
                    else
                        next_state = ERROR_STATE;
                end
            end

            TRANSACTION_SELECTION: begin
                if (transaction_type == 0)
                    next_state = WITHDRAWAL;
                else
                    next_state = DEPOSIT;
            end

            WITHDRAWAL: begin
                if (balance_sufficient)
                    next_state = TRANSACTION_COMPLETE;
                else
                    next_state = ERROR_STATE;
            end

            DEPOSIT: begin
                next_state = TRANSACTION_COMPLETE;
            end

            TRANSACTION_COMPLETE: begin
                transaction_done = 1;
                next_state = IDLE;
            end

            ERROR_STATE: begin
                error = 1;
                next_state = IDLE;
            end
        endcase
    end
endmodule
