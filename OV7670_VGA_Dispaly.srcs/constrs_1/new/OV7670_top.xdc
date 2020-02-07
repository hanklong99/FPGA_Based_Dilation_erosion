#OV7670

set_property IOSTANDARD LVCMOS33 [get_ports OV7670_SIOC]
set_property IOSTANDARD LVCMOS33 [get_ports OV7670_VSYNC]
set_property IOSTANDARD LVCMOS33 [get_ports OV7670_PCLK]
set_property IOSTANDARD LVCMOS33 [get_ports {OV7670_D[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {OV7670_D[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {OV7670_D[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {OV7670_D[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports OV7670_RESET]

set_property IOSTANDARD LVCMOS33 [get_ports OV7670_SIOD]
set_property IOSTANDARD LVCMOS33 [get_ports OV7670_HREF]
set_property IOSTANDARD LVCMOS33 [get_ports OV7670_XCLK]
set_property IOSTANDARD LVCMOS33 [get_ports {OV7670_D[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {OV7670_D[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {OV7670_D[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {OV7670_D[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports OV7670_PWDN]

set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets OV7670_PCLK_IBUF]

#HDMI
set_property IOSTANDARD TMDS_33 [get_ports TMDS_Clk_p]
set_property IOSTANDARD TMDS_33 [get_ports TMDS_Clk_n]
set_property IOSTANDARD TMDS_33 [get_ports {TMDS_Data_p[0]}]
set_property IOSTANDARD TMDS_33 [get_ports {TMDS_Data_n[0]}]
set_property IOSTANDARD TMDS_33 [get_ports {TMDS_Data_p[1]}]
set_property IOSTANDARD TMDS_33 [get_ports {TMDS_Data_n[1]}]


#OV7670
set_property PACKAGE_PIN W13 [get_ports OV7670_SIOC]
set_property PACKAGE_PIN V12 [get_ports OV7670_VSYNC]
set_property PACKAGE_PIN W16 [get_ports OV7670_PCLK]
set_property PACKAGE_PIN V16 [get_ports {OV7670_D[7]}]
set_property PACKAGE_PIN W19 [get_ports {OV7670_D[5]}]
set_property PACKAGE_PIN W18 [get_ports {OV7670_D[3]}]
set_property PACKAGE_PIN U19 [get_ports {OV7670_D[1]}]
set_property PACKAGE_PIN U18 [get_ports OV7670_RESET]

set_property PACKAGE_PIN T10 [get_ports OV7670_SIOD]
set_property PACKAGE_PIN T11 [get_ports OV7670_HREF]
set_property PACKAGE_PIN Y14 [get_ports OV7670_XCLK]
set_property PACKAGE_PIN W14 [get_ports {OV7670_D[6]}]
set_property PACKAGE_PIN Y17 [get_ports {OV7670_D[4]}]
set_property PACKAGE_PIN Y16 [get_ports {OV7670_D[2]}]
set_property PACKAGE_PIN Y19 [get_ports {OV7670_D[0]}]
set_property PACKAGE_PIN Y18 [get_ports OV7670_PWDN]

#HDMI
set_property PACKAGE_PIN L16 [get_ports TMDS_Clk_p]
set_property PACKAGE_PIN L17 [get_ports TMDS_Clk_n]
set_property PACKAGE_PIN K17 [get_ports {TMDS_Data_p[0]}]
set_property PACKAGE_PIN K18 [get_ports {TMDS_Data_n[0]}]
set_property PACKAGE_PIN K19 [get_ports {TMDS_Data_p[1]}]
set_property PACKAGE_PIN J19 [get_ports {TMDS_Data_n[1]}]
set_property PACKAGE_PIN J18 [get_ports {TMDS_Data_p[2]}]
set_property PACKAGE_PIN H18 [get_ports {TMDS_Data_n[2]}]


#other
set_property IOSTANDARD LVCMOS33 [get_ports clk_125M]
set_property IOSTANDARD LVCMOS33 [get_ports LED]
set_property IOSTANDARD LVCMOS33 [get_ports rst_n]
set_property IOSTANDARD LVCMOS33 [get_ports sw1]
set_property IOSTANDARD LVCMOS33 [get_ports btn0]
set_property IOSTANDARD LVCMOS33 [get_ports btn1]
set_property IOSTANDARD LVCMOS33 [get_ports btn2]
set_property IOSTANDARD LVCMOS33 [get_ports btn3]

set_property PACKAGE_PIN H16 [get_ports clk_125M]
set_property PACKAGE_PIN R14 [get_ports LED]
set_property PACKAGE_PIN M20 [get_ports rst_n]
set_property PACKAGE_PIN M19 [get_ports sw1]
set_property PACKAGE_PIN D19 [get_ports btn0]
set_property PACKAGE_PIN D20 [get_ports btn1]
set_property PACKAGE_PIN L20 [get_ports btn2]
set_property PACKAGE_PIN L19 [get_ports btn3]