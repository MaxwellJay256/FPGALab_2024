set_property PACKAGE_PIN P17 [get_ports clk];
set_property PACKAGE_PIN N4 [get_ports reset]; # SW1
set_property PACKAGE_PIN M4 [get_ports en]; # SW2
set_property PACKAGE_PIN R1 [get_ports d]; # SW0
set_property PACKAGE_PIN K2 [get_ports q]; # LD2_0

set_property IOSTANDARD LVCMOS33 [get_ports clk];
set_property IOSTANDARD LVCMOS33 [get_ports reset];
set_property IOSTANDARD LVCMOS33 [get_ports en];
set_property IOSTANDARD LVCMOS33 [get_ports d];
set_property IOSTANDARD LVCMOS33 [get_ports q];

set_property BITSTREAM.CONFIG.UNUSEDPIN PULLNONE [current_design];
