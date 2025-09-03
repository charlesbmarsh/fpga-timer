# FPGA Countdown Timer

This project implements a fully functional countdown timer on a Basys3 FPGA board using Verilog. The system showcases a complete digital design, including button-controlled operations, a 7-segment display, and LED indicators, all of which are built-in to the Basys3.

### Project Goals

This project was a personal exercise to re-familiarize myself with key concepts in digital design and FPGA programming, including:

* **Verilog**
* **Synchronous logic**
* **Button debouncing**
* **Modulo counters**
* **Multiplexing**

### Features

The timer offers the following features:

* **MM:SS** countdown timer format.
* **Start/stop** and **reset** controls via pushbuttons.
* A **7-segment display** to show the current time.
* Flashing **onboard LEDs** to signal when the timer reaches zero.

### Usage

If you would like to use this project for yourself, you'll need the following:

* A **Basys3 FPGA** board
* **Xilinx Vivado** development suite

1.  Create a new project in Xilinx Vivado (or any other fpga development enviornment)
2.  Copy all `.v` files into the "Design Sources" folder
3.  Copy `const.xdc` into into the "Constraints" folder
4.  Synthesize and implement the design.
5.  Program the bitstream to your Basys3 board.

### *Parts of this project's HDL code was taken from David J. Marion aka FPGA Dude, notably the button debouncing and 7-seg driver
