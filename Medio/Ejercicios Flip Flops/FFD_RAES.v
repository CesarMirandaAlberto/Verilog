/*
		*** FLIP FLOP D CON RESET ASINCRONO Y HABILITACIÓN SINCRONA ****

	El presente código implementa el diseño de un flip flop D el cual consta de 4 entradas
	clk, rst, en(enable), D(Datos) y una salida (Q). El flip flop actua con respecto al 
	flanco de subida de reloj.
	
*/

// Definición del módulo y lista de puertos
module FFD_RAES (
	input clk,
	input rst,
	input en,
	input D,
	output reg Q
);
	// Lista sensitiva
	always@(posedge clk or posedge rst) begin
		if(rst) begin
			Q<=4'b0000; // Reseteo de señales
		end
		else begin  
			if(en) begin
				Q <= D; // Escritura de datos
			end
		end
	end // Fin de lista sensitiva
	
endmodule // Fin del flip flop 
