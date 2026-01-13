/*
					**** MINI MEMORIA ****
					
	El presente código implementa el desarrollo del Testbench de la mini memoria a fin de analizar el funcionamiento
	del mismo.
	
		** ACERCA DEL TESTBENCH **
		GENERACIÓN DE PULSO DE RELOJ : Genera una señal de reloj con periodo de 10 ns 5 ns del 
			flanco de subida y 5 del flanco de bajada (PERIODO/2) esto aplicando
			una compuerta not a la señal de reloj.
		
		LECTURA / ESCRITURA DE DATOS:
			Se implementan ciclos for para acceder  a las posiciones de las localidades de memoria y escribir o leer datos
			según sea el caso.
			
		GENERACIÓN DE VALOR ALEATORIO:
		Mediante la función $rand se generan valores aleatorios de 4 bits y posteriormente estos son
		escritos a las localidades de memoria.
			** NOTAS **
				 DUT = Nombre de la instanciación
				 reg = para entradas
				 wire = para salidas
				 
*/

// Escala de tiempo
`timescale 1ns/1ps

// Definición del módulo del Testbench
module Mini_Memoria_TB;

	// Señales internas del Testbench
	reg clk_TB = 1'b0;
	reg rst_TB;
	reg wre_TB;
	reg [1:0] DEentrada_TB;
	reg [3:0] Direccion_TB;
	wire [1:0] DSalida_TB;
	
	//Parámetros para generar pulsos de reloj
	parameter PERIODO = 10;
	
	// Parámetros para Escritura/Lectura de datos
	parameter DIRECCIONES = 16;
	integer i;
	
	// Instanciación de la mini memoria
	Mini_Memoria DUT(.clk(clk_TB), .rst(rst_TB), .wre(wre_TB), .DEentrada(DEentrada_TB), .Direccion(Direccion_TB), .DSalida(DSalida_TB));
	
	always#(PERIODO/2) clk_TB = ~clk_TB; // GENERACIÓN DE PULSOS DE RELOJ
	
	// Estimulos a las señales del Testbench
	initial begin
		
		// Parámetros para archivos de simulacion
		$dumpfile("Testbench.vcd");
		$dumpvars(0, Mini_Memoria_TB);
		
		// Texto en consola
		$display("Iniciando simulacion....");
		
			rst_TB = 1'b1; wre_TB = 1'b0; #12;
			rst_TB = 1'b0; wre_TB = 1'b1; #12;
			
			// Escritura de datos
			for(i = 0; i<DIRECCIONES; i=i+1) begin
				Direccion_TB = i [3:0];
				DEentrada_TB = $random & 2'b11; // GENERACIÓN DE VALOR ALEATORIO
				#12;
			end
			
			//Lectura de datos
			for(i = 0; i<DIRECCIONES; i=i+1) begin
				Direccion_TB = i[3:0];
				#12;
			end
			
			// RESET
			rst_TB <= 1'b1; #12;
			// LECTURA DE DATOS
			for(i = 0; i<DIRECCIONES; i=i+1) begin
				Direccion_TB = i[3:0];
				#12;
			end
			
		$display("Simulacion finalizada...");
		$finish;
		
	end // Fin de Estimulos
endmodule // Fin del Testbench
