/*
									**** FLIP FLOP T ****
				
		El presente código implementa el diseño de un módulo flip flop T el cual consta de 2
		entradas clk y T, y una salida Q. El flip flop funciona con respecto al flanco de 
		subida del reloj
*/

// Definición del módulo y lista de puertos
module FlipFlop_T(
	input clk,
	input T,
	output reg Q= 1'b0
);
	// Lista sensitiva
	always@(posedge clk)begin
		if (T == 1'b1) begin
			Q <= ~Q; // Niega Q
		end
	end
	
endmodule // Fin del módulo
