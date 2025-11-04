/*
							**** TESTBENCH DEMULTIPLEXOR 1 A 4 ****
		El presente código desarrolla el testbench del módulo Demultiplexor 1 a 4 a fin 
		de analizar el funcionamiento del módulo.
		
		*** NOTAS ***
		DUT: Nombre de la instanciación
		reg para entradas
		wire para salida
*/
//Escala de tiempo
`timescale 1ns/1ps
//Definición del módulo y lista de señales acorde al módulo a verificar
module Demultiplexor1a4_TB;
	reg [3:0] X_TB;
	reg [2:0] Selector_TB;
	wire [3:0] A_TB;
	wire [3:0] B_TB;
	wire [3:0] C_TB;
	wire [3:0] D_TB;
	
	//instanciación
	Demultiplexor1a4 DUT (.X(X_TB), .Selector(Selector_TB), .A(A_TB), .B(B_TB), .C(C_TB), .D(D_TB));
	
	initial begin
		// Parametros de archivos de simulación
		$dumpfile("Testbench.vcd");
		$dumpvars(0, Demultiplexor1a4_TB);
		
		//Monitoreo de señales en consola
		$display("Iniciado simulacion...");
		$monitor("Tiempo: %t | X: %b | Selector: %b | A: %b | B: %b | C: %b | D: %b", 
		$time, X_TB, Selector_TB, A_TB, B_TB, C_TB, D_TB);
		
		X_TB = 4'b1011;
		
	//	Estimulos        Retardos
		Selector_TB = 3'b000; #10;
		Selector_TB = 3'b001; #10;
		Selector_TB = 3'b010; #10;
		Selector_TB = 3'b011; #10;
		Selector_TB = 3'b100; #10;
		Selector_TB = 3'b101; #10;
		
		$display("Fin de la simulacion..");
		$finish;
	end
	
endmodule // Fin del módulo