`timescale 1ns / 1ps

// 7 Segment Display Timer
// Authored by Charles Marsh
// Inspired by David J. Marion aka FPGA Dude's clock project
// Created 9/2/2025

module top(
    input clk_100MHz,
    input reset,                // btnU
    input set_min,              // btnL
    input set_sec,              // btnR
    input start_stop,           // btnC
    output blink,               // LEDs 
    output [0:6] seg,           // Cathodes
    output [3:0] an             // Anodes
    );
    
    // Internal Connections
    wire [3:0] sec_1s, sec_10s, min_1s, min_10s;
    
    
    timer tmr(
        .clk_100MHz(clk_100MHz),
        .reset(reset),
        .start_stop(start_stop),
        .set_min(set_min),
        .set_sec(set_sec),
        .tick_1Hz(),
        .sec_10s(sec_10s),
        .sec_1s(sec_1s),
        .min_10s(min_10s),
        .min_1s(min_1s),
        .timer_done(timer_is_done)
        );
    
    blinker blk(
        .clk_100MHz(clk_100MHz),
        .timer_done(timer_is_done),
        .blink(blink)
        );
    
    seg_control seg7(
        .clk_100MHz(clk_100MHz),
        .reset(reset),
        .sec_10s(sec_10s),
        .sec_1s(sec_1s),
        .min_1s(min_1s),
        .min_10s(min_10s),
        .seg(seg),
        .an(an)
        );
    
endmodule
