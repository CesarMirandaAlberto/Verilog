/*
								**** TESTBENCH MEDIO SUMADOR ****
								
		El presente código implementa el desarrollo del testbench del medio sumador 
		a fin de analizar el funcionamiento del mismo.
		NOTAS:
			DUT = Nombre de la instanciación
			reg: para entradas
			wire: para salidas
*/
//Escala de tiempo
`timescale 1ns/1ps

//Declaración del módulo y lista se señales internas del Testbench
module Medio_Sumador_TB;
		reg X_TB;
		reg Y_TB;
		wire Salida_TB;
		wire CarrieSalida_TB;
		
	//instanciación del módulo
	Medio_Sumador DUT(.X(X_TB), .Y(Y_TB), .Salida(Salida_TB), .CarrieSalida(CarrieSalida_TB));
	
	initial begin
		// Parametros de los archivos de simulacion
		$dumpfile("Testbench.vcd");
		$dumpvars(0, Medio_Sumador_TB);
		
		//Mostrar en consola de las señales
		$display("Iniciando Simulacion....");
		$monitor("Tiempo: %t | X: %b | Y: %b | Salida: %b | CarrieSalida: %b", $time, X_TB, Y_TB, Salida_TB, CarrieSalida_TB);
		

		X_TB = 1'b0; Y_TB = 1'b0; #10;
		X_TB = 1'b0; Y_TB = 1'b1; #10;
		X_TB = 1'b1; Y_TB = 1'b0; #10;
		X_TB = 1'b1; Y_TB = 1'b1; #10;
		
		$display("Fin de la Simulacion...");
		$finish; //Fin
	end
	
endmodule //Fin del módulo
