/*
				**** MODULO CONTADOR ****
				
	El presente código implementa el desarrollo del módulo contador el cual se encargará de 
	llevar la cuenta del tiempo que permanecera el estado (luz del semaforo).
	
	!! ACERCA DEL CÓDIGO !!
		* Señales auxiliares para llevar la cuenta
		* Parametros de tiempo: 2 diferentes para las luces verde y amarilla
		* FlagTiempo : Al completarse el limite del contador se activa una 
					   flag.
		* ESTABLECER LIMITES DEL CONTADOR : Mediante una estructura case se evaluan los estados de la
			FSM y determina cual limite de tiempo asignar.
			
		* CLK 
			Se reciben 2 pulsos de reloj diferentes 1.- 50MHZ  2.- Pulso de 1hz de un divisor de frecuencia
			
*/

//DEFINICIÓN DEL MÓDULO Y LISTA DE PUERTOS
module Contador(
	input clk,
	input rst, 
	input clktickconta,
	input [1:0] Estado,
	output reg FlagTiempo
);

	// SEÑALES AUXILIARES
	reg [3:0] Cuenta = 4'd0; 
	reg [3:0] Limite;
	
	//PARAMETROS DE TIEMPO
	localparam Limite1 = 4'd10; // DIEZ
	localparam Limite2 = 4'd4;  // CUATRO
	
	// PARA LOS ESTADOS
	localparam VERDE1 	 = 2'd0;
	localparam AMARILLO1 = 2'd1;
	localparam VERDE2 	 = 2'd2;
	localparam AMARILLO2 = 2'd3;
	
	// LISTA SENSITIVA
	always@(posedge clk or posedge rst) begin
		if (rst) begin // RESETEO DE SEÑALES
			Cuenta <= 4'd0;
			Limite <= Limite1;
			FlagTiempo <= 1'b0;
		end
		else if(clktickconta)begin
			// ESTABLECER LIMITES DEL CONTADOR
			case (Estado)
				VERDE1 : 	Limite <= Limite1;
				AMARILLO1 : Limite <= Limite2;
				VERDE2 : 	Limite <= Limite1;
				AMARILLO2 : Limite <= Limite2;
				default : 	Limite <= Limite1;
			endcase;
			
			// CONTADOR AL LIMITE
			if(Cuenta == Limite - 1'b1) begin
				FlagTiempo <= 1'b1;
				Cuenta <= 4'd0;
			end
			else begin // INCREMENTO EN EL CONTADOR
				FlagTiempo <= 1'b0;
				Cuenta <= Cuenta + 1'b1;
			end
		end
	end // FIN DE LA LISTA SENSITIVA
	
endmodule //FIN DEL MÓDULO
