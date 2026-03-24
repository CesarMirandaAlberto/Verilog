#crear plantilla
project_new de10lite_demo -overwrite

#ABRIR DEMO
project_open de10lite_demo

#Paquete de flujo
load_package flow

#DATOS DE FPGA
set_global_assignment -name FAMILY "MAX 10"
set_global_assignment -name DEVICE 10M50DAF484C7G
set_global_assignment -name TOP_LEVEL_ENTITY Top

#CONFIGURACIÓN DE ARCHIVOS ADAPTAR A LA PROPIA RUTA
set_global_assignment -name VERILOG_FILE "d:/Users/ruta/del/Proyectos/TCLFPGA/VERILOG/FSM/rtl/DecoderBCD_7Seg.v"
set_global_assignment -name VERILOG_FILE "d:/Users/ruta/del/Proyectos/TCLFPGA/VERILOG/FSM/rtl/DoubleDabble.v"
set_global_assignment -name VERILOG_FILE "d:/Users/ruta/del/Proyectos/TCLFPGA/VERILOG/FSM/rtl/PresionarBoton.v"
set_global_assignment -name VERILOG_FILE "d:/Users/ruta/del/Proyectos/TCLFPGA/VERILOG/FSM/rtl/FSM_Expendedora.v"
set_global_assignment -name VERILOG_FILE "d:/Users/ruta/del/Proyectos/TCLFPGA/VERILOG/FSM/rtl/Modulo_Top.v"
set_global_assignment -name VERILOG_FILE "d:/Users/ruta/del/Proyectos/TCLFPGA/VERILOG/FSM/rtl/Top.v"

#quartus_pgm -m jtag -o "p;de10lite_demo.sof"
#ASIGNAMIENTO DE PINES
source pins.tcl

#COMPILADO
execute_flow -compile
