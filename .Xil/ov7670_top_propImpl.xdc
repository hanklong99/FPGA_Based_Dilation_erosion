set_property SRC_FILE_INFO {cfile:c:/Users/11986/Desktop/Dilation_erosion/OV7670_VGA_Dispaly.srcs/sources_1/ip/clock/clock.xdc rfile:../OV7670_VGA_Dispaly.srcs/sources_1/ip/clock/clock.xdc id:1 order:EARLY scoped_inst:clock_inst/inst} [current_design]
current_instance clock_inst/inst
set_property src_info {type:SCOPED_XDC file:1 line:57 export:INPUT save:INPUT read:READ} [current_design]
set_input_jitter [get_clocks -of_objects [get_ports clk_in1]] 0.08
