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
	reg X_TB;
	reg Y_TB;
	//Wire para salidas
	wire Sand_TB;
	wire Sor_TB;
	wire Snot_TB;
	wire Snand_TB;
	wire Sxor_TB;
	wire Snor_TB;
	
	//Instanciación al módulo principal y mapeo de señales
	Compuertas_Logicas DUT(.X(X_TB), .Y(Y_TB), .Sand(Sand_TB), .Sor(Sor_TB), .Snot(Snot_TB), .Snand(Snand_TB), .Sxor(Sxor_TB), .Snor(Snor_TB));
	
	//Estimulos
	initial begin 
	
		//Configuración de archivo y variable
		$dumpfile("Testbench.vcd");
		$dumpvars(0,Compuertas_Logicas_TB);
		
		//Mensaje en consola
		$display("Iniciando simulacion...");
        $monitor("Tiempo=%0t | X=%b | Y=%b | AND=%b | OR=%b | NOT=%b NAND=%b | XOR=%b |NOR=%b" 	, //Para valores 
        $time, X_TB, Y_TB, Sand_TB, Sor_TB, Snot_TB, Snand_TB, Sxor_TB, Snor_TB); //Tiempo
	
		// Casos de prueba
		X_TB = 1'b0;
		Y_TB = 1'b0;
		#10; 
		X_TB = 1'b1;
		Y_TB = 1'b0;
		#10;
		X_TB = 1'b0;
		Y_TB = 1'b1;
		#10;
		X_TB = 1'b1;
		Y_TB = 1'b1;
		#10;
		
		$display("Fin de simulacion."); 
		$finish; 
	end // Fin del comportamiento
endmodule // Fin del módulo