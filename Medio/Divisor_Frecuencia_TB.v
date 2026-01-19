/*
					**** DIVISOR DE FRECUENCIA	****
					
	El presente código implementa el desarrollo del Testbench del divisor de frecuencia 
	a fin de analizar el funcionamiento del mismo.
			** ACERCA DEL TESTBENCH **
		GENERACIÓN DE PULSO DE RELOJ : Genera una señal de reloj con periodo de 10 ns 5 ns del 
			flanco de subida y 5 del flanco de bajada (PERIODO/2) esto aplicando
			una compuerta not a la señal de reloj.
			
			** NOTAS **
				 DUT = Nombre de la instanciación
				 reg = para entradas
				 wire = para salidas
	
*/

//Escala de tiempo
`timescale 1ns/1ps

// Definición del módulo del Testbench
module Divisor_Frecuencia_TB;
	
	//Señales internas del Testbench
	reg clk_Entrada_TB = 1'b0;
	reg rst_TB;
	wire clk_Salida_TB;
	
	// Parámetros para generar el pulso de reloj
	parameter PERIODO= 10;
	
	// Instanciación del divisor de frecuencia
	Divisor_Frecuencia DUT(.clk_Entrada(clk_Entrada_TB), .rst(rst_TB), .clk_Salida(clk_Salida_TB));
	
	always#(PERIODO/2) clk_Entrada_TB = ~clk_Entrada_TB; // GENERACIÓN DE PULSO DE RELOJ
	
	// Estimulos a las señales internas del Testbench
	initial begin
	
		// Parámetros para archivos de simulacion
		$dumpfile("Testbench.vcd");
		$dumpvars(0, Divisor_Frecuencia_TB);
		// Texto en consola
		$display("Iniciando simulacion.....");
			rst_TB = 1'b1; #82;
			rst_TB = 1'b0; #10_000_000;
		
		$display("Simulacion finalizada......");
		$finish;
	end // Fin de estimulos
	
endmodule // Fin del Testbench
