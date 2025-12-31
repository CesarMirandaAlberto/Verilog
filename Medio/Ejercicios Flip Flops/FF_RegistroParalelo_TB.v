/*
						*** REGISTRO PARALELO ****

	El presente código implementa el diseño de un módulo con registro de datos en paralelo, el registro 
	se hace implementando un flip flop D el cual actua con respecto al flanco de subida de reloj.
	El módulo consta de 4 entradas clk, rst, D(datos) y 1 salida (Q).
	
	** ACERCA DEL TESTBENCH **
		GENERACIÓN DE PULSO DE RELOJ : Genera una señal de reloj con periodo de 10 ns 5 ns del 
			flanco de subida y 5 del flanco de bajada (PERIODO/2) esto aplicando
			una compuerta not a la señal de reloj.
			
	** GENERACIÓN DE VALORES ALEATORIOS **	
		Implementando la función $rand se generan valores aleatorios de 8 bits, esto mediante un bucle
		de 256 iteraciones (las de 8 bits), estos valores generados son inyectados a las señales internas 
		del Testbench para generar los estimulos.
		
			** NOTAS **
				 DUT = Nombre de la instanciación
				 reg = para entradas
				 wire = para salidas
*/

// Escala de tiempo
`timescale 1ns/1ps

//Definición del módulo del Testbench
module FF_RegistroParalelo_TB;

	// Señales internas del Testbench
	reg clk_TB = 1'b0;
	reg rst_TB;
	reg [7:0] D_TB;
	wire [7:0] Q_TB;
	
	//Instanciaciones
	FF_RegistroParalelo DUT(.clk(clk_TB), .rst(rst_TB), .D(D_TB), .Q(Q_TB));

	// Parámetros para generar pulsos de reloj
	parameter PERIODO = 16;
	
	// Parámetros para generar valores aleatorios
	parameter COMBINACIONES = 256;
	
	integer Valor;
	integer i;
	
	always#(PERIODO/2) clk_TB = ~clk_TB; // GENERACIÓN DE PULSO DE RELOJ 
	
	//Generación de estimulos
	initial begin
		
		//Parámetros de archivos de simulación
		$dumpfile("Testbench.vcd");
		$dumpvars(0, FF_RegistroParalelo_TB);
		// Texto en consola
		$display("Iniciando simulacion....");
			
			rst_TB = 1'b1; D_TB = 8'b00000000; #12;
			
			//CASOS DIRIGIDOS
			D_TB = 8'b01010101; #12;
			D_TB = 8'b10001010; #12;
			
			rst_TB = 1'b1; #12;
			rst_TB = 1'b0; #12;
			
			// GENERACIÓN DE VALORES ALEATORIOS
			for (i = 0; i<=COMBINACIONES; i = i+1) begin
				Valor = $random & 8'hFF;
				D_TB = Valor[7:0];
				#12;
			end
			
		$display("Simulacion finalizada..");
		$finish;
		
	end // Fin de estimulos
	
endmodule // Fin del Testbench
