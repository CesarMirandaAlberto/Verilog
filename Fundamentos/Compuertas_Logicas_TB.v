/*
		**** TESTBENCH COMPUERTAS LOGICAS ****
	El presente código verilog implementa el testbench del módulo de compuertas lógicas 
	a fin de analizar el funcionamiento correcto del módulo.
	NOTA: DUT es el nombre de la instanciación.
	
*/
`timescale 1ns/1ps // Escala de tiempo

//Declaración del módulo
module Compuertas_Logicas_TB;
	//Declaración de señales del testbench acorde a las entradas y salidas del módulo a verificar
	//Reg para entradas
	reg X;
	reg Y;
	//Wire para salidas
	wire Sand;
	wire Sor;
	wire Snot;
	wire Snand;
	wire Sxor;
	wire Snor;
	
	//Instanciación al módulo principal y mapeo de señales
	Compuertas_Logicas DUT(.X(X), .Y(Y), .Sand(Sand), .Sor(Sor), .Snot(Snot), .Snand(Snand), .Sxor(Sxor), .Snor(Snor));
	
	//Estimulos
	initial begin 
	
		//Configuración de archivo y variable
		$dumpfile("Testbench.vcd");
		$dumpvars(0,Compuertas_Logicas_TB);
		
		//Mensaje en consola
		$display("Iniciando simulacion...");
        $monitor("Tiempo=%0t | X=%b | Y=%b | AND=%b | OR=%b | NOT=%b NAND=%b | XOR=%b |NOR=%b" 	, //Para valores 
        $time, X, Y, Sand, Sor, Snot, Snand, Sxor, Snor); //Tiempo
	
		// Casos de prueba
		X = 1'b0;
		Y = 1'b0;
		#10; 
		X = 1'b1;
		Y = 1'b0;
		#10;
		X = 1'b0;
		Y = 1'b1;
		#10;
		X = 1'b1;
		Y = 1'b1;
		#10;
		
		$display("Fin de simulacion."); 
		$finish; 
	end // Fin del comportamiento
endmodule // Fin del módulo
