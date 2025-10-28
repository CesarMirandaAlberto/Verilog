/*
				**** TESTBENCH DEMULTIPLEXOR 1 A 2 ****
		El presente código desarrolla el testbench para el módulo Demultiplexor 1 a 2 a fin 
		de analizar el funcionamiento del módulo.
		**** NOTAS ****
		
		* DUT: Nombre de la instanciación
		* reg para entradas
		* wire para salidas
*/
//Escala de tiempo
`timescale 1ns/1ps
//Definición del módulo y lista de señales acorde a los puertos del módulo a verificar
module Demultiplexor1a2_TB;
		reg X;
		reg [1:0] Selector;
		wire Salida1;
		wire Salida2;
		
	//instanciación del módulo
	Demultiplexor1a2 DUT(.X(X), .Selector(Selector), .Salida1(Salida1), .Salida2(Salida2));
	
	initial begin
		//Parametros de los archivos de simulación
		$dumpfile("Testbench.vcd");
		$dumpvars(0,Demultiplexor1a2_TB);
		
		//Monitoreo de variables en consola
		$display("Iniciando simulacion....");
		$monitor("Tiempo:%0t | X: %b | Selector:%b | Salida1: %b | Salida2: %b",
		$time, X, Selector, Salida1, Salida2);
		
		X = 1;
		
		// Estimulos    Retardos
		Selector = 2'b00; #10;
		Selector = 2'b01; #10;
		Selector = 2'b10; #10;
		Selector = 2'b11; #10;
		
		$display("Fin de la simulacion..");
		$finish;
		
	end
	
endmodule // Fin del módulo
