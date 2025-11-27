/*
						**** TESTBENCH DEL SUMADOR COMPLETO ****

		El presente código implementa el desarrollo del tesbench del Sumador Completo a Fin
		de analizar el funcinamiento del módulo.
		** NOTAS **
		DUT : Nombre de la instanciación
		reg : para entradas
		wire : para salidas
		
*/

//Escala de tiempo
`timescale 1ns/1ps

//Declaración del módulo y lista de puertos
module Sumador_Completo_TB;
		reg X_TB;
		reg Y_TB;
		reg AcarreoEntrada_TB;
		wire AcarreoSalida_TB;
		wire Salida_TB;
	
	//instanciación del módulo 
	Sumador_Completo DUT(.X(X_TB), .Y(Y_TB), .AcarreoEntrada(AcarreoEntrada_TB), .AcarreoSalida(AcarreoSalida_TB), .Salida(Salida_TB));
	
	initial begin
	//Parametros de archivos de simulacion
		$dumpfile("Testbench.vcd");
		$dumpvars(0, Sumador_Completo_TB);
		
		//Monitoreo de señales en consola
		$display("Inicio de la simulacion....");
		$monitor("Tiempo: %t | X: %b | Y: %b | AcarreoEntrada: %b | AcarreoSalida: %b | Salida: %b", 
        $time, X_TB, Y_TB, AcarreoEntrada_TB, AcarreoSalida_TB, Salida_TB);

		// Estimulos a las señales
		X_TB = 1'b0; Y_TB = 1'b0; AcarreoEntrada_TB = 1'b0; #10;
		X_TB = 1'b0; Y_TB = 1'b1; AcarreoEntrada_TB = 1'b0; #10;
		X_TB = 1'b1; Y_TB = 1'b0; AcarreoEntrada_TB = 1'b0; #10;
		X_TB = 1'b1; Y_TB = 1'b1; AcarreoEntrada_TB = 1'b0; #10;
		
		X_TB = 1'b0; Y_TB = 1'b0; AcarreoEntrada_TB = 1'b1; #10;
		X_TB = 1'b0; Y_TB = 1'b1; AcarreoEntrada_TB = 1'b1; #10;
		X_TB = 1'b1; Y_TB = 1'b0; AcarreoEntrada_TB = 1'b1; #10;
		X_TB = 1'b1; Y_TB = 1'b1; AcarreoEntrada_TB = 1'b1; #10;
		
		$display("Fin de la simulacion...");
		$finish; //Fin
	end
endmodule //Fin del Testbench
