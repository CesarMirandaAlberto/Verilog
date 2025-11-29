/*
					**** TESTBENCH Multiplicador DE 4BITS ****
	
		El presente código implementa el desarrollo del Testbench del multiplicador de 4 bits
		a fin de analizar el funcionamiento del mismo. El testbench generá valores a partir de
		dos ciclos for anidados cuyo valor del iterador es convertido a binario y este valor
		es inyectado a las señales internas del Testbench para generar los estimulos.
		
		** NOTAS **
		 DUT = Nombre de la instanciación
		 reg = para entradas
		 wire = para salidas
*/

//Escala de tiempo
`timescale 1ns/1ps

//Definición del módulo y lista de señales internas del Testbench
module Multiplicador4_Bits_TB;

		reg [3:0] X_TB;
		reg [3:0] Y_TB;
		wire [7:0] Salida_TB;
		
	// Combinaciones para números de 4 bits
	localparam COMBINACIONES = 16;
	//Interadores de los ciclos
	integer i;
	integer j;
	
	//Instanciación del módulo
	Multiplicador4_Bits DUT(.X(X_TB), .Y(Y_TB), .Salida(Salida_TB));
	
	initial begin
		//Parámetros de archivos de simulación
		$dumpfile("Testbench.vcd");
		$dumpvars(0, Multiplicador4_Bits_TB);
		
		$display("Inicio de la simulacion....");
		//Generación de valores mediante los bucles
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
	
endmodule //Fin del Testbench
