/*
				**** TESTBENCH DECODIFICADOR BINARIO A GRAY *****
		EL presente código implementa el desarrollo de un testbench para analizar el funcionamiento
		del módulo decodificador binario gray.
		
		NOTAS:
		* DUT: Nombre de la instanciación.
		* reg para entradas y wire para salidas.
*/

`timescale 1ns/1ps //Escala de tiempo
//Declaración del módulo y lista de señales acorde a los puertos del módulo a verificar
module DecodificadorBinario_Gray_TB;
	reg [3:0] Binario;
	wire [3:0] Gray;
	
	//instanciación y mapeo de señales
	DecodificadorBinario_Gray DUT(.Binario(Binario), .Gray(Gray));
	
	initial begin
			//Parametros de archivos de simulación
			$dumpfile("Testbench.vcd");
			$dumpvars(0, DecodificadorBinario_Gray_TB);
			
			//Texto en consola
			$display("Iniciando Simulacion......");
			$monitor("Tiempo: %t | Binario: %b | Gray: %b", $time, Binario, Gray);
			
			// Estimulos       Retardos
			Binario = 4'b0000; #10;
			Binario = 4'b0001; #10;
			Binario = 4'b0010; #10;
			Binario = 4'b0011; #10;
			Binario = 4'b0100; #10;
			Binario = 4'b0101; #10;
			Binario = 4'b0110; #10;
			Binario = 4'b0101; #10;
			Binario = 4'b0110; #10;
			Binario = 4'b0111; #10;
			Binario = 4'b1000; #10;
			Binario = 4'b1001; #10;
			Binario = 4'b1010; #10;
			Binario = 4'b1011; #10;
			Binario = 4'b1101; #10;
			Binario = 4'b1110; #10;
			Binario = 4'b1111; #10;
			
			$display("Fin de la Simulacion....");
			$finish; // Fin de estimulos
	end
	
endmodule //Fin del módulo
