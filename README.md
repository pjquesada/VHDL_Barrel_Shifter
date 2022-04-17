# VHDL Barrel Shifter
A 16-bit Binary Logical/Arithmetic Barrel Shifter in VHDL

## About:
<div>
  <img style="height:400px;" src="https://github.com/pjquesada/VHDL_Barrel_Shifter/blob/main/barrel_shifter_diag.jpg?raw=true" title="Barrel Shifter Diagram">
</div>

Modeled after the diagram, the Barrel SHifter consists of 2-to-1 Multiplexers, 16-bit Registers, and Tristate buffers. The program uses the IEEE VHDL library to conduct the left and right shifts of the binary bits in the shifter component.
- In the BarrelShifter.vhd component: 
  - Signal C (signed 8-bit) -> controls the amount of bits the input is shifted and in what direction.
  - Signal hiLo (1-bit) -> controls whether the binary number is shifter from its most significant (left-most) or least significant (right-most) bit.
  - Signal x (1-bit) -> controls whether the operation is a logical shift (0) or a arithmetic shift (1).
  - Signal result (32-bits) -> outputs the full 32-bit number with the shifted input.

## How to Run:
The program was created and run on ModelSim.

- Download files.
- Open ModelSim and create a new project.
- Import existing files and make sure to select _copy to project directory_.
- Compile all files.
- Start simulation.
- Import singals in region to waveform.
- Assign values and run simulation.

## Testing:
- The functionality of the component was tested with 4 test cases:
  - Logical Shift by +5 from the most significant bit
  - Logical Shift by -5 from the most significant bit
  - Arithmetic Shift by -5 from the most significant bit
  - Arithmetic Shift by -5 from the least significant bit

<div>
  <img style="height:300px;" src="https://github.com/pjquesada/VHDL_Barrel_Shifter/blob/main/barrel%20shifter%20wave.jpg?raw=true" title="Barrel Simulation Waveform with 4 Test Cases">
</div>
