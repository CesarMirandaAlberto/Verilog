::PLANTILLA CON FINES EDUCATIVOS Y PRACTIVOS
@echo off

rem Configuracion de archivos 

rem **** Archivos para compilar ****

set Instanciacion1=Divisor_Frecuencia.v
set Instanciacion2=Contador.v
set Instanciacion3=FSM_Semaforo2vias.v
set ModuloPrincipal=Modulo_Top.v
set Testbench=FSM_Semaforo2V_TB.v
set Simulacion=Simulacion.vvp

rem **** Archivos para simulacion ****
echo ==============================

rem Compilado
echo Compilando modulos....
iverilog -o %Simulacion% %Instanciacion1% %Instanciacion2% %Instanciacion3% %ModuloPrincipal% %Testbench%

echo =======Simulacion=============
vvp %Simulacion%


echo ==============================
rem **** ABRIR GTKWAVE ****
echo Abriendo Vizualizador de ondas.....
gtkwave Testbench.vcd

pause
