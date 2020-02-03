# 
# Synthesis run script generated by Vivado
# 

set TIME_start [clock seconds] 
proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
set_param chipscope.maxJobs 2
set_param xicom.use_bs_reader 1
set_msg_config -id {Common 17-41} -limit 10000000
create_project -in_memory -part xc7z020clg400-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -source 4 -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir C:/Users/11986/Desktop/Dilation_erosion/OV7670_VGA_Dispaly.cache/wt [current_project]
set_property parent.project_path C:/Users/11986/Desktop/Dilation_erosion/OV7670_VGA_Dispaly.xpr [current_project]
set_property XPM_LIBRARIES {XPM_CDC XPM_MEMORY} [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property ip_repo_paths c:/Users/vivado-library-master/ip [current_project]
update_ip_catalog
set_property ip_cache_permissions disable [current_project]
read_verilog -library xil_defaultlib {
  C:/Users/11986/Desktop/Dilation_erosion/OV7670_VGA_Dispaly.srcs/sources_1/new/I2C_AV_Config.v
  C:/Users/11986/Desktop/Dilation_erosion/OV7670_VGA_Dispaly.srcs/sources_1/new/I2C_Controller.v
  C:/Users/11986/Desktop/Dilation_erosion/OV7670_VGA_Dispaly.srcs/sources_1/new/I2C_OV7670_RGB565_Config.v
  C:/Users/11986/Desktop/Dilation_erosion/OV7670_VGA_Dispaly.srcs/sources_1/new/Img_Processor.v
  C:/Users/11986/Desktop/Dilation_erosion/OV7670_VGA_Dispaly.srcs/sources_1/new/Median_Filter.v
  C:/Users/11986/Desktop/Dilation_erosion/OV7670_VGA_Dispaly.srcs/sources_1/new/Median_Filter_3x3.v
  C:/Users/11986/Desktop/Dilation_erosion/OV7670_VGA_Dispaly.srcs/sources_1/new/RGB_YCbCr_Gray.v
  C:/Users/11986/Desktop/Dilation_erosion/OV7670_VGA_Dispaly.srcs/sources_1/new/Shift_RAM_3X3.v
  C:/Users/11986/Desktop/Dilation_erosion/OV7670_VGA_Dispaly.srcs/sources_1/new/Sort.v
  C:/Users/11986/Desktop/Dilation_erosion/OV7670_VGA_Dispaly.srcs/sources_1/new/VGA_Display.v
  C:/Users/11986/Desktop/Dilation_erosion/OV7670_VGA_Dispaly.srcs/sources_1/new/debounce.v
  C:/Users/11986/Desktop/Dilation_erosion/OV7670_VGA_Dispaly.srcs/sources_1/new/dilation.v
  C:/Users/11986/Desktop/Dilation_erosion/OV7670_VGA_Dispaly.srcs/sources_1/new/erosion.v
  C:/Users/11986/Desktop/Dilation_erosion/OV7670_VGA_Dispaly.srcs/sources_1/new/ov7670_capture.v
  C:/Users/11986/Desktop/Dilation_erosion/OV7670_VGA_Dispaly.srcs/sources_1/new/position.v
  C:/Users/11986/Desktop/Dilation_erosion/OV7670_VGA_Dispaly.srcs/sources_1/new/ov7670_top.v
}
read_ip -quiet C:/Users/11986/Desktop/Dilation_erosion/OV7670_VGA_Dispaly.srcs/sources_1/ip/rgb2dvi_0/rgb2dvi_0.xci
set_property used_in_implementation false [get_files -all c:/Users/11986/Desktop/Dilation_erosion/OV7670_VGA_Dispaly.srcs/sources_1/ip/rgb2dvi_0/src/rgb2dvi.xdc]
set_property used_in_implementation false [get_files -all c:/Users/11986/Desktop/Dilation_erosion/OV7670_VGA_Dispaly.srcs/sources_1/ip/rgb2dvi_0/src/rgb2dvi_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/11986/Desktop/Dilation_erosion/OV7670_VGA_Dispaly.srcs/sources_1/ip/rgb2dvi_0/src/rgb2dvi_clocks.xdc]

read_ip -quiet C:/Users/11986/Desktop/Dilation_erosion/OV7670_VGA_Dispaly.srcs/sources_1/ip/Shift_RAM_3X3_8bit/Shift_RAM_3X3_8bit.xci
set_property used_in_implementation false [get_files -all c:/Users/11986/Desktop/Dilation_erosion/OV7670_VGA_Dispaly.srcs/sources_1/ip/Shift_RAM_3X3_8bit/Shift_RAM_3X3_8bit_ooc.xdc]

read_ip -quiet C:/Users/11986/Desktop/Dilation_erosion/OV7670_VGA_Dispaly.srcs/sources_1/ip/frame_buffer/frame_buffer.xci
set_property used_in_implementation false [get_files -all c:/Users/11986/Desktop/Dilation_erosion/OV7670_VGA_Dispaly.srcs/sources_1/ip/frame_buffer/frame_buffer_ooc.xdc]

read_ip -quiet C:/Users/11986/Desktop/Dilation_erosion/OV7670_VGA_Dispaly.srcs/sources_1/ip/clock/clock.xci
set_property used_in_implementation false [get_files -all c:/Users/11986/Desktop/Dilation_erosion/OV7670_VGA_Dispaly.srcs/sources_1/ip/clock/clock_board.xdc]
set_property used_in_implementation false [get_files -all c:/Users/11986/Desktop/Dilation_erosion/OV7670_VGA_Dispaly.srcs/sources_1/ip/clock/clock.xdc]
set_property used_in_implementation false [get_files -all c:/Users/11986/Desktop/Dilation_erosion/OV7670_VGA_Dispaly.srcs/sources_1/ip/clock/clock_ooc.xdc]

# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc C:/Users/11986/Desktop/Dilation_erosion/OV7670_VGA_Dispaly.srcs/constrs_1/new/OV7670_top.xdc
set_property used_in_implementation false [get_files C:/Users/11986/Desktop/Dilation_erosion/OV7670_VGA_Dispaly.srcs/constrs_1/new/OV7670_top.xdc]

set_param ips.enableIPCacheLiteLoad 1
close [open __synthesis_is_running__ w]

synth_design -top ov7670_top -part xc7z020clg400-1


# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef ov7670_top.dcp
create_report "synth_2_synth_report_utilization_0" "report_utilization -file ov7670_top_utilization_synth.rpt -pb ov7670_top_utilization_synth.pb"
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]
