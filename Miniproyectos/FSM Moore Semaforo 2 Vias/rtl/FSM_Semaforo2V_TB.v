/*
					**** TESTBENCH FSM MOORE SEMAFORO DE 2 VIAS ****
					
	El presente código implementa el desarrollo del Testbench de la máquina de estados finitos
	del semaforo de 2 vias a fin de analizar el funcionamiento de la misma.
	
	!! NOTAS !!
	DUT : Nombre de la instanciación.
		
*/

//ESCALA DE TIEMPO
`timescale 1ns/1ps

// DEFINICIÓN DEL MÓDULO
module FSM_Semaforo2V_TB;

	parameter PERIODO = 2;
	
	//SEÑALES INTERNAS DEL TESTBENCH
	reg clk_TB=1'b0;
	reg rst_TB;
	wire [2:0] Semaforo1_TB;
	wire [2:0] Semaforo2_TB;
	
	// INSTANCIACIÓN
	Modulo_Top DUT(.clk_Top(clk_TB), .rst_Top(rst_TB), .SEMAFORO1_TOP(Semaforo1_TB), .SEMAFORO2_TOP(Semaforo2_TB));
	
	//GENERACIÓN DE PULSO DE RELOJ
	always#(PERIODO/2) clk_TB = ~clk_TB;
	
	initial begin
		
		//PARÁMETROS DE ARCHIVOS DE SIMULACIÓN
		$dumpfile("Testbench.vcd");
		$dumpvars(0, FSM_Semaforo2V_TB);
		
		$display("Iniciando simulacion....");
		// ESTIMULOS
			rst_TB = 1'b1; #2;
			rst_TB = 1'b0; #500;
		
		$display("Simulacion finalizada....");
		$finish; // FIN DE SIMULACIÓN
	end 
	
endmodule // FIN DEL MÓDULO
