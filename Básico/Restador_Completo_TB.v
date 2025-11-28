/*
						**** TESTBENCH RESTADOR COMPLETO ****
						
		El presente código implementa el desarrollo del testbench del restador completo 
		a fin de analizar el funcionamiento del módulo.
		
		** NOTAS **
		DUT = Nombre de la instanciación
		reg = para entradas
		wire = para salidas
*/

//Definición del módulo y señales internas del Testbench
`timescale 1ns/1ps
module Restador_Completo_TB;

	reg X_TB;
	reg Y_TB;
	reg CarrieNEntrada_TB;
	wire R_TB;
	wire CarrieNSalida_TB;
	
	// instanciación del módulo a verificar
	Restador_Completo DUT(.X(X_TB), .Y(Y_TB), .CarrieNEntrada(CarrieNEntrada_TB), .R(R_TB), . CarrieNSalida(CarrieNSalida_TB));
	
	initial begin
		
		//Parametros de archivos de simulación
		$dumpfile("Testbench.vcd");
		$dumpvars(0, Restador_Completo_TB);

		//Monitoreo en consola de señales
		$display("Iniciando simulacion....");
		$monitor("Tiempo: %t | X: %b | Y: %b | Carrie Entrada: %b | R: %b | Carrie Salida: %b |",
		$time, X_TB, Y_TB, CarrieNEntrada_TB, R_TB, CarrieNSalida_TB);
		
		// Estimulos de las señales y retardo de Tiempo
		X_TB = 1'b0; Y_TB = 1'b0; CarrieNEntrada_TB= 1'b0; #10;
		X_TB = 1'b0; Y_TB = 1'b1; CarrieNEntrada_TB= 1'b0; #10;
		X_TB = 1'b1; Y_TB = 1'b0; CarrieNEntrada_TB= 1'b0; #10;
		X_TB = 1'b1; Y_TB = 1'b1; CarrieNEntrada_TB= 1'b0; #10;

		X_TB = 1'b0; Y_TB = 1'b0; CarrieNEntrada_TB= 1'b1; #10;
		X_TB = 1'b0; Y_TB = 1'b1; CarrieNEntrada_TB= 1'b1; #10;
		X_TB = 1'b1; Y_TB = 1'b0; CarrieNEntrada_TB= 1'b1; #10;
		X_TB = 1'b1; Y_TB = 1'b1; CarrieNEntrada_TB= 1'b1; #10;
		
		$display("Fin de la simulacion.");
		$finish; //Fin
	
	end
	
endmodule // Fin del Testbench
