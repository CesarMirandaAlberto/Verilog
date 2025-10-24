/*
			****  TESTBENCH MULTIPLEXOR 4 A 1 ****
	El presente código implementa el testbench del Multiplexor4a1 a fin de analizar
	el funcionamiento del Multiplexor.
	NOTA: DUT Nombre de la instanciación.
	reg para entradas
	wire para salidas
	
*/
//Escala de tiempo
`timescale 1ns/1ps
//Declaración del módulo
module Multiplexor4a1_TB;
	//lista de señales acorde a los puertos del módulo a verificar
	reg [2:0]A;
	reg [2:0]B;
	reg [2:0]C; 
	reg [2:0]D;
	reg [2:0] Selector;
	wire [2:0] Salida;
	
	//instanciación
	Multiplexor4a1 DUT(.A(A), .B(B), .C(C), .D(D), .Selector(Selector), .Salida(Salida));
	
	initial begin
		//Parametros para archivos de simulación
		$dumpfile("Testbench.vcd");
		$dumpvars(0,Multiplexor4a1_TB);
		
		//Texto en consola
		$display("Iniciando simulación.....");
		$monitor("Tiempo=%0t | A=%b | B=%b | C=%b | D=%b | Selector=%b | Salida=%b|",
		$time, A, B, C, D, Selector, Salida);
		
		//Estimulos
		A = 3'b001;
		B = 3'b100;
		C = 3'b101;
		D = 3'b110;
		
		Selector = 3'b000;
		#10; //Retardo
		Selector = 3'b001;
		#10;
		Selector = 3'b010;
		#10;
		Selector = 3'b011;
		#10;
		Selector = 3'b100;
		#10;
		Selector = 3'b101;
		#10;
		
		$display("Fin de la simulación..");
		$finish;
	end
endmodule //fin del módulo
