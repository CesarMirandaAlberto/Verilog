/*
									**** TESTBENCH FLIP FLOP T ****
				
		El presente código implementa el desarrollo del Testbench para el flip flop T, a fin de
		analizar el funcionamiento del mismo.
		
		** ACERCA DEL TESTBENCH **
		GENERACIÓN DE PULSO DE RELOJ : Genera una señal de reloj con periodo de 10 ns 5 ns del 
			flanco de subida y 5 del flanco de bajada (PERIODO/2) esto aplicando
			una compuerta not a la señal de reloj.
			
				
			** NOTAS **
				 DUT = Nombre de la instanciación
				 reg = para entradas
				 wire = para salidas
*/

// Timescale
`timescale 1ns/1ps

// Definición del módulo Testbench
module FlipFlop_T_TB;

	// Señales internas del Testbench
	reg clk_TB = 1'b0;
	reg T_TB;
	wire Q_TB;
	
	// Parámetros para generar pulsos de reloj
	parameter PERIODO = 10;
	
	// Instanciación
	FlipFlop_T DUT(.clk(clk_TB), .T(T_TB), .Q(Q_TB)); 
	
	always#(PERIODO/2) clk_TB = ~clk_TB; // GENERACIÓN DE PULSO DE RELOJ
	
	// Estimulos de señales
	initial begin
		// Parámetros de archivos de Simulacion
		$dumpfile("Testbench.vcd");
		$dumpvars(0, FlipFlop_T_TB);
		
		// Texto en consola 
		$display("Simulacion finalizada...");
			// Inyección de señales 
			T_TB = 1'b1; #12;
			T_TB = 1'b0; #12;
			T_TB = 1'b1; #12;
			T_TB = 1'b0; #12;
			
		$display("Simulacion finalizada...");
		$finish; // Fin
	end 
		
endmodule	// Fin del Testbench
	