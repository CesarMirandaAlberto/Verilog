/*
							**** TESTBENCH LATCH D ****
		
		El prsenete código implementa el desarrollo del Testbench para el Latch D 
		a fin de analizar el funcionamiento del mismo.
				
		** NOTAS **
		 DUT = Nombre de la instanciación
		 reg = para entradas
		 wire = para salidas
*/

//Escala de tiempo
`timescale 1ns/1ps

//Definición del módulo del Testbench
module Latch_D_TB;

	//Señales internas
	reg E_TB;
	reg D_TB;
	wire Q_TB;
	wire  QN_TB;
	
	//Instanciación del Latch
	Latch_D DUT(.E(E_TB), .D(D_TB), .Q(Q_TB), .QN(QN_TB));
	
	initial begin
	
		//Parametros de archivos de simulacion
		$dumpfile("Testbench.vcd");
		$dumpvars(0,Latch_D_TB);
		
		//Mensaje
		$display("Iniciando simulacion.....");
		//Monitoreo de señales en consola
		$monitor("Tiempo: %t | E: %b | D:  %b | Q: %b | QN: %b", $time, E_TB, D_TB, Q_TB, QN_TB);
		
		//Estimulos a las señales internas
		D_TB = 1'b0; E_TB = 1'b0; #10;
		D_TB = 1'b0; E_TB = 1'b1; #10;
		D_TB = 1'b1; E_TB = 1'b1; #10;
		D_TB = 1'b0; E_TB = 1'b0; #10;
		D_TB = 1'b0; E_TB = 1'b1; #10;
	end
endmodule //Fin del Testbench
