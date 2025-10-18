# 💡 Verilog – Diseños y Simulaciones

Este repositorio contiene diseños y verificaciones de módulos desarrollados en Verilog. Cada uno de ellos ha sido probado mediante simulación, y varios han sido implementados físicamente en una FPGA **DE10-Lite**.

---

## 📁 Estructura del repositorio

La organización del repositorio esta compuesta por  tres niveles y miniproyectos:

- **📂 Básico**  
  Ejercicios introductorios con los fundamentos de los sistemas digitales. Incluye compuertas lógicas, multiplexores, codificadores, etc.

- **📂 Medio**  
  Aplicación de conceptos vistos en el nivel básico. Se implementan módulos más complejos como **divisores de frecuencia**, **flip-flops** y **máquinas de estados finitos (FSM)**.

- **📂 Avanzado**  
  Implementación de **protocolos de comunicación**.

- **📂 Miniproyectos**  
  Aplicaciones prácticas integrando los módulos y conceptos de los niveles anteriores.

---

## 🧪 Simulación

Antes de bajar el diseño al FPGA este fue puesto a prueba mediante simulación y se utilziaron los siguientes softwares.

- **Icarus Verilog (`iverilog`)** – Compilar los módulos y testbenches.
- **GTKWave (`gtkwave`)** – Visualizar las señales simuladas en forma de onda (`.vcd`).

### 💻 Comandos básicos para compilación y simulación

```bash
# Compilar con Icarus Verilog
iverilog -o ejemplo.vvp modulo.v testbench.v

# Ejecutar simulación 
vvp output.vvp

# Visualizar señales en forma de ondas con GTKWave
gtkwave Testbench.vcd


