/*
					**** TESTBENCH DECODER BCD 7 SEGMENTOS ****
					
	El presente código implementa el desarrollo del Testbench del decoder bcd a fin de 
	analizar el funcionamiento del mismo.
	!! ACERCA DE LOS VALORES !!
	Dado que los valores para generar los números en los display 7 segmentos son diferentes
	el valor no será el exacto en decimal.
	
				** NOTAS **
				 DUT = Nombre de la instanciación
				 reg = para entradas
				 wire = para salidas
*/

// Escala de tiempo
`timescale 1ns/1ps

// Definición del módulo del Testbench
module DecoderBCD_7Seg_TB;

	// Señales internas del Testbench
	reg [3:0] Binario_TB;
	wire [6:0] Decimal_TB;
	
	// Instanciación del decoder
	DecoderBCD_7Seg DUT(.Binario(Binario_TB), .Decimal(Decimal_TB));

	//Estimulos de las señales
	initial begin
		
		//Parámetros de archivos de simulacion
		$dumpfile("Testbench.vcd");
		$dumpvars(0, DecoderBCD_7Seg_TB);
		// Texto en consola
		$display("Iniciando simulacion.....");
		//Monitoreo de señales en consola
		$monitor("|Time:%t | X: %b |Decimal: %d|", $time, Binario_TB, Decimal_TB);
			// Inyección de valores
			Binario_TB = 4'b0000; #12;
			Binario_TB = 4'b0001; #12;
			Binario_TB = 4'b0010; #12;
			Binario_TB = 4'b0011; #12;
			Binario_TB = 4'b0100; #12;
			Binario_TB = 4'b0101; #12;
			Binario_TB = 4'b0110; #12;
			Binario_TB = 4'b0111; #12;
			Binario_TB = 4'b1000; #12;
			Binario_TB = 4'b1001; #12;
		$display("Simulacion finalizada");
		$finish;
	end // Fin de estimulos
	
endmodule // Fin del Testbench
