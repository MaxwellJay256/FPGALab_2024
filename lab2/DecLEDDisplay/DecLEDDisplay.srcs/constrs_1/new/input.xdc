set_property PACKAGE_PIN P17 [get_ports clk];
set_property PACKAGE_PIN P2 [get_ports dec_in[0]];
set_property PACKAGE_PIN P3 [get_ports dec_in[1]];
set_property PACKAGE_PIN P4 [get_ports dec_in[2]];
set_property PACKAGE_PIN P5 [get_ports dec_in[3]];
set_property PACKAGE_PIN R11 [get_ports refresh]; # S0 更新

set_property IOSTANDARD LVCMOS33 [get_ports clk];
set_property IOSTANDARD LVCMOS33 [get_ports dec_in[*]];
set_property IOSTANDARD LVCMOS33 [get_ports refresh];

set_property BITSTREAM.CONFIG.UNUSEDPIN PULLNONE [current_design];
