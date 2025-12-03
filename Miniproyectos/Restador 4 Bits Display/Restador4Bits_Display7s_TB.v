/*
				**** RESTADOR DE 4 BITS CON DISPLAY 7 SEGMENTOS HEXADECIMAL ****
		
		El presente código implementa el desarrollo del Testbench del restador de 4 bits 
		con exhibidor de 7 segmentos, a fin de analizar el funcionamiento del mismo.
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

//Definición del módulo del Testbench
module Restador4Bits_Display7s_TB;
	//Señales internas
	reg [3:0] X_TB;
	reg [3:0] Y_TB;
	wire CarrieNegSalida_TB;
	output [6:0] X_Display_TB;
	output [6:0] Y_Display_TB;
	wire [6:0] Resultado_Display_TB;
	
	//Para las combinaciones de señal de 4 bits
	localparam COMBINACIONES = 16;
	
	Restador4Bits_Display7s DUT(.X(X_TB), .Y(Y_TB), .CarrieNegSalida(CarrieNegSalida_TB), .X_Display(X_Display_TB), .Y_Display(Y_Display_TB), .Resultado_Display(Resultado_Display_TB));
	
	//Para los bucles
	integer i;
	integer j;
	
	initial begin 
	
		//Parametros de archivos de simulación
		$dumpfile("Testbench.vcd");
		$dumpvars(0, Restador4Bits_Display7s_TB);
		
		$display("Iniciando simulacion.....");
		//Generación de valores
		for(i=0; i<COMBINACIONES; i=i+1) begin
			for(j=0; j<COMBINACIONES; j=j+1) begin
				X_TB = i[3:0];
				Y_TB = j[3:0];
				#10;
			end
		end
		//
		$display("Simulacion finalizada.....");
		$finish; //Fin de la simulación
	end
endmodule
