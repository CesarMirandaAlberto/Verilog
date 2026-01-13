/*
					**** MINI MEMORIA ****
					
	El presente código implementa el diseño de un módulo que implementa una memoria para lectura y escritura
	de datos el cual consta de 5 Entradas
		* clk = señal de reloj, * rst, * wre(habilitar escritura), DEentrada(Dato de entrada), Direccion y
		1 salida (DSalida).
	Se generan 16 localidades de memoria con un ancho de 2 bits para almacenar datos, estos datos serán escritos
	solo mediante el flanco de subida de reloj y si el wre esta en estado alto (1).
	RESETEO DE VALORES: si el reset se aplica mediante un bucle for el cual itera cada localidad de memoria y 
	resetea el valor de dicha localidad.
	
	LECTURA DE DATOS:
	Mediante asignamiento continuo el dato de la localidad de memoria es asignado a DSalida.
*/

// Definición del módulo y lista de puertos
module Mini_Memoria(
	input clk,
	input rst,
	input wre,
	input [1:0] DEentrada,
	input [3:0] Direccion,
	output [1:0] DSalida
);
	// Generación de señal para las localidades de memoria
	reg [1:0] LocalidadesMemoria [0:15];
	
	//Parametros para el bucle 
	integer i;
	parameter LOCALIDADES = 16;	
	
	// Lista sensitiva
	always@(posedge clk or posedge rst) begin
		if(rst) begin
			for(i =0; i<LOCALIDADES; i= i+1)
				LocalidadesMemoria[i] <= 2'b00; // Reseteo de valores
		end 
		else begin	
			if(wre)
				LocalidadesMemoria[Direccion] <= DEentrada; // Escritura de datos
		end
	end //Fin de la lsita sensitiva 
	
	assign DSalida = LocalidadesMemoria[Direccion]; // Lectura del dato en la localidad
	
endmodule // Fin del módulo
