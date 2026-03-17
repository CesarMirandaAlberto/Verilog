/*
					**** TESTBENCH FSM MEALY MÁQUINA EXPENDEDORA ****

	El presente código implementa el desarrollo del Testbench de la fsm máquina expendedora a fin de analizar
	el funcionamiento del mismo.
	
	!! ACERCA DEL CÓDIGO !!
	DUT : Nombre de la instanciación
	
	PARA CORRECTO TESTBENCH /* * / reemplazar los valores por defecto por los de los comentarios.
*/

// ESCALA DE TIEMPO
`timescale 1ns/1ps

// DEFINICIÓN DEL MÓDULO
module FSMExpendedora_TB;
	
	//SEÑALES INTERNAS DEL TESTBENCH
	reg clk_TB = 1'b0;
	reg rst_TB;
	reg [1:0] Monedas_TB = 2'b00;
	reg BComprar_TB = 1'b0;
	wire Entrega_TB;
	wire Cambio_TB;
	wire [6:0/*3:0*/] DisplayUnidades_TB;
	wire [6:0/*3:0*/] DisplayDecenas_TB;
	
	//DEFINICIÓN DEL PERIODO
	parameter PERIODO = 10;
	
	//INSTANCIACIÓN DEL MÓDULO TOP  
	Modulo_Top DUT(.clk_top(clk_TB), .rst_top(rst_TB), .Monedas_top(Monedas_TB), .BComprar_top(BComprar_TB),
					.Entrega_top(Entrega_TB), .Cambio_top(Cambio_TB), .Display_Unidades(DisplayUnidades_TB), .Display_Decenas(DisplayDecenas_TB));

	
	// GENRACIÓN DE PULSO DE RELOJ
	always#(PERIODO/2) clk_TB = ~clk_TB;
	
	initial begin
	
		// PARÁMETROS DE ARCHIVOS DE SIMULACIÓN
		$dumpfile("Testbench.vcd");
		$dumpvars(0, FSMExpendedora_TB);
	
		$display("Iniciando Simulacion..........");

			// ESTIMULOS A SEÑALES 
			rst_TB = 1'b0; @(posedge clk_TB);
			rst_TB = 1'b1; @(posedge clk_TB);
			rst_TB = 1'b0;
			// 5 EN EN 5
			Monedas_TB = 2'b01; #20; Monedas_TB = 2'b00; #20;
			Monedas_TB = 2'b01; #20; Monedas_TB = 2'b00; #20;
			Monedas_TB = 2'b01; #20; Monedas_TB = 2'b00; #20;
			BComprar_TB = 1'b1; #20; BComprar_TB = 1'b0; #20;
			// 5 Y 10
			Monedas_TB = 2'b01; #20; Monedas_TB = 2'b00; #20;
			Monedas_TB = 2'b10; #20; Monedas_TB = 2'b00; #20;
			BComprar_TB = 1'b1; #20; BComprar_TB = 1'b0; #20; 
			// 10 Y 10          
			Monedas_TB = 2'b10; #20; Monedas_TB = 2'b00; #20;
			Monedas_TB = 2'b10; #20; Monedas_TB = 2'b00; #20;
			BComprar_TB = 1'b1; #20; BComprar_TB = 1'b0; #20; 
			// 10 y 5            
			Monedas_TB = 2'b10; #20; Monedas_TB = 2'b00; #20;
			Monedas_TB = 2'b01; #20; Monedas_TB = 2'b00; #20;
			BComprar_TB = 1'b1; #20; BComprar_TB = 1'b0; #20;
			
			
		$display("Simulacion Finalizada.........");
		$finish; // FIN DE LOS ESTIMULOS
	end 
	
endmodule // FIN DEL TESTBENCH
