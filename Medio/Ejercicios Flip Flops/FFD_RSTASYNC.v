/*
						*** FLIP FLOP D CON RESET ASINCRONO ****

	El presente código implementa el diseño de un módulo flip flop D con reset asincrono, 
	el diseño consta de 3 entradas clk, rst, D(Datos) y 1 salida (Q).
	El flip flop actua con respecto al flanco de bajada de reloj.
	
*/

// Definición del módulo y lista de puertos
module FFD_RSTASYNC(
	input clk,
	input rst,
	input D,
	output reg Q
);
	// Lista sensitiva
	always@(negedge rst or negedge clk) begin
		if(!rst)Q <= 1'b0; // Reset de señales
		else 
			Q <= D; // Asingación de datos a la salida
	end 
	
endmodule // Fin del flip flop
