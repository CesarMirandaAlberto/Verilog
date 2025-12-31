/*
				**** REGISTRO EN SERIE Y RESETE ASINCRONO ****
				
		El presente código implementa el desarrollo del Testbench del registro en serie  
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
module FF_RSRA_TB;

	// Señales internas del Testbench
	reg clk_TB= 1'b0;
	reg rst_TB;
	reg D_TB;
	wire [3:0] Q_TB;
	
	// Parámetros para generar pulso de reloj
	parameter PERIODO = 10;
	
	// Instanciación del Flip Flop
	FF_RSRA DUT(.clk(clk_TB), .rst(rst_TB), .D(D_TB), .Q(Q_TB));
	
	always #(PERIODO/2) clk_TB = ~clk_TB; //GENERACIÓN DE PULSO DE RELOJ 
	
	// Estimulos de señales internas
	initial begin
		
		// Parámetros de archivos de simulacion
		$dumpfile("Testbench.vcd");
		$dumpvars(0, FF_RSRA_TB);
		// Texto en consola
		$display("Iniciando simulacion....");
		
			// Inyección de valores a las señales
			rst_TB = 1'b1; 
			@(negedge clk_TB);
			rst_TB = 1'b0; D_TB = 1'b1; 
			@(negedge clk_TB);
			D_TB = 1'b0; 
			@(negedge clk_TB);
			D_TB = 1'b1; 
			@(negedge clk_TB);
			D_TB = 1'b0; 
			@(negedge clk_TB);
			rst_TB = 1'b1; 
			@(negedge clk_TB);
		$display("Simulacion finalizada...");
		$finish; // Fin de estimulos
	end
endmodule // Fin del Testbench
