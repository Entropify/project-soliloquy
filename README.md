# Project Checklist

## Phase 1: Architecture & Theory (Done)

- [x] **Chapter 2: Instructions** 
  - [x] 2.1: Introductions
  - [x] 2.2: Operations
  - [x] 2.3: Operands
  - [x] 2.4: Signed and Unsigned Numbers (Two's Complement handling for ALU)
  - [x] 2.5: Representing Instructions (Crucial for decoding R, I, S, B, U, and J formats)
  - [x] 2.6: Logical Operations
  - [x] 2.7: Instructions for Making Decisions
- [x] **Chapter 4: The Processor**
  - [x] 4.1: Introductions
  - [x] 4.2: Design Conventions
  - [x] 4.3: Building a Datapath
  - [x] 4.4: A Simple Implementation Scheme (Single-cycle control signals and FSM planning)

---

## Phase 2: Core Hardware Modules (Done)

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

## Phase 3: Control Logic & Integration (Done)

- [x] **Main Control Unit:** Decodes the 7-bit opcode to generate multiplexer selectors and enable signals (e.g., `RegWrite`, `MemRead`, `MemWrite`, `Branch`)
- [x] **ALU Control Unit:** Decodes `funct3` and `funct7` fields alongside Main Control signals to drive the specific ALUop signals
- [x] **Top-Level Module:** Instantiate and wire all components together (PC, Memories, RegFile, ALU, Controllers, and Muxes)

---

## Phase 4: Hardware Verification & Testing (WIP)

- [x] **Module-Level Unit Testing:**
  - [x] ALU Testbench (Test all arithmetic/logical conditions and zero flag)
  - [x] Register File Testbench (Verify write behavior and `x0` isolation)
  - [x] ImmGen Testbench (Verify sign-extension across all instruction formats)
  - [x] Control Unit Testbench
  - [x] ALU Control Testbench
  - [x] PC Testbench
  - [x] Data Mem Testbench
  - [x] Instruction Mem Testbench (Ensuring correctly reading hex file)
- [ ] **Full System Execution (Assembly):**
  - [ ] Write a basic RISC-V assembly program (e.g., Fibonacci sequence or a loop counter)
  - [ ] Assemble program into hex machine code
  - [ ] Load hex into Instruction Memory
  - [ ] Simulate entire CPU clock cycles and verify register states/Data Memory in a waveform viewer (e.g., GTKWave)
