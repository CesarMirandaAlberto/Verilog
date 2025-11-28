/*
						**** TESTBENCH RESTADOR 4 BITS ****
						
		El presente código implementa el desarrollo del testbench del Restador de 4 bits
		a fin de analizar el comportamiento del mismo.
		Para las pruebas se generan números mediante 2 ciclos for uno para cada entrada,
		estos números son enteros que a su vez son convertidos a números binarios de 4
		bits, y estos valores son inyectados a las señales internas del Testbench.
		
		**NOTAS**
			* DUT = Nombre de la instanciación
			* reg = para entradas
			* wire = para salidas
		
*/
//Escala de tiempo
`timescale 1ns/1ps

//Definición del módulo y lista de señales internas del Testbench
module Restador4_Bits_TB;

	reg [3:0] X_TB;
	reg [3:0] Y_TB;
	wire CarriNegSalida_TB;
	wire [3:0] R_TB;
	
	//Instanciación
	Restador4_Bits DUT(.X(X_TB), .Y(Y_TB), .CarriNegSalida(CarriNegSalida_TB), .R(R_TB));
	
	//Combinaciones posibles para un número de 4 bits
	localparam COMBINACIONES=16;
	//Para iteraciones
	integer i;
	integer j;
	
	initial begin
			//Parametros de archivos de simulación
			$dumpfile("Testbench.vcd");
			$dumpvars(0, Restador4_Bits_TB);
			
			//Generación de valores
			for(i=0; i<COMBINACIONES; i=i+1) begin
				for(j=0; j<COMBINACIONES; j=j+1) begin
					X_TB = i[3:0];
					Y_TB = j[3:0];
					#10; // Retardos
				end
			end
			$finish; //fin
	end
	
endmodule //Fin del Testbench