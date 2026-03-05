/*
					**** MODULO TOP (RTL) FSM MOORE SEMAFORO DE 2 VIAS ****
		
	El presente código implementa el desarrollo del módulo top rtl de la máquina de estados de 
	mooree del semaforo de 2 vias.
	
	!! ACERCA DEL CÓDIGO !!
		* IDF : Instanciación divisor de frecuencia 
		* ICNT : Instanciación Contador 
		* IFSM : Instanciación Finite State Machine
		
*/

//Definición del módulo y lista de puertos
module Modulo_Top(
	input wire clk_Top,
	input wire rst_Top,
	output wire [2:0] SEMAFORO1_TOP,
	output wire [2:0] SEMAFORO2_TOP
);

	// Señales internas
	wire CLK_DIVISOR;
	wire FlagTime;
	wire [1:0] EstadoFSM;

	// ** INSTANCIACIONES **
	
	// ** DIVISOR DE FRECUENCIA **
	Divisor_Frecuencia IDF(.clk_Entrada(clk_Top), .rst(rst_Top), .clk_Salida(CLK_DIVISOR));

	// ** CONTADOR **
	Contador ICNT(.clk(clk_Top), .rst(rst_Top), .clktickconta(CLK_DIVISOR), .Estado(EstadoFSM), .FlagTiempo(FlagTime));
	
	// ** MÁQUINA DE ESTADOS **
	FSM_Semaforo2vias IFSM(.clk(CLK_DIVISOR), .rst(rst_Top), .clktick(CLK_DIVISOR), 
						   .FlagTiempo(FlagTime), .EstadoSal(EstadoFSM), 
						   .Semaforo1(SEMAFORO1_TOP), .Semaforo2(SEMAFORO2_TOP));

endmodule // Fin del módulo
