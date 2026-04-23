`timescale 1ns/ 1ps


module Pwm_Tb;

	// SEÑALES INTERNAS
	reg clk_tb = 1'b0;
	reg rst_tb = 1'b0;
	reg Aumentar_tb = 1'b0;
	reg Disminuir_tb = 1'b0;
	wire SalidaPWM_tb;
	wire [3:0] DCentenas_tb;
	wire [3:0] DDecenas_tb;
	wire [3:0] DUnidades_tb;
	
	parameter PERIODO = 10;
	integer i;
	integer j;
	
	//INSTANCIACÓN
	Modulo_TOP DUT(.clk_top(clk_tb), .rst_top(rst_tb), .Aumentar(Aumentar_tb), .Disminuir(Disminuir_tb),
				   .SalidaPWM_Top(SalidaPWM_tb), .DCentenas(DCentenas_tb), .DDecenas(DDecenas_tb), .DUnidades(DUnidades_tb));
				   
	
	// GENERACIÓN DE PULSO DE RELOJ
	always#(PERIODO/2) clk_tb = ~clk_tb;
	
	initial begin
		$dumpfile("Testbench.vcd");
		$dumpvars(0, Pwm_Tb);
		
		$display("Iniciando simulacion......");
		
			rst_tb = 1'b1; #50;
			rst_tb = 1'b0; #20;
			
			for(i=0; i<11; i= i +1) begin
				Aumentar_tb = 1; #10;
				Aumentar_tb = 0; #30;
			end
			#200;
			for(j=0; j<11; j= j +1) begin
				Disminuir_tb = 1; #10;
				Disminuir_tb = 0; #30;
			end
			
		$display("Simulacion finalizada...");
		#200;
		$finish;
	end 
	
endmodule
