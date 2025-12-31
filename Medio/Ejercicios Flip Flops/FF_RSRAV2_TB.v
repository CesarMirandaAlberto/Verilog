/*
				**** REGISTRO EN SERIE Y RESETE ASINCRONO V2 ****
				
	El presente código implementa el desarrollo del Testbench del registro en serie v2 a fin de
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

//Módulo del Testbench
module FF_RSRAV2_TB;

	// Señales internas del Testbench
	reg clk_TB = 1'b0;
	reg rst_TB;
	reg D_TB;
	wire [3:0] Q_TB;
	
	// Parámetros para generar pulso de reloj
	parameter PERIODO = 10;
	
	// Instanciación del registro
	FF_RSRAV2 DUT(.clk(clk_TB), .rst(rst_TB), .D(D_TB), .Q(Q_TB));
	
	always #(PERIODO/2) clk_TB = ~clk_TB; // Generación de pulsos de reloj
	
	// Generación de estimulos
	initial begin 
		
		// Parámetros de archivos de Simulacion
		$dumpfile("Testbench.vcd");
		$dumpvars(0, FF_RSRAV2_TB);
		// Texto en consola
		$display("Iniciando Simulacion...");
		
			rst_TB = 1'b1; @(negedge clk_TB);
			rst_TB = 1'b0; D_TB = 1'b1; @(negedge clk_TB);
			
			D_TB = 1'b0; @(negedge clk_TB);
			D_TB = 1'b1; @(negedge clk_TB);
			D_TB = 1'b0; @(negedge clk_TB);
			rst_TB = 1'b1; @(negedge clk_TB);
			
		$display("Simulacion finalizada...");
		$finish; 
	end // Fin de estimulos
	
endmodule // Fin del Testbench
