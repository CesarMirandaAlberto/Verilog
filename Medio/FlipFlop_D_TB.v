/*
				**** TESTBENCH FLIP FLOP D ****
			
		El presente código implementa el desarrollo del Testbench del flip flop D 
		a fin de analizar el funcionamiento del mismo.
		
		Pulso de Reloj : Genera una señal de reloj con periodo de 10 ns 5 ns del 
			flanco de subida y 5 del flanco de bajada (PERIODO/2) esto aplicando
			una compuerta not a la señal de reloj.
			
				
			** NOTAS **
				 DUT = Nombre de la instanciación
				 reg = para entradas
				 wire = para salidas
*/

//Escala de tiempo
`timescale 1ns/1ps

//Definición del módulo
module FlipFlop_D_TB;

	//Señales internas del Testbench
	reg clk_TB =0;
	reg D_TB;
	wire Q_TB;

	//Definición del periodo
	parameter PERIODO = 10;
	
		//instanciación del Flip Flop
		FlipFlop_D DUT(.clk(clk_TB), .D(D_TB), .Q(Q_TB));
		
	always #(PERIODO/2) clk_TB = ~clk_TB; //Pulso de Reloj
	
	initial begin
	
		//Parametros de archivos de simulacion
		$dumpfile("Testbench.vcd");
		$dumpvars(0,FlipFlop_D_TB );
		
		//Mensaje en consola
		$display("Iniciando simulacion......");
			//Estimulos de señales
			D_TB = 1'b1; #12;
			D_TB = 1'b0; #12;
			D_TB = 1'b1; #12;
			D_TB = 1'b0; #12;
		
		$display("Fin de la simulacion...");
		$finish; //Fin 
		end //Fin de los estimulos
		
endmodule//Fin del Testbench
