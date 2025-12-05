/*
						****  TESTBENCH LATCH SR ****
							
		El presente código implementa el desarrollo del Testbench del latch sr a fin 
		de analizar el funcionamiento del mismo.
		
			** NOTAS **
				 DUT = Nombre de la instanciación
				 reg = para entradas
				 wire = para salidas
*/

//Escala de Tiempo
`timescale 1ns/1ps

//Definición del módulo del Testbench
module Latch_SR_TB;
	
		//Señales internas del Testbench
		reg S_TB;
		reg R_TB;
		wire Q_TB; 
		wire  QN_TB;
		
		//instanciación y mapeo de Señales
		Latch_SR DUT(.S(S_TB), .R(R_TB), .Q(Q_TB), .QN(QN_TB));
		
		initial begin
			//Parámetros de los archivos de simulacion
			$dumpfile("Testbench.vcd");
			$dumpvars(0, Latch_SR_TB);
			//Texto
			$display("Iniciando simulacion.....");
			//Monitoreo de señales en consola
			$monitor("Tiempo: %t | S: %b | R: %b | Q: %b | QN: %b", $time, S_TB, R_TB, Q_TB, QN_TB);
			
			//Estimulos de Señales
			S_TB = 1'b1; R_TB = 1'b0; #10;
			S_TB = 1'b0; R_TB = 1'b1; #10;
			S_TB = 1'b1; R_TB = 1'b0; #10;
			S_TB = 1'b1; R_TB = 1'b1; #10;
			S_TB = 1'b0; R_TB = 1'b0; #10;
			
			$display("Fin de la simulacion...");
			
		end //Fin de los estimulos
		
endmodule //Fin del Testbench