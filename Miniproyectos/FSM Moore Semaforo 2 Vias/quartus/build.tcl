#PLANTILLA GENERICA CON FINES EDUCATIVOS Y DE PRÁCTICA
project_new de10lite_demo -overwrite

#ABRIR DEMO
project_open de10lite_demo

#Paquete de flujo
load_package flow

#DATOS DE FPGA
set_global_assignment -name FAMILY "MAX 10"
set_global_assignment -name DEVICE 10M50DAF484C7G
set_global_assignment -name TOP_LEVEL_ENTITY Top

#CONFIGURACION DE ARCHIVOS 
set_global_assignment -name VERILOG_FILE "d:/Users/ruta/del/Proyectos/TCLFPGA/VERILOG/FSM/MOORE/rtl/Divisor_Frecuencia.v"
set_global_assignment -name VERILOG_FILE "d:/Users/ruta/del/Proyectos/TCLFPGA/VERILOG/FSM/MOORE/rtl/Contador.v"
set_global_assignment -name VERILOG_FILE "d:/Users/ruta/del/Proyectos/TCLFPGA/VERILOG/FSM/MOORE/rtl/FSM_Semaforo2vias.v"
set_global_assignment -name VERILOG_FILE "d:/Users/ruta/del/Proyectos/TCLFPGA/VERILOG/FSM/MOORE/rtl/Modulo_Top.v"
set_global_assignment -name VERILOG_FILE "d:/Users/ruta/del/Proyectos/TCLFPGA/VERILOG/FSM/MOORE/rtl/Top.v"

#quartus_pgm -m jtag -o "p;de10lite_demo.sof"
#ASIGNAMIENTO DE PINES
source pins.tcl

#COMPILADO
execute_flow -compile
