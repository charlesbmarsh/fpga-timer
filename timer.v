`timescale 1ns / 1ps

module timer(
    input clk_100MHz,
    input reset,
    input start_stop,
    input set_min,
    input set_sec,  
    output timer_done,
    output tick_1Hz,
    output [3:0] sec_1s,
    output [3:0] sec_10s,
    output [3:0] min_1s,
    output [3:0] min_10s   
    );

    //---------------------------------------------------------
    // Signals for button debouncing
    //---------------------------------------------------------
    reg a, b, c, d, e, f, g, h, i;
    wire db_set_min, db_set_sec, db_start_stop;

    // Debounce the set_min input
    always @(posedge clk_100MHz) begin
        a <= set_min;
        b <= a;
        c <= b;
    end
    assign db_set_min = c;

    // Debounce the set_sec input
    always @(posedge clk_100MHz) begin
        d <= set_sec;
        e <= d;
        f <= e;
    end
    assign db_set_sec = f;

    // Debounce the start_stop input
    always @(posedge clk_100MHz) begin
        g <= start_stop;
        h <= g;
        i <= h;
    end
    assign db_start_stop = i;

    //---------------------------------------------------------
    // Create the 1Hz signal from the 100MHz clock
    //---------------------------------------------------------
    reg [31:0] ctr_1Hz = 32'h0;
    reg tick_1Hz_pulse = 1'b0;
    reg timer_done = 1'b0;
    
    // A counter that toggles a signal every 50,000,000 clock cycles (1 second)[cite: 78].
    always @(posedge clk_100MHz or posedge reset)
        if (reset)
            ctr_1Hz <= 32'h0;
        else
            if (ctr_1Hz == 99_999_999) begin
                ctr_1Hz <= 32'h0;
                tick_1Hz_pulse <= 1'b1;
            end
            else begin
                ctr_1Hz <= ctr_1Hz + 1;
                tick_1Hz_pulse <= 1'b0;
            end
    
    assign tick_1Hz = tick_1Hz_pulse;

    //---------------------------------------------------------
    // Counter registers for the timer
    // minutes_ctr is now 7 bits to hold values up to 99
    //---------------------------------------------------------
    reg [5:0] seconds_ctr = 6'd0;
    reg [6:0] minutes_ctr = 7'd0;
    reg enable_countdown = 1'b0;

    //---------------------------------------------------------
    // Logic for setting the initial timer value
    //---------------------------------------------------------
    reg [3:0] db_set_min_r = 4'b0;
    reg [3:0] db_set_sec_r = 4'b0;
    reg [3:0] db_start_stop_r = 4'b0;
    
    always @(posedge clk_100MHz) begin
        db_set_min_r <= {db_set_min_r[2:0], db_set_min};
        db_set_sec_r <= {db_set_sec_r[2:0], db_set_sec};
        db_start_stop_r <= {db_start_stop_r[2:0], db_start_stop};
    end
    
    wire db_min_pos_edge = db_set_min_r[3] & ~db_set_min_r[2];
    wire db_sec_pos_edge = db_set_sec_r[3] & ~db_set_sec_r[2];
    wire db_start_stop_pos_edge = db_start_stop_r[3] & ~db_start_stop_r[2];

    always @(posedge clk_100MHz or posedge reset) begin
        if (reset) begin
            minutes_ctr <= 7'd0;
            seconds_ctr <= 6'd0;
            enable_countdown <= 1'b0;
            timer_done <= 1'b0;
        end else begin
            if (db_min_pos_edge & ~enable_countdown) begin
                minutes_ctr <= (minutes_ctr == 99) ? 7'd0 : minutes_ctr + 1;
            end
            if (db_sec_pos_edge & ~enable_countdown) begin
                seconds_ctr <= (seconds_ctr == 59) ? 6'd0 : seconds_ctr + 1;
            end
            
            if (db_start_stop_pos_edge) begin
                enable_countdown <= ~enable_countdown;
                timer_done <= 1'b0;
            end
            
            // countdown logic
            if (enable_countdown && tick_1Hz_pulse) begin
                if (seconds_ctr == 6'd0) begin
                    if (minutes_ctr != 7'd0) begin
                        seconds_ctr <= 6'd59;
                        minutes_ctr <= minutes_ctr - 1;
                    end else begin
                        seconds_ctr <= 6'd0;
                        enable_countdown <= 1'b0; // Stop when timer reaches 0
                        timer_done <= 1'b1;
                    end
                end else begin
                    seconds_ctr <= seconds_ctr - 1;
                end
            end
        end
    end
    
    //---------------------------------------------------------
    // Convert counters to BCD format for display
    //---------------------------------------------------------
    assign sec_1s  = seconds_ctr % 10;
    assign sec_10s = seconds_ctr / 10;
    assign min_1s  = minutes_ctr % 10;
    assign min_10s = minutes_ctr / 10;

endmodule