/*
				**** REGISTRO EN SERIE Y RESETE ASINCRONO V2 ****
	
	El presente código implementa el desarrollo de un módulo que hace registro de datos
	utilizando el operador  de desplazamiento y operador de concatenación en la señal de
	salida.
	El diseño consta de 3 entradas clk, rst y D(Datos) con un ancho de 1 bit y una salida
	Q con un ancho de 4 bits, para realizar los registros se implementa un flip flop el 
	cual actua con respecto al flanco de subida de reloj.
	
*/

// Definición del módulo y lista de puertos
module FF_RSRAV2(
	input clk,
	input rst,
	input D,
	output logic [3:0] Q
);
	// Lista sensitiva
	always@(posedge clk or posedge rst) begin
		if(rst) begin
			Q <= 4'b0000; // Reset de señales
		end
		else begin
			Q <= (Q << 1) | D; // Registro en serie
		end
	end 
	
endmodule // Fin del módulo
