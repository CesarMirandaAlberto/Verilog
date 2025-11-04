/*
						**** TESTBENCH DECODIFICADOR BINARIO A HEXADECIMAL ****
		
	El presente código verilog implementa el desarrollo del Testbench para el módulo decodificador Binario-Hexadecimal
	a fin de analizar el funcionamiento del módulo.
	** NOTAS **
	DUT : Nombre de la instanciación.
	reg para entrada
	wire para salida
*/
//Escala de Tiempo
`timescale 1ns/1ps

//Declaración del módulo y lista de puertos acorde a los del módulo a verificar
module DecodificadorBinario_Hexadecimal_TB;
		reg [3:0] Binario_TB;
		wire [6:0] Hexadecimal_TB;
	
	//instanciación del módulo decodificador
	DecodificadorBinario_Hexadecimal DUT(.Binario(Binario_TB), .Hexadecimal(Hexadecimal_TB));
	
	initial begin
		//Parametros de archivos de simulacion
		$dumpfile("Testbench.vcd");
		$dumpvars(0,DecodificadorBinario_Hexadecimal_TB);
		
		//Monitoreo de variables en consola
		$display("Iniciando simulacion.....");
		$monitor("Tiempo: %t | Binario: %b | Hexadecimal: %b", $time, Binario_TB, Hexadecimal_TB);
		
		//Estimulos       Retardos
		Binario_TB = 4'b0000; #10;
		Binario_TB = 4'b0001; #10;
		Binario_TB = 4'b0010; #10;
		Binario_TB = 4'b0011; #10;
		Binario_TB = 4'b0100; #10;
		Binario_TB = 4'b0101; #10;
		Binario_TB = 4'b0110; #10;
		Binario_TB = 4'b0111; #10;
		Binario_TB = 4'b1000; #10;
		Binario_TB = 4'b1001; #10;
		Binario_TB = 4'b1010; #10;
		Binario_TB = 4'b1011; #10;
		Binario_TB = 4'b1100; #10;
		Binario_TB = 4'b1101; #10;
		Binario_TB = 4'b1110; #10;
		Binario_TB = 4'b1111; #10;
		
		$display("Fin de la simulacion...");
		$finish; // Fin
	end
endmodule // Fin del módulo
