/*
					**** MODULO TOP (HARDWARE) FSM MOORE SEMAFORO DE 2 VIAS ****
	
	El presente código implementa el desarrollo del módulo top (Hardware) de la máquina de estados.
	
	!! ACERCA DEL CÓDIGO !!
	
	IMT : Instanción Modulo Top 
	
*/

// Definición del módulo y lista de puertos
module Top(
	input CLK_50MHZ,
	input BTNRST,
	output [2:0] SEM1,
	output [2:0] SEM2
);
	// Instanciación
	Modulo_Top IMT(.clk_Top(CLK_50MHZ), . rst_Top(BTNRST), .SEMAFORO1_TOP(SEM1), .SEMAFORO2_TOP(SEM2));
	
endmodule // Fin del módulo
