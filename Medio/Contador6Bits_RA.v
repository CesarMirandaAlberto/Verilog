/*
					**** CONTADOR 6 BITS RESET ASINCRONO ****
					
	El presente código implementa el diseño de un módulo contador de 6 bits con reset asincrono 
	el cual actua con respecto al flanco de subida de reloj.
	El módulo consta de 2 entradas clk y rst y una salida (Q) de 6 bits la cual será la encargada
	de llevar la cuenta en el contador.
	
*/

// Definición del módulo y lista de puertos
module Contador6Bits_RA(
	input clk,
	input rst,
	output reg [5:0] Q
);
	// Lista sensitiva
	always@(posedge clk or posedge rst) begin
		
		if(rst) begin
			Q <= 6'b000000; // Reset
		end
		else begin
			Q <= Q + 1'b1; // Incrementa en 1 la cuenta del contador
		end
	end // Fin de lista sensitiva
	
endmodule // Fin del contador
