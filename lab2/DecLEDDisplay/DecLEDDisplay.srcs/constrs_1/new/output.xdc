set_property PACKAGE_PIN F1 [get_ports CS[0]]; # DK6 低段数码管
set_property PACKAGE_PIN G1 [get_ports CS[1]]; # DK5 高段数码管

set_property PACKAGE_PIN D4 [get_ports outseg[0]];
set_property PACKAGE_PIN E3 [get_ports outseg[1]];
set_property PACKAGE_PIN D3 [get_ports outseg[2]];
set_property PACKAGE_PIN F4 [get_ports outseg[3]];
set_property PACKAGE_PIN F3 [get_ports outseg[4]];
set_property PACKAGE_PIN E2 [get_ports outseg[5]];
set_property PACKAGE_PIN D2 [get_ports outseg[6]];
set_property PACKAGE_PIN H2 [get_ports outseg[7]];

set_property IOSTANDARD LVCMOS33 [get_ports CS[*]];
set_property IOSTANDARD LVCMOS33 [get_ports outseg[*]];

set_property BITSTREAM.CONFIG.UNUSEDPIN PULLNONE [current_design];
