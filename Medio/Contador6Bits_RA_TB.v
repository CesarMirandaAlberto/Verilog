/*
					**** TESTBENCH CONTADOR 6 BITS RESET ASINCRONO ****
					
	El presente código implementa el desarrollo del Testbench del contador de 6 bits a fin de 
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

// Escala de tiempo
`timescale 1ns/1ps

// Definición del módulo del Testbench
module Contador6Bits_RA_TB;
	
	// Señales internas del Testbench
	reg clk_TB = 1'b0;
	reg rst_TB;
	wire [5:0] Q_TB;
	
	// Instanciación del contador
	Contador6Bits_RA DUT(.clk(clk_TB), .rst(rst_TB), .Q(Q_TB));
	
	// Parámetro para generar el pulso de reloj
	parameter PERIODO = 10;
	
	always#(PERIODO/2) clk_TB = ~clk_TB; // GENERACIÓN DE PULSO DE RELOJ
	
	// Estimulos de señales
	initial begin
		// Parámetros de archivos de simulacion
		$dumpfile("Testbench.vcd");
		$dumpvars(0, Contador6Bits_RA_TB);
		
		// Texto en consola
		$display("Iniciando simulacion...");
		
			rst_TB = 1'b1; #12;
			rst_TB = 1'b0; #652;
			rst_TB = 1'b1; #12;
			
		$display("Simulacion finalizada...");
		$finish;
	end // Fin de estimulos
	
endmodule // Fin del Testbench
