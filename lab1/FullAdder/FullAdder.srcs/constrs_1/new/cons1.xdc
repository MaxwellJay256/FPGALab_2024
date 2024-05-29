set_property PACKAGE_PIN M4 [get_ports in_CI];
set_property PACKAGE_PIN N4 [get_ports in_A];
set_property PACKAGE_PIN R1 [get_ports in_B];

set_property PACKAGE_PIN F6 [get_ports out_S];
set_property PACKAGE_PIN G4 [get_ports out_CO];

set_property IOSTANDARD LVCMOS33 [get_ports in_CI];
set_property IOSTANDARD LVCMOS33 [get_ports in_A];
set_property IOSTANDARD LVCMOS33 [get_ports in_B];
set_property IOSTANDARD LVCMOS33 [get_ports out_S];
set_property IOSTANDARD LVCMOS33 [get_ports out_CO];

set_property BITSTREAM.CONFIG.UNUSEDPIN PULLNONE [current_design];
