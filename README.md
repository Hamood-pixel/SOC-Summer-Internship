# ⚡ Intel FPGA DE1-SoC Digital Logic Labs

This repository contains my digital logic design labs performed on the **Terasic DE1-SoC Development Kit** (Cyclone V FPGA) during my research internship at System On Chip (SoC) Lab in the summers of 2025. The lab manuals are available on FPGAcademy.

## 🛠️ Hardware & Tools
- **Board:** Intel/Terasic DE1-SoC
- **FPGA:** Cyclone V 5CSEMA5F31C6
- **Software:** Quartus Prime (Lite Edition)
- **Language:** Verilog HDL

## 🚀 How to Load to Board
1. Open the `.qpf` file in Quartus.
2. Ensure the `.qsf` file has loaded the correct pin assignments for the DE1-SoC.
3. Compile the design (Ctrl+L).
4. Use the **Programmer** tool to flash the `.sof` file to the board via USB-Blaster.
