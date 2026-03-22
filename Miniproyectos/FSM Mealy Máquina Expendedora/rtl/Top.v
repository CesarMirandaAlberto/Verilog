/*
					**** MÓDULO TOP (HARDWARE) FSM MEALY MÁQUINA EXPENDEDORA ****

	El presente código implementa el desarrollo el módulo top a nivel hardware para conectar los puertos
	del diseño rtl con los pines físicos del FPGA, por lo que solo se hace la instanciación del módulo 
	top a nivel rtl.
	
*/

// DEFINICIÓN DEL MÓDULO TOP Y LISTA DE PUERTOS
module Top(
	input CLK50MHZ,
	input RST,
	input [1:0] MONEDAS,
	input BOTONCOMPRAR,
	output ENTREGAPRODUCTO,
	output CAMBIO,
	output [6:0] UNIDADES7SG, 
	output [6:0] DECENAS7SG
);

// INSTANCIACIONES
 Modulo_Top IMT(.clk_top(CLK50MHZ), .rst_top(RST), .Monedas_top(MONEDAS), .BComprar_top(BOTONCOMPRAR), .Entrega_top(ENTREGAPRODUCTO),
	.Cambio_top(CAMBIO), .Display_Unidades(UNIDADES7SG), .Display_Decenas(DECENAS7SG));
	
	
endmodule
