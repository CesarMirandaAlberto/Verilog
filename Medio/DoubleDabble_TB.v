/*
					**** TESTBENCH ALGORITMO DOUBLE DABBLE ****
					
	El presente código implementa el desarrollo del Testbench para el algoritmo double dabble a 
	fin de analizar el funcionamiento del mismo.
	
	!! ACERCA DEL TESTBENCH !!	
	GENERACIÓN DE VALORES ALEATORIOS:
	Mediante la función $rand se generan valores aleatorios de 8 bits y posteriormente este Valor
	es inyectado a la señal interna del Testbench como estimulo, este proceso se repite por las 
	posibles combinaciones posibles de un número de ancho de 8 bits mediante un ciclo for.
	
	** NOTAS **
				 DUT = Nombre de la instanciación
				 reg = para entradas
				 wire = para salidas
	
*/

// Escala de tiempo
`timescale 1ns/1ps

// Definición del módulo del Testbench
module DoubleDabble_TB;

	//Señales internas
	reg [7:0] X_TB;
	wire [3:0] Centenas_TB;
	wire [3:0] Decenas_TB;
	wire [3:0] Unidades_TB;
	
	// Parámetros para bluce y generación de valores aleatorios
	integer i;
	integer Valor;
	parameter COMBINACIONES= 256;
	
	// Instanciación del módulo
	DoubleDabble DUT(.X(X_TB), .Centenas(Centenas_TB), .Decenas(Decenas_TB), .Unidades(Unidades_TB));
	
	// Estimulos de las Señales
	initial begin
		
		// Parámetros de archivos de simulacion
		$dumpfile("Testbench.vcd");
		$dumpvars(0, DoubleDabble_TB);
		// Texto en consola
		$display("Iniciando simulacion");
			
			//GENERACIÓN DE VALORES ALEATORIOS
			for(i=0; i<COMBINACIONES; i=i+1) begin
				Valor = $random & 8'hFF;
				X_TB = Valor[7:0];
				#7;
			end
		$display("Simulacion finalizada....");
		$finish;
	end // Fin de los estimulos
	
endmodule // Fin del Testbench
