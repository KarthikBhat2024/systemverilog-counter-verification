# 4-Bit Synchronous Counter | SystemVerilog RTL & Design Verification

## Project Overview

Designed and simulated a 4-bit synchronous up-counter using SystemVerilog. Developed a self-checking testbench with an independent reference model to verify the counter's functionality.

## Design Specifications

| Parameter | Specification |
|---|---|
| Counter width | 4 bits |
| Counting sequence | 0 to 15 |
| Clock edge | Positive edge |
| Reset type | Synchronous |
| Reset polarity | Active high |
| Overflow | 15 → 0 |

## Tools Used

- SystemVerilog
- Icarus Verilog
- GTKWave
- Linux

## Project Structure

```text
systemverilog-counter-verification/
├── rtl/
│   └── counter.sv
├── testbench/
│   └── tb_counter.sv
├── screenshots/
│   └── counter_waveform.png
└── README.md
```

## Verification Methodology

The testbench implements:

1. Clock and reset generation.
2. Independent reference counter.
3. Actual-versus-expected output comparison.
4. Case inequality (`!==`) for mismatch detection.
5. PASS/ERROR simulation messages.
6. Fault injection to test error detection.

## Fault Injection Experiment

An intentional RTL modification changed the increment operation from:

`count <= count + 1'b1;`

to:

`count <= count + 2'b10;`

The testbench detected mismatches between the actual and expected counter values.

## Learning Outcomes

- Sequential logic design
- Synchronous reset behaviour
- Nonblocking assignments
- Reference model development
- Self-checking testbench implementation
- RTL simulation and waveform debugging
- Fault injection and functional verification

## Future Improvements

- Up/down counter
- Modulo-10 counter
- Automated PASS/FAIL statistics
- Functional coverage
