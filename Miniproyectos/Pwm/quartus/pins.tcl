#ASIGNACIÓN DE PINES 	
# **** ENTRADAS ****

#Reset y reloj
set_location_assignment PIN_P11 -to CLK_50MHZ
set_location_assignment PIN_C10 -to RST

#BOTONES AUMENTAR Y DISMINUIR SEÑAL PWM
set_location_assignment PIN_B8 -to BTN_AUMENTAR
set_location_assignment PIN_A7 -to BTN_DISMINUIR

#LED CON SEÑAL PWM
set_location_assignment PIN_A8 -to DUTY

#DISPLAY SIETE SEGMENTOS
#UNIDADES
set_location_assignment PIN_C14 -to DISPLAYUNIDADES[0]
set_location_assignment PIN_E15 -to DISPLAYUNIDADES[1]
set_location_assignment PIN_C15 -to DISPLAYUNIDADES[2]
set_location_assignment PIN_C16 -to DISPLAYUNIDADES[3]
set_location_assignment PIN_E16 -to DISPLAYUNIDADES[4]
set_location_assignment PIN_D17 -to DISPLAYUNIDADES[5]
set_location_assignment PIN_C17 -to DISPLAYUNIDADES[6]

#DECENAS
set_location_assignment PIN_C18 -to DISPLAYDECENAS[0]
set_location_assignment PIN_D18 -to DISPLAYDECENAS[1]
set_location_assignment PIN_E18 -to DISPLAYDECENAS[2]
set_location_assignment PIN_B16 -to DISPLAYDECENAS[3]
set_location_assignment PIN_A17 -to DISPLAYDECENAS[4]
set_location_assignment PIN_A18 -to DISPLAYDECENAS[5]
set_location_assignment PIN_B17 -to DISPLAYDECENAS[6]

#CENTENAS
set_location_assignment PIN_B20 -to DISPLAYCENTENAS[0]
set_location_assignment PIN_A20 -to DISPLAYCENTENAS[1]
set_location_assignment PIN_B19 -to DISPLAYCENTENAS[2]
set_location_assignment PIN_A21 -to DISPLAYCENTENAS[3]
set_location_assignment PIN_B21 -to DISPLAYCENTENAS[4]
set_location_assignment PIN_C22 -to DISPLAYCENTENAS[5]
set_location_assignment PIN_B22 -to DISPLAYCENTENAS[6]