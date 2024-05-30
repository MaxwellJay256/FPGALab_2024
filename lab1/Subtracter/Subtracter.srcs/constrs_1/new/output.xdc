set_property PACKAGE_PIN G1 [get_ports DK[0]]
set_property PACKAGE_PIN H1 [get_ports DK[1]]

set_property PACKAGE_PIN B4 [get_ports outseg_high[0]]
set_property PACKAGE_PIN A4 [get_ports outseg_high[1]]
set_property PACKAGE_PIN A3 [get_ports outseg_high[2]]
set_property PACKAGE_PIN B1 [get_ports outseg_high[3]]
set_property PACKAGE_PIN A1 [get_ports outseg_high[4]]
set_property PACKAGE_PIN B3 [get_ports outseg_high[5]]
set_property PACKAGE_PIN B2 [get_ports outseg_high[6]]
set_property PACKAGE_PIN D5 [get_ports outseg_high[7]]

set_property PACKAGE_PIN D4 [get_ports outseg_low[0]]
set_property PACKAGE_PIN E3 [get_ports outseg_low[1]]
set_property PACKAGE_PIN D3 [get_ports outseg_low[2]]
set_property PACKAGE_PIN F4 [get_ports outseg_low[3]]
set_property PACKAGE_PIN F3 [get_ports outseg_low[4]]
set_property PACKAGE_PIN E2 [get_ports outseg_low[5]]
set_property PACKAGE_PIN D2 [get_ports outseg_low[6]]
set_property PACKAGE_PIN H2 [get_ports outseg_low[7]]

set_property IOSTANDARD LVCMOS33 [get_ports DK[*]]
set_property IOSTANDARD LVCMOS33 [get_ports outseg_high[*]]
set_property IOSTANDARD LVCMOS33 [get_ports outseg_low[*]]

set_property BITSTREAM.CONFIG.UNUSEDPIN PULLNONE [current_design];
