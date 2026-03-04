/*
					**** FSM MOORE SEMAFORO DE 2 VIAS ****
					
	El presente código implementa el desarrollo de la máquina de estados de 2 vias.
	
	!! ACERCA DEL CÓDIGO !!
		Se reciben 2 pulsos de reloj
			* 50MHZ
			* 1hz del divisor de frecuencia
			
		FlagTiempo : Se implementa para detectar cuando el contador de tiempo de estado ha llegado a 
		  su limite.
		* ACTUALIZACIÓN DE ESTADOS : mediante un flip flop se realiza la actualización de los estados
		* TRANSICIÓN DE ESTADOS : A través de lógica combinacional mediante switch case y verificación
		  de estado de la FlagTiempo se determina el siguiente estado.
		* ACTUALIZAR SALIDAS : Partiendo del estado se asignan las salidas (luces del semaforo).
		* ASIGNACIÓN DE VALORES A LAS SALIDAS : Asigna el valor que tendrán las salidas
*/

//DEFINICIÓN DEL MÓDULO Y LISTA DE PUERTOS
module FSM_Semaforo2vias(
	input clk,
	input rst,
	input clktick,
	input FlagTiempo,
	output reg [1:0] EstadoSal,
	output reg [2:0] Semaforo1,
	output reg [2:0] Semaforo2
);


	//DEFINICIÓN DE ESTADOS
	parameter VERDE1 = 2'b00, AMARILLO1 = 2'b01, VERDE2 = 2'b10, AMARILLO2 = 2'b11;
	
	reg [1:0] EstadoActual, EstadoSiguiente;

	// ACTUALIZACIÓN DE ESTADOS
	always@(posedge clk or posedge rst) begin
	
		if(rst) begin
			EstadoActual <= VERDE1;
		end
		else if(clktick)begin
			EstadoActual <= EstadoSiguiente;
		end
	end 
	
	// TRANSICIÓN DE ESTADOS
	always@(*) begin
		EstadoSiguiente = EstadoActual;
		
		case (EstadoActual)
			VERDE1 : 	if (FlagTiempo) EstadoSiguiente = AMARILLO1;
			AMARILLO1 : if (FlagTiempo) EstadoSiguiente = VERDE2;
			VERDE2 : 	if (FlagTiempo) EstadoSiguiente = AMARILLO2;
			AMARILLO2 : if (FlagTiempo) EstadoSiguiente = VERDE1;
			default:  EstadoSiguiente = VERDE1;
		endcase
	end
	
	// ACTUALIZAR SALIDAS
	always@(*) begin
		Semaforo1 = 3'b000;
		Semaforo2 = 3'b000;
		
		case (EstadoActual)
			VERDE1 : begin
				Semaforo1 = 3'b001;
				Semaforo2 = 3'b100;
			end
			AMARILLO1 : begin
				Semaforo1 = 3'b010;
				Semaforo2 = 3'b100;
			end
			VERDE2 : begin
				Semaforo1 = 3'b100;
				Semaforo2 = 3'b001;
			end
			AMARILLO2 : begin
				Semaforo1 = 3'b100;
				Semaforo2 = 3'b010;
			end
		endcase;
	end	
	
	// ASIGNACIÓN DE VALORES A LAS SALIDAS
	always@(*) begin
		case(EstadoActual)
			VERDE1 : 	EstadoSal = 2'd0;
			AMARILLO1 : EstadoSal = 2'd1;
			VERDE2 : 	EstadoSal = 2'd2;
			AMARILLO2 : EstadoSal = 2'd3;
			default : 	EstadoSal = 2'd0;
		endcase;
	end
	
endmodule // FIN DEL  MÓDULO
