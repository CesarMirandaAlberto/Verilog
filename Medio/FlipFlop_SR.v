/*
				**** FLIP FLOP SR ****
				
		El presente código implementa el diseño de un módulo flip flop SR el cual actua
		respecto al flanco de subida de reloj. El módulo consta de 3 entradas y 2 salidas,
		para la generación de la salida negada (QN) se implementa asignamiento continuo y
		aplica una compuerta not a Q.
		
*/

// Definición del módulo y lista de puertos
module FlipFlop_SR(
	input clk,
	input S,
	input R,
	output reg Q,
	output  QN
);

	// Lista sensitiva 
	always@(posedge clk) begin
		if(S == 1'b1 && R == 1'b0) begin 
			Q<= 1'b1; // Ajusta
		end 
		else if (S == 1'b0 && R == 1'b1) begin
			Q<= 1'b0; // Reset
		end
	end 
	
	assign QN = ~Q; // Asignamiento continuo
	
endmodule // Lista sensitiva
