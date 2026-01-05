/*
					**** CONTADOR 10 UNIDADES CON ACARREO	****
					
	El presente código implementa el diseño de un módulo contador de 10 unidades con acarreo, el modulo
	consta de 3 entradas clk, rst, carry y 1 salida Q de 4 bits.
	El contador funciona implementando un flip flop el cual actua con respecto al flanco de subida
	de reloj y el reset actua en 2 ocaciones 1.- En estado alto (1) o 2.- al llegar al limite de la cuenta
	y se reinicia la misma.
	
*/

//Definición del módulo y lista de puertos
module Contador10_Acarreo (
	input clk,
	input rst,
	output reg Carry,
	output reg [3:0] Q
);
	// Parámetros para el limite del contador
	parameter LIMITE = 4'b1001; //NUMERO 9
	
	// Lista sensitiva
	always@(posedge clk or posedge rst) begin
		if(rst) begin
			Q <= 4'b0000; // reset de señal
		end
		else begin
			if(Q == LIMITE) begin
				Q <= 4'b0000; //reset 
				Carry <= 1'b1; // Acarreo en 1
			end
			else begin
				Q <= Q + 1; // Incrementa 
				Carry <= 1'b0;
			end
		end
	end // Fin de la lista sensitiva
	
endmodule // Fin del módulo
