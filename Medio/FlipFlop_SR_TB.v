/*
							****  TESTBENCH FLIP FLOP SR ****
				
		El presente código implementa el desarrollo del Testbench del flip flop SR a fin de analizar
		el funcionamiento del mismo.
		
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

//Definición del modulo del Testbench
module FlipFlop_SR_TB;

	// Señales internas del Testbench
	reg clk_TB = 1'b0;
	reg S_TB;
	reg R_TB;
	wire Q_TB;
	wire  QN_TB;
	
	// Parámetros para generar los pulsos de reloj
	parameter PERIODO = 10;
	
	// Instanciación del flip flop
	FlipFlop_SR DUT(.clk(clk_TB), .S(S_TB), .R(R_TB), .Q(Q_TB), .QN(QN_TB));
	
	always #(PERIODO/2) clk_TB = ~clk_TB; // GENERACIÓN DE PULSO DE RELOJ
	
	// Estimulos 
	initial begin
		
		// Parámetros de archivos de simulacion
		$dumpfile("Testbench.vcd");
		$dumpvars(0,FlipFlop_SR_TB);
		
		//Texto en consola
		$display("Iniciando simulacion....");
				// Inyección de valores a señales internas del Testbench
				S_TB = 1'b1; R_TB = 1'b0; #12;
				S_TB = 1'b0; R_TB = 1'b1; #12;
				S_TB = 1'b1; R_TB = 1'b0; #12;
				S_TB = 1'b0; R_TB = 1'b0; #12;
				S_TB = 1'b0; R_TB = 1'b1; #12;
				S_TB = 1'b1; R_TB = 1'b1; #12;
		$display("Simulacion finalizada..");
		$finish; // Finalización
		
	end 
endmodule // Find del Testbench
