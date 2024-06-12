set_property PACKAGE_PIN P2 [get_ports minuend[0]];
set_property PACKAGE_PIN P3 [get_ports minuend[1]];
set_property PACKAGE_PIN P4 [get_ports minuend[2]];
set_property PACKAGE_PIN P5 [get_ports minuend[3]];

set_property PACKAGE_PIN R1 [get_ports subtrahend[0]];
set_property PACKAGE_PIN N4 [get_ports subtrahend[1]];
set_property PACKAGE_PIN M4 [get_ports subtrahend[2]];
set_property PACKAGE_PIN R2 [get_ports subtrahend[3]];

set_property IOSTANDARD LVCMOS33 [get_ports minuend[*]];
set_property IOSTANDARD LVCMOS33 [get_ports subtrahend[*]];

set_property BITSTREAM.CONFIG.UNUSEDPIN PULLNONE [current_design];
