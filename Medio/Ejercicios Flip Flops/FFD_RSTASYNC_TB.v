/*
						*** FLIP FLOP D CON RESET ASINCRONO ****

	El presente código implementa el desarrollo del Testbench del flip flop D con reset asincrono 
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
module FFD_RSTASYNC_TB;

	// Señales internas del Testbench
	reg clk_TB = 1'b0;
	reg rst_TB;
	reg D_TB;
	wire Q_TB;
	
	// Parámetros para generar los pulsos de reloj
	parameter PERIODO = 10;
	
	// Instanciación del flip flop 
	FFD_RSTASYNC DUT (.clk(clk_TB), .rst(rst_TB), .D(D_TB), .Q(Q_TB));
	
	always#(PERIODO/2) clk_TB = ~clk_TB; // Generación de pulsos de reloj
	
	// Estimulos de señales 
	initial begin
		
		// Parámetros de archivos de simulación
		$dumpfile("Testbench.vcd");
		$dumpvars(0,FFD_RSTASYNC_TB);
		// Texto en consola
		$display("Iniciando Simulacion....");
		rst_TB = 1'b0; D_TB = 1'b1; #10;
		rst_TB = 1'b1; #10;
		rst_TB = 1'b1; #10;
		rst_TB = 1'b0; #10;
		rst_TB = 1'b1; #10;
		
		$display("Simulacion finalizada...");
		$finish;
	end // Fin de los estimulos
endmodule // Fin del Testbench