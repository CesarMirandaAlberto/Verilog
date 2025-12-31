/*
				**** REGISTRO EN SERIE Y RESETE ASINCRONO ****
				
		El presente código implementa el diseño de un módulo flip flop que implementa registro en serie con
		reset asincrono. El módulo consta de de 3 entradas clk, rst, D(Datos) y una salida con un ancho de 4
		bits.
		El flip flop se ejecuta en respuesta al flanco de subida del reloj.
		EJ de registro sincrono
		Valor Original 0000		
		RS 1		   0001	D = 1
		RS 2		   0010	D = 0
		RS 3		   0101 D = 1
		RS 4		   1010 D = 0
*/

// Definición del módulo y lista de puertos
module FF_RSRA(
	input logic clk,
	input logic rst,
	input logic D,
	output logic [3:0] Q 
);

	// Lista sensitiva
	always@(posedge clk or posedge rst) begin
			
		if(rst) begin
			Q<= 4'b0000; // Reset
		end 
		else begin
			Q[0]<=D; // Registro en serie
			Q[3:1]<=Q[2:0];
		end
	end // Fin de la lista sensitiva
	
endmodule // Fin del módulo