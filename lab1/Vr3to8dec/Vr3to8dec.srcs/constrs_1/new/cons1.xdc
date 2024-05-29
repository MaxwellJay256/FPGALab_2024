set_property PACKAGE_PIN P5 [get_ports EN];
set_property PACKAGE_PIN M4 [get_ports in_Vr3[0]];
set_property PACKAGE_PIN N4 [get_ports in_Vr3[1]];
set_property PACKAGE_PIN R1 [get_ports in_Vr3[2]];

set_property PACKAGE_PIN K2 [get_ports out_Vr8[0]];
set_property PACKAGE_PIN J2 [get_ports out_Vr8[1]];
set_property PACKAGE_PIN J3 [get_ports out_Vr8[2]];
set_property PACKAGE_PIN H4 [get_ports out_Vr8[3]];
set_property PACKAGE_PIN J4 [get_ports out_Vr8[4]];
set_property PACKAGE_PIN G3 [get_ports out_Vr8[5]];
set_property PACKAGE_PIN G4 [get_ports out_Vr8[6]];
set_property PACKAGE_PIN F6 [get_ports out_Vr8[7]];

set_property IOSTANDARD LVCMOS33 [get_ports EN];
set_property IOSTANDARD LVCMOS33 [get_ports in_Vr3[*]];
set_property IOSTANDARD LVCMOS33 [get_ports out_Vr8[*]];

set_property BITSTREAM.CONFIG.UNUSEDPIN PULLNONE [current_design];
