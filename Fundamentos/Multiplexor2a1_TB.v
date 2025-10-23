/*
							****  TESTBENCH MULTIPLEXOR 2 A 1 ****
	El presente código implementa un testbench para verificar el funcionamiento del módulo
	Multiplexor2a1.
	NOTA: DUT nombre de la instanciación.
	wire para Entradas.
	reg para salidas.
*/

`timescale 1ns/1ps //Escala de tiempo
//Definición del módulo y lista de puertos acorde a los del módulo a verificar.
module Multiplexor2a1_TB;
    reg X;
	reg Y;
    reg [1:0] Selector;
    wire Salida;
	
	//instanciación del módulo y mapeo de señales
	Multiplexor2a1 DUT(.X(X), .Y(Y), .Selector(Selector), .Salida(Salida));
	
	initial begin
	//Parametros para los archivos de la simulación
		$dumpfile("Testbench.vcd");
		$dumpvars(0,Multiplexor2a1_TB);
		
		//Texto en consola para simulación
		$display("Iniciando simulacion...");
		$monitor("Tiempo=%0t | Selector=%b | X=%b | Y=%b | Salida=%b",
		$time, Selector, X, Y, Salida);
		
		//Estimulos
		X = 1'b1;
		Y = 1'b0;
		
		Selector = 2'b00;
		#10;
		Selector = 2'b01;
		#10;
		Selector = 2'b10;
		#10;
		Selector = 2'b01;
		#10;
		Selector = 2'b11;
		#10;
		
		$display("Fin de la simulacion");
		$finish;
		
	end
	
endmodule // Fin del módulo
