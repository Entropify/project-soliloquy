# Project Checklist (EVERYTHING DONE!!! UPGRADE TIME)
---

## Phase 1: Core Hardware Modules (Done)

- for now (MVP of RV32I):
  - add, sub — ALU, R-type decode, register writeback
  - and, or — ALU logical ops (different funct3, same R-type structure)
  - lw — I-type decode, memory read, sign-extend immediate, ALU for address calc, register writeback from memory (not ALU)
  - sw — S-type decode, split immediate reconstruction, memory write, no register writeback at all
  - beq — B-type decode, branch comparator, PC-relative offset, PC mux


- [x] **Program Counter (PC):** 32-bit register holding the current instruction address
- [x] **Instruction Memory (ROM):** Asynchronous read memory initialized with compiled machine code
- [x] **Register File:** 32x32-bit registers
- [x] **ALU:** Core execution unit
  - [x] Implement operations: `ADD`, `SUB`, `AND`, `OR`
- [x] **Immediate Generator (ImmGen):** Extracts, shifts or sign-extends immediates based on the instruction format (I, S, B types)
- [x] **Data Memory (RAM):** Synchronous write, asynchronous read for `Load` and `Store` instructions
- [x] **Adders:**
  - [x] PC + 4 Adder (Next sequential instruction)
  - [x] Branch Target Adder (PC + Offset)

---

## Phase 2: Control Logic & Integration (Done)

- [x] **Main Control Unit:** Decodes the 7-bit opcode to generate multiplexer selectors and enable signals (e.g., `RegWrite`, `MemRead`, `MemWrite`, `Branch`)
- [x] **ALU Control Unit:** Decodes `funct3` and `funct7` fields alongside Main Control signals to drive the specific ALUop signals
- [x] **Top-Level Module:** Instantiate and wire all components together (PC, Memories, RegFile, ALU, Controllers, and Muxes)

---

## Phase 3: Hardware Verification & Testing (Done)

- [x] **Module-Level Unit Testing (SystemVerilog):**
  - [x] ALU Testbench (Test all arithmetic/logical conditions and zero flag)
  - [x] Register File Testbench (Verify write behavior and `x0` isolation)
  - [x] ImmGen Testbench (Verify sign-extension across all instruction formats)
  - [x] Control Unit Testbench
  - [x] ALU Control Testbench
  - [x] PC Testbench
  - [x] Data Mem Testbench
  - [x] Instruction Mem Testbench (Ensuring correctly reading hex file)
- [x] **Full System Execution (Cocotb + Makefile + riscvasm compiled into hex):**
  - [x] Write a basic self-checking RISC-V assembly program that works with cocotb to verify CPU
  - [x] Assemble program into hex machine code
  - [x] Load hex into Instruction Memory
  - [x] Simulate entire CPU clock cycles and verify register states/Data Memory in a waveform viewer (e.g., GTKWave)
