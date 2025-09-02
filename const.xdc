# Clock signal
set_property PACKAGE_PIN W5 [get_ports clk_100MHz]							
	set_property IOSTANDARD LVCMOS33 [get_ports clk_100MHz]
	create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports clk_100MHz]
 
 # LEDs
## LED 12
set_property PACKAGE_PIN L1 	 [get_ports {blink}]					
set_property IOSTANDARD LVCMOS33 [get_ports {blink}]

set_property PACKAGE_PIN P1 	 [get_ports {blink}]					
set_property IOSTANDARD LVCMOS33 [get_ports {blink}]

set_property PACKAGE_PIN N3 	 [get_ports {blink}]					
set_property IOSTANDARD LVCMOS33 [get_ports {blink}]

set_property PACKAGE_PIN P3 	 [get_ports {blink}]					
set_property IOSTANDARD LVCMOS33 [get_ports {blink}]

set_property PACKAGE_PIN U3 	 [get_ports {blink}]					
set_property IOSTANDARD LVCMOS33 [get_ports {blink}]

set_property PACKAGE_PIN W3 	 [get_ports {blink}]					
set_property IOSTANDARD LVCMOS33 [get_ports {blink}]

set_property PACKAGE_PIN V3 	 [get_ports {blink}]					
set_property IOSTANDARD LVCMOS33 [get_ports {blink}]

set_property PACKAGE_PIN V13 	 [get_ports {blink}]					
set_property IOSTANDARD LVCMOS33 [get_ports {blink}]

set_property PACKAGE_PIN V14 	 [get_ports {blink}]					
set_property IOSTANDARD LVCMOS33 [get_ports {blink}]

set_property PACKAGE_PIN U14 	 [get_ports {blink}]					
set_property IOSTANDARD LVCMOS33 [get_ports {blink}]

set_property PACKAGE_PIN U15 	 [get_ports {blink}]					
set_property IOSTANDARD LVCMOS33 [get_ports {blink}]

set_property PACKAGE_PIN W18 	 [get_ports {blink}]					
set_property IOSTANDARD LVCMOS33 [get_ports {blink}]

set_property PACKAGE_PIN V19 	 [get_ports {blink}]					
set_property IOSTANDARD LVCMOS33 [get_ports {blink}]

set_property PACKAGE_PIN U19 	 [get_ports {blink}]					
set_property IOSTANDARD LVCMOS33 [get_ports {blink}]

set_property PACKAGE_PIN E19 	 [get_ports {blink}]					
set_property IOSTANDARD LVCMOS33 [get_ports {blink}]

set_property PACKAGE_PIN U16 	 [get_ports {blink}]					
set_property IOSTANDARD LVCMOS33 [get_ports {blink}]


#7 segment display
set_property PACKAGE_PIN W7 	 [get_ports {seg[0]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {seg[0]}]
set_property PACKAGE_PIN W6 	 [get_ports {seg[1]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {seg[1]}]
set_property PACKAGE_PIN U8 	 [get_ports {seg[2]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {seg[2]}]
set_property PACKAGE_PIN V8 	 [get_ports {seg[3]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {seg[3]}]
set_property PACKAGE_PIN U5 	 [get_ports {seg[4]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {seg[4]}]
set_property PACKAGE_PIN V5 	 [get_ports {seg[5]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {seg[5]}]
set_property PACKAGE_PIN U7 	 [get_ports {seg[6]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {seg[6]}]
set_property PACKAGE_PIN U2 	 [get_ports {an[0]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {an[0]}]
set_property PACKAGE_PIN U4 	 [get_ports {an[1]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {an[1]}]
set_property PACKAGE_PIN V4 	 [get_ports {an[2]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {an[2]}]
set_property PACKAGE_PIN W4 	 [get_ports {an[3]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {an[3]}]


##Buttons
## btnc
set_property PACKAGE_PIN U18 	 [get_ports start_stop]						
set_property IOSTANDARD LVCMOS33 [get_ports start_stop]
## btnL
set_property PACKAGE_PIN W19 	 [get_ports set_min]						
set_property IOSTANDARD LVCMOS33 [get_ports set_min]
## btnR
set_property PACKAGE_PIN T17 	 [get_ports set_sec]						
set_property IOSTANDARD LVCMOS33 [get_ports set_sec]
## btnU
set_property PACKAGE_PIN T18 	 [get_ports reset]						
set_property IOSTANDARD LVCMOS33 [get_ports reset]