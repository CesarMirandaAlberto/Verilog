# Verilog
El presente repostorio contiene diseños y verificaciones de módulos desarrollados en verilog, donde estos mismos han sido
puestos a prueba tanto en simulación como en físico.

## 📁 Estructura del repositorio 
La organización del repositorio es la siguiente:

- **Basico:** Aquí partemos con ejercicios básicos con la teoria fundamental de los sitemas digiatales.
- **Medio:** Los ejercicios en este nivel aplican la teoria vista en el nivel básico y empiezan a tener mas complejidad los    ejercicios como fsm, divisor de frecuencia, fsm.
- **Avanzado:** Desarrollo de protocolos de comunicación.
- **Miniproyectos:** Aplicaciones prácticas de los niveles antes mencionados.

## 🧪 Pruebas de simulación
Para el diseño y verificación de los módulos desarrollados se utilizarón los softwares iverilog y gtkwave.
- **Iverilog:** Compilar.
- **Gtkwave:** Visualizar señales en forma de onda.

## ⚙️ Pruebas en hardware
Los módulos presentados han sido puestos a prueba en físico en un FPGA DE10-Lite.

## 📚 Conceptos básicos de verilog

- **module:** Es la unidad donde se implementa el funcionamiento del circuito "Es como el circuito integrado ".
- **puertos:** Entradas y salidas del módulo.
- **endmodule:** Especifica fin del módulo.

## 📚 elementos del testbench
- **Instanciación:** Manda llamar a módulos externos al que se esta implementando.
- **Mapeo:** Conectar señales