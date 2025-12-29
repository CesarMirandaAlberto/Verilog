/*
							**** FLIP FLOP JK ****
							
	El presente código implementa el desarrollo del Testbench del flip flop JK a fin de analizar
	el funcionamiento del mismo.
	
	** ACERCA DEL TESTBENCH **
		PULSO DE RELOJ : Genera una señal de reloj con periodo de 10 ns 5 ns del 
			flanco de subida y 5 del flanco de bajada (PERIODO/2) esto aplicando
			una compuerta not a la señal de reloj.
			
				
			** NOTAS **
				 DUT = Nombre de la instanciación
				 reg = para entradas
				 wire = para salidas
*/

//Escala de tiempo
`timescale 1ns/1ps

//Definición del módulo
module FlipFlop_JK_TB;
	
	//Señales internas del Testbench
	reg clk_TB = 1'b0;
	reg J_TB;
	reg K_TB;
	wire Q_TB; 
	wire QN_TB;
	
	//Parámetros para generar pulsos de Reloj
	parameter PERIODO = 10;
	
	// Instanciación del flip flop 
	FlipFlop_JK DUT(.clk(clk_TB), .J(J_TB), .K(K_TB), .Q(Q_TB), .QN(QN_TB));
	
	always#(PERIODO/2) clk_TB = ~clk_TB; // PULSO DE RELOJ
	
	//Estimulos a las señales del Testbench
	initial begin
	
		// Parámetros de archivos
		$dumpfile("Testbench.vcd");
		$dumpvars(0, FlipFlop_JK_TB);
		
		// Texto en consola
		$display("Simulando.....");
		
		J_TB = 1'b1; K_TB = 1'b0; #12;
		J_TB = 1'b0; K_TB = 1'b0; #12;
		J_TB = 1'b0; K_TB = 1'b1; #12;
		J_TB = 1'b1; K_TB = 1'b0; #12;
		J_TB = 1'b1; K_TB = 1'b1; #12;
		
		$display("Simulacion terminada...");
		$finish; // Fin de los estimulos
		
	end
endmodule // Fin del Testbench
