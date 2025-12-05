/*
				**** FLIP FLOP D ****
				
		El presente código implementa el desarrollo de un flip flop D 
		el módulo consta de 2 entradas clk = pulso de reloj, D = Datos
		y una salida = Q. Se implementa la lista sensitiva unicamente
		con la señal de reloj y se usa el operadro <= ademas el diseño
		del flip flop se hace sensible al flanco de subida del pulso
		de reloj, en caso contrario se matiene el valor de Q.
*/

//Definición del módulo y lista de puertos
module FlipFlop_D(
	input clk,
	input D,
	output reg Q
);
	//Lista sensitiva
	always@(posedge clk)begin
		Q <= D; // Asignamiento de D en flanco de subida
	end
	
endmodule
