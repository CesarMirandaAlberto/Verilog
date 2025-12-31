/*
						*** REGISTRO PARALELO ****

	El presente código implementa el diseño de un módulo con registro de datos en paralelo, el registro 
	se hace implementando un flip flop D el cual actua con respecto al flanco de subida de reloj.
	El módulo consta de 4 entradas clk, rst, D(datos) y 1 salida (Q).
	
*/

// Definición del módulo y lista de puertos
module FF_RegistroParalelo(
	input clk,
	input rst,
	input [7:0] D,
	output reg [7:0] Q
);
	// Lista sensitiva 
	always@(posedge clk or posedge rst) begin
		if(rst) begin
			Q <= 4'b0000; // Reset de señales
		end 
		else begin
			Q <= D; // Registro de datos
		end
	end // Fin de lista sensitiva
	
endmodule // Fin del módulo
