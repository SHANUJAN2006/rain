# Smart Weather & Rainfall Prediction Chip for Farmers (Verilog)

A custom digital ASIC chip design written in **Verilog** to help **farmers** monitor weather conditions and predict rainfall changes, built using the **Tiny Tapeout** open-source silicon design flow.

- [Read the full technical documentation](docs/info.md)

## Purpose & Social Impact
Agriculture heavily depends on timely weather and rainfall information. This dedicated hardware chip is designed to process environmental sensor data efficiently, enabling low-power, real-time weather monitoring and rainfall alerts tailored for agricultural use.

## Key Features
- **Farmer-Centric Design:** Built specifically to assist farmers with early weather and rainfall change insights.
- **Hardware Description:** Written entirely in synthesizable **Verilog HDL**.
- **ASIC & Silicon Ready:** Configured for the Tiny Tapeout open-source chip manufacturing workflow (GDSII generation).
- **Verified Logic:** Includes automated simulation testbenches and FPGA verification workflows.

## Repository Structure
- `src/` — Core Verilog source files for the weather sensing and prediction logic.
- `test/` — Simulation testbenches to verify chip behavior.
- `docs/` — Technical specifications and pinout documentation (`info.md`).
- `info.yaml` — Tiny Tapeout project configuration and pin mapping.

