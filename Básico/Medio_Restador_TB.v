/*
								**** TESTBENCH MEDIO RESTADOR ****	
								
		El presente código implementa el desarrollo del Testbench para el medio restador a fin
		de analizar el funcionamiento del módulo.
		
		**NOTAS**
			* DUT = Nombre de la instanciación
			* reg = para entradas
			* wire = para salidas
*/

//Escala de Tiempo
`timescale 1ns/1ps

//Definición del módulo y señales internas del Testbench
module Medio_Restador_TB;

	reg X_TB;
	reg Y_TB;
	wire R_TB;
	wire AN_TB;
	
	//Instanciación del módulo
	Medio_Restador DUT(.X(X_TB), .Y(Y_TB), .R(R_TB), .AN(AN_TB));
	
	initial begin
		//Parametros de archivos de simulacion
		$dumpfile("Testbench.vcd");
		$dumpvars(0, Medio_Restador_TB);
		
		//Monitoreo de señales en consola
		$display("Iniciando simulacion....");
		$monitor("Tiempo: %t | X: %b | Y: %b | R: %b | Acarreo: %b |", $time, X_TB, Y_TB, R_TB, AN_TB);
		
		//Estimulos de las señales y retardos
		X_TB = 1'b0; Y_TB = 1'b0; #10;
		X_TB = 1'b0; Y_TB = 1'b1; #10;
		X_TB = 1'b1; Y_TB = 1'b0; #10;
		X_TB = 1'b1; Y_TB = 1'b1; #10;
		
		$display("Fin de la simulacion.");
		$finish; //Fin
	
	end
endmodule //Fin del Testbench