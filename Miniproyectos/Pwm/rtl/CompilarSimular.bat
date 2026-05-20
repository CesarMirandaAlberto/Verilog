::PLANTILLA CON FINES EDUCATIVOS Y PRACTIVOS
@echo off

rem Configuracion de archivos 

rem **** Archivos para compilar ****

set Instanciacion1=DoubleDabble.v
set Instanciacion2=Pwm.v
set ModuloPrincipal=Modulo_TOP.v
set Testbench=Pwm_Tb.v
set Simulacion=Simulacion.vvp

rem **** Archivos para simulacion ****
echo ==============================

rem Compilado
echo Compilando modulos....
iverilog -o %Simulacion% %Instanciacion1% %Instanciacion2% %Instanciacion3%  %ModuloPrincipal% %Testbench%

echo =======Simulacion=============
vvp %Simulacion%


echo ==============================
rem **** ABRIR GTKWAVE ****
echo Abriendo Vizualizador de ondas.....

gtkwave Testbench.vcd

pause
