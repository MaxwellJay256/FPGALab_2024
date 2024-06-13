set_property PACKAGE_PIN P17 [get_ports clk];
set_property PACKAGE_PIN R17 [get_ports cin]; # S1
set_property PACKAGE_PIN R11 [get_ports rst]; # S0

set_property PACKAGE_PIN K2 [get_ports dout[0]]; # LD2_0
set_property PACKAGE_PIN J2 [get_ports dout[1]]; # LD2_1
set_property PACKAGE_PIN J3 [get_ports dout[2]]; # LD2_2
set_property PACKAGE_PIN H4 [get_ports dout[3]]; # LD2_3
set_property PACKAGE_PIN J4 [get_ports dout[4]]; # LD2_4
set_property PACKAGE_PIN G3 [get_ports dout[5]]; # LD2_5
set_property PACKAGE_PIN G4 [get_ports dout[6]]; # LD2_6
set_property PACKAGE_PIN F6 [get_ports dout[7]]; # LD2_7

set_property PACKAGE_PIN K1 [get_ports btn]; # LD1_7

set_property IOSTANDARD LVCMOS33 [get_ports clk];
set_property IOSTANDARD LVCMOS33 [get_ports cin]; # S1
set_property IOSTANDARD LVCMOS33 [get_ports rst]; # S0
set_property IOSTANDARD LVCMOS33 [get_ports dout[*]];
set_property IOSTANDARD LVCMOS33 [get_ports btn]; # LD1_7

set_property BITSTREAM.CONFIG.UNUSEDPIN PULLNONE [current_design]
