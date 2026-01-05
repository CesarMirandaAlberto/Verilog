/*
					**** CONTADOR 10 UNIDADES CON ACARREO	****
					
	El presente código implementa el desarrollo del Testbench para el contador de 10 unidades con acarreo,
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

// Escala de tiempo
`timescale 1ns/1ps

// Definición del módulo del Testbench
module Contador10_Acarreo_TB;
	
	// Señales internas del Testbench
	reg clk_TB = 1'b0;
	reg rst_TB;
	wire Carry_TB;
	wire [3:0] Q_TB;
	
	// Parámetros para generar el pulso de reloj
	parameter PERIODO = 10;
	
	// instanciación del contador
	Contador10_Acarreo DUT(.clk(clk_TB), .rst(rst_TB), .Carry(Carry_TB), .Q(Q_TB));
	
	always#(PERIODO/2) clk_TB = ~clk_TB; // GENERACIÓN DE PULSO DE RELOJ
	
	// Estimulos
	initial begin
		
		//Parámetros para archivos de simulacion
		$dumpfile("Testbench.vcd");
		$dumpvars(0, Contador10_Acarreo_TB);
		
		// Texto en consola
		$display("Iniciando simulacion.....");
			
			rst_TB = 1'b1; #12;
			rst_TB = 1'b0; #122;
			rst_TB = 1'b1; #12;
			
		$display("Simulacion finalizada....");
		$finish;
	end // Fin de Estimulos
	
endmodule // Fin del Testbench
