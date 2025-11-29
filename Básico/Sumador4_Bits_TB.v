/*
					**** TESTBENCH SUMADOR DE 4 BITS ****
					
		El presente código implementa el desarrollo del Testbench para el sumador de 4 bits a fin de analizar 
		el funcionamiento del mismo. Se generán valores a partir de dos ciclos for anidados cuyo valor del 
		iterador es convertido a binario y este valor es inyectado a las señales internas del Testbench para 
		generar los estimulos.
		
		** NOTAS **
		 DUT = Nombre de la instanciación
		 reg = para entradas
		 wire = para salidas
*/

// Escala de tiempo
`timescale 1ns/1ps

//Definición del módulo y list se señales internas
module Sumador4_Bits_TB;
	
		reg [3:0] X_TB;
		reg [3:0] Y_TB;
		wire CarriSalida_TB;
		wire [3:0]Salida_TB;
		
		//Valor de 16 para las combinaciones de números de 4 bits
		localparam COMBINACIONES= 16;
	
	//instanciación del sumador de 4 bits
	Sumador4_Bits DUT(.X(X_TB), .Y(Y_TB), .CarriSalida(CarriSalida_TB), .Salida(Salida_TB));
	
	//Iteradores de los ciclos for
		integer i;
		integer j;
	
	initial begin
			//Parámetros de archivos
			$dumpfile("Testbench.vcd");
			$dumpvars(0, Sumador4_Bits_TB);
			
			$display("Inicio de la simulacion....");
			
			//Generación de valores 
			for(i=0; i<COMBINACIONES; i=i+1) begin
				for(j=0; j<COMBINACIONES; j=j+1) begin
					X_TB = i[3:0];
					Y_TB = j[3:0];
					#10;
				end
			end
			$display("Fin de la simulacion...");
			$finish; //Fin
	end
endmodule // Fin del Testbench