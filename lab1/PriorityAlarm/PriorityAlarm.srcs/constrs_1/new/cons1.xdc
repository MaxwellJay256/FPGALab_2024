set_property PACKAGE_PIN R1 [get_ports in_I[0]];
set_property PACKAGE_PIN N4 [get_ports in_I[1]];
set_property PACKAGE_PIN M4 [get_ports in_I[2]];
set_property PACKAGE_PIN R2 [get_ports in_I[3]];

set_property PACKAGE_PIN F6 [get_ports out_Y[0]];
set_property PACKAGE_PIN G4 [get_ports out_Y[1]];
set_property PACKAGE_PIN G3 [get_ports out_Y[2]];

set_property IOSTANDARD LVCMOS33 [get_ports in_I[*]];
set_property IOSTANDARD LVCMOS33 [get_ports out_Y[*]];

set_property BITSTREAM.CONFIG.UNUSEDPIN PULLNONE [current_design];
