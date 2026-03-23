#ASIGNACIÓN DE PINES 	
# **** ENTRADAS ****

#Reset y reloj
set_location_assignment PIN_P11 -to CLK50MHZ
set_location_assignment PIN_C10 -to RST

#Monedas y Boton de comprar
set_location_assignment PIN_B8 -to MONEDAS[0]
set_location_assignment PIN_A7 -to MONEDAS[1]

set_location_assignment PIN_F15 -to BOTONCOMPRAR

#ENTREGA DE PRODUCTO Y CAMBIO
set_location_assignment PIN_A8 -to ENTREGAPRODUCTO
set_location_assignment PIN_B11 -to CAMBIO

#DISPLAY SIETE SEGMENTOS
#UNIDADES
set_location_assignment PIN_C14 -to UNIDADES7SG[0]
set_location_assignment PIN_E15 -to UNIDADES7SG[1]
set_location_assignment PIN_C15 -to UNIDADES7SG[2]
set_location_assignment PIN_C16 -to UNIDADES7SG[3]
set_location_assignment PIN_E16 -to UNIDADES7SG[4]
set_location_assignment PIN_D17 -to UNIDADES7SG[5]
set_location_assignment PIN_C17 -to UNIDADES7SG[6]

#DECENAS
set_location_assignment PIN_C18 -to DECENAS7SG[0]
set_location_assignment PIN_D18 -to DECENAS7SG[1]
set_location_assignment PIN_E18 -to DECENAS7SG[2]
set_location_assignment PIN_B16 -to DECENAS7SG[3]
set_location_assignment PIN_A17 -to DECENAS7SG[4]
set_location_assignment PIN_A18 -to DECENAS7SG[5]
set_location_assignment PIN_B17 -to DECENAS7SG[6]
