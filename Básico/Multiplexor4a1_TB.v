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
	reg [2:0]A_TB;
	reg [2:0]B_TB;
	reg [2:0]C_TB; 
	reg [2:0]D_TB;
	reg [2:0] Selector_TB;
	wire [2:0] Salida_TB;
	
	//instanciación
	Multiplexor4a1 DUT(.A(A_TB), .B(B_TB), .C(C_TB), .D(D_TB), .Selector(Selector_TB), .Salida(Salida_TB));
	
	initial begin
		//Parametros para archivos de simulación
		$dumpfile("Testbench.vcd");
		$dumpvars(0,Multiplexor4a1_TB);
		
		//Texto en consola
		$display("Iniciando simulación.....");
		$monitor("Tiempo=%0t | A=%b | B=%b | C=%b | D=%b | Selector=%b | Salida=%b|",
		$time, A_TB, B_TB, C_TB, D_TB, Selector_TB, Salida_TB);
		
		//Estimulos
		A_TB = 3'b001;
		B_TB = 3'b100;
		C_TB = 3'b101;
		D_TB = 3'b110;
		
		Selector_TB = 3'b000;
		#10; //Retardo
		Selector_TB = 3'b001;
		#10;
		Selector_TB = 3'b010;
		#10;
		Selector_TB = 3'b011;
		#10;
		Selector_TB = 3'b100;
		#10;
		Selector_TB = 3'b101;
		#10;
		
		$display("Fin de la simulación..");
		$finish;
	end
endmodule //fin del módulo