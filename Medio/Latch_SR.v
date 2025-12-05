/*
				**** LATCH SR ****
				
		El presente código desarrolla un módulo latch SR, consta de 2 entradas
		y 2 salidas: S = Set, R= Reset, salidas = Q negada QN.
		Se implementa asignamiento continuo para la negación de la salida Q.
*/

//Definición del módulo y lista de puertos
module Latch_SR(
	input S,
	input R,
	output reg Q, 
	output  QN
);

	//Lista sensitiva con todas las señales "*"
	always@(*) begin
		if(S == 1'b1 && R == 1'b0)  //Configura
			Q = 1'b1;
		else if (S == 1'b0 && R == 1'b1) // Resetea
			Q = 1'b0;
		else  // Almacena
			Q = Q;
	end
	
	//negación de Q
	assign QN = ~Q;
	
endmodule // Fin del módulo