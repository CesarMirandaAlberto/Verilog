/*
							**** FLIP FLOP JK ****
			
	El presente código implementa el diseño del modulo flip flop JQ el cual consta de 
	3 entradas y 2 salidas, el flip flop funciona con el flanco de subida de la señal
	de reloj, para la salida negada (QN) se implementa asignamiento continuo.
	
*/

// Definición del módulo y lista de puertos
module FlipFlop_JK(
	input clk,
	input J,
	input K,
	output reg Q, 
	output QN
);

	// Lista sensitiva
	always@(posedge clk) begin
		if (J == 1'b0 && K == 1'b0) begin
			Q <= Q;	// Mantiene valor
		end
		else if(J == 1'b0 && K == 1'b1) begin
			Q <= 1'b0; //Reset
		end
		else if(J == 1'b1 && K == 1'b0) begin
			Q <= 1'b1; // Ajusta valor
		end
		else
			Q <= ~Q; // Niega el valor de Q
	end 
	
	assign QN = ~Q; // Salida negada
	
endmodule // Fin del módulo
