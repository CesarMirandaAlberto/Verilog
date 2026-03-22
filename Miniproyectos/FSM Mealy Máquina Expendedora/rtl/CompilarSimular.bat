::PLANTILLA CON FINES EDUCATIVOS Y PRACTIVOS
@echo off

rem Configuracion de archivos 

rem **** Archivos para compilar ****

set Instanciacion1=DecoderBCD_7Seg.v
set Instanciacion2=DoubleDabble.v
set Instanciacion3=PresionarBoton.v
set Instanciacion4=FSM_Expendedora.v
set ModuloPrincipal=Modulo_Top.v
set Testbench=FSMExpendedora_TB.v
set Simulacion=Simulacion.vvp

rem **** Archivos para simulacion ****
echo ==============================

rem Compilado
echo Compilando modulos....
iverilog -o %Simulacion% %Instanciacion1% %Instanciacion2% %Instanciacion3% %Instanciacion4% %ModuloPrincipal% %Testbench%

echo =======Simulacion=============
vvp %Simulacion%


echo ==============================
rem **** ABRIR GTKWAVE ****
echo Abriendo Vizualizador de ondas.....

gtkwave Testbench.vcd

pause
