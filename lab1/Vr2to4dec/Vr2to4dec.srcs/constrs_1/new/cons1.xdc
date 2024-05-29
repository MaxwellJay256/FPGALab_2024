set_property PACKAGE_PIN M4 [get_ports EN];
set_property PACKAGE_PIN N4 [get_ports in_A1];
set_property PACKAGE_PIN R1 [get_ports in_A0];

set_property PACKAGE_PIN K2 [get_ports out_Y0];
set_property PACKAGE_PIN J2 [get_ports out_Y1];
set_property PACKAGE_PIN J3 [get_ports out_Y2];
set_property PACKAGE_PIN H4 [get_ports out_Y3];

set_property IOSTANDARD LVCMOS33 [get_ports EN];
set_property IOSTANDARD LVCMOS33 [get_ports in_A1];
set_property IOSTANDARD LVCMOS33 [get_ports in_A0];
set_property IOSTANDARD LVCMOS33 [get_ports out_Y0];
set_property IOSTANDARD LVCMOS33 [get_ports out_Y1];
set_property IOSTANDARD LVCMOS33 [get_ports out_Y2];
set_property IOSTANDARD LVCMOS33 [get_ports out_Y3];

set_property BITSTREAM.CONFIG.UNUSEDPIN PULLNONE [current_design];
