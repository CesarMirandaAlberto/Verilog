# 💡 Verilog – Diseños y Simulaciones

Este repositorio contiene diseños y verificaciones de módulos desarrollados en Verilog. Cada uno de ellos ha sido probado mediante simulación, y varios han sido implementados físicamente en una FPGA **DE10-Lite**.

---

## 📁 Estructura del repositorio

La organización del repositorio sigue una progresión por niveles:

- **📂 Básico**  
  Ejercicios introductorios con los fundamentos de los sistemas digitales. Incluye compuertas lógicas, multiplexores, codificadores, etc.

- **📂 Medio**  
  Aplicación de conceptos vistos en el nivel básico. Se abordan módulos más complejos como **divisores de frecuencia**, **flip-flops** y **máquinas de estados finitos (FSM)**.

- **📂 Avanzado**  
  Implementación de **protocolos de comunicación** como UART, SPI, I2C, etc.

- **📂 Miniproyectos**  
  Aplicaciones prácticas integrando módulos y conceptos de los niveles anteriores.

---

## 🧪 Simulación

Las simulaciones fueron realizadas con:

- **Icarus Verilog (`iverilog`)** – Para compilar los módulos y testbenches.
- **GTKWave (`gtkwave`)** – Para visualizar las señales simuladas en forma de onda (`.vcd`).

### 💻 Instrucciones básicas de compilación y simulación

```bash
# Compilar con Icarus Verilog
iverilog -o output.vvp modulo.v testbench.v

# Ejecutar simulación
vvp output.vvp

# Ver ondas con GTKWave
gtkwave Testbench.vcd


