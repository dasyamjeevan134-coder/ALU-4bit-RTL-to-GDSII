# 4-bit ALU — RTL to GDSII using OpenLane and Sky130

## Overview

This project implements a 4-bit combinational Arithmetic Logic Unit (ALU) in Verilog and takes the design through an RTL-to-GDSII physical-design flow using OpenLane v1.0.2 and the Sky130 technology.

## Operations

| ALU_Sel | Operation | Function |
|---|---|---|
| 00 | ADD | A + B |
| 01 | SUB | A - B |
| 10 | AND | A & B |
| 11 | OR | A \| B |

## Design

Inputs:
- A[3:0]
- B[3:0]
- ALU_Sel[1:0]

Output:
- Y[3:0]

The ALU is purely combinational and has no clock input.

## RTL-to-GDSII Flow

Verilog RTL → RTL Simulation → Synthesis → Floorplanning → IO Placement → Power Planning → Placement → Routing → Timing → DRC/LVS → GDSII

## Verification

RTL simulation was performed using the Verilog testbench.

For A = 5 and B = 3:

- ADD → 8
- SUB → 2
- AND → 1
- OR → 7

The generated VCD waveform was verified using GTKWave.

## Physical Design Results

| Metric | Result |
|---|---:|
| Standard cells | 34 |
| Total cell area | 335.321600 µm² |
| TNS | 0.00 |
| WNS | 0.00 |
| Worst setup slack | 4.06 |
| Worst hold slack | 4.00 |
| Total power | 2.07 × 10⁻⁵ W |
| Internal power | 9.80 × 10⁻⁶ W |
| Switching power | 1.09 × 10⁻⁵ W |
| Leakage power | 2.01 × 10⁻¹⁰ W |
| DRC violations | 0 |
| LVS errors | 0 |

## Signoff

The final design successfully generated GDSII.

- DRC: 0 violations
- LVS: 0 errors
- Final GDSII: generated successfully
- Final LEF: generated
- Final SPICE: generated

## Clocking

This is a combinational ALU with no clock port.

Therefore:

- CLOCK_PORT = null
- RUN_CTS = false
- CTS is not applicable to this design.

## Final Files

Important physical-design outputs are available in `results/final/`:

- alu_4bit.gds
- alu_4bit.lef
- alu_4bit.spice
- alu_4bit.def
- alu_4bit.v
- drc.rpt
- 37-alu_4bit.lvs.rpt
- 29-rcx_sta.summary.rpt

## Repository Structure

ALU-4bit-RTL-to-GDSII/
- README.md
- rtl/
- simulation/
- openlane/
- results/
- screenshots/
- docs/

## Tools

- Verilog HDL
- OpenLane v1.0.2
- Sky130 PDK
- Sky130 HD standard-cell library
- GTKWave
- KLayout
- Ubuntu Linux

## Key Learning Outcomes

- RTL design using Verilog
- ALU architecture
- RTL simulation and waveform analysis
- Logic synthesis
- Floorplanning
- IO placement
- Standard-cell placement
- Global and detailed routing
- Static timing analysis
- DRC and LVS verification
- GDSII generation

## Conclusion

The 4-bit ALU successfully completed the RTL-to-GDSII physical-design flow using OpenLane and the Sky130 technology. The final implementation generated GDSII and achieved zero DRC violations and zero LVS errors, with positive setup and hold timing slack.

