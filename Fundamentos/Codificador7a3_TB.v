/*
				**** TESTBENCH CODIFICADOR 7 A 3 ****
		El presente código implementa el testbench del Codificador7a3 a fin de
		analizar el funcionamiento del Codificador.
		NOTAS:
		* DUT = Nombre de la instanciación
		reg para entrada
		wire para salida
		
*/
//Escala de Tiempo
`timescale 1ns/1ps
//Declaración del módulo y su lista de señales acorde a los puertos del módulo a verificar
module Codificador7a3_TB;
	reg [6:0]X;
	wire [2:0]Salida;

	// instanciación y mapeo de señales del módulo Codificador
	Codificador7a3 DUT(.X(X), .Salida(Salida));

	initial begin
		// Parametros para archivos de simulación
		$dumpfile("Testbench.vcd");
		$dumpvars(0, Codificador7a3_TB);
		
		//Mensaje en consola
		$display("Iniciando simulacion.....");
		$monitor("Tiempo: %t | X: %b | Salida: %b", $time, X, Salida);
		
		//Estimulos 	retardos
		X = 7'b0000000; #10;
		X = 7'b0000010; #10;
		X = 7'b0000100; #10;
		X = 7'b0001000; #10;
		X = 7'b0010000; #10;
		X = 7'b0100000; #10;
		X = 7'b1000000; #10;
		X = 7'b0000000; #10;
		
		$display("Fin de la simulacion...");
		$finish; //fin de estimulos
		
	end
	
endmodule // Fin del módulo
