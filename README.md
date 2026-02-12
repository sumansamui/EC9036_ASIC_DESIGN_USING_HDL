# EC9036 — ASIC Design using HDL (Verilog)

Course repository for **EC9036 (PEL)**, *M.Tech. in Microelectronics & VLSI*, Department of Electronics & Communication Engineering.

This repo contains:
- **Syllabus & course outcomes**
- **Lecture slides (Verilog + supporting VHDL material)**
- **Basic HDL code templates**
- **System-design mini-projects (FIFO, GCD, MAC, filters, pipelining, gate-level modelling)**
- **Lab problem sets + submission guideline**
- **Verification examples (testbenches + SystemVerilog/OOP basics)**

---

## Course snapshot (from `Syllabus.pdf`)
- **Course code/title:** EC9036 — *ASIC Design using Verilog*
- **Contact hours:** 70 (Lecture 42 + Practical/Sessional 28)
- **Credits:** L–T–P = 3–0–2 (Total 5), **Credits = 4**
- **Pre-requisite:** Digital Circuits and Systems (ECC402)
- **Assessment:** Assignments, quiz/class test, mid-sem exam, end-sem exam

### Course outcomes
1. Explain VLSI design flow using HDL  
2. Analyze and design combinational and sequential digital systems  
3. Employ Verilog to model a digital system  
4. Write testbenches to verify the design  
5. Compare blocking vs non-blocking statements and their uses  
6. Create a system from simulation to synthesizable design  

### Modules (high level)
- VLSI CAD + HDL-based design flow
- Hierarchical modeling (top-down / bottom-up)
- Verilog basics, memory modeling, synthesis view
- Modules/ports + hierarchy
- Gate-level, dataflow, behavioral modeling (blocking/non-blocking, generate, event control)
- Tasks vs functions, modelling techniques
- FF/counter design
- FSM + datapath/controller, memory, pipelining, processor intro; FPGA flow
- Intro SystemVerilog + UVM essentials (overview)

**Textbooks**
- Samir Palnitkar, *Verilog HDL*, Pearson (2nd Ed.)
- J. Bhaskar, *Verilog HDL Synthesis*, BS Publications
- C. H. Roth Jr. and L. K. John, Digital Systems Design Using VHDL, Cengage Learning
---

## Repository structure

```text
EC9036_ASIC_DESIGN_USING_HDL/
├── Syllabus.pdf
├── Verilog-HDL/
│   ├── Intro.pdf
│   ├── 01_verilog_fundamental.pdf
│   ├── 02_System_design.pdf
│   ├── blockin_non_blocking.pdf
│   ├── verification/
│   │   ├── verilog_tb.pdf
│   │   ├── sv_oop.pdf
│   │   └── *.v (TB + SV/OOP practice)
│   └── System_design_projects/
│       ├── FIFO/ (fifo.v, rw_mem.v, tb_fifo.v, FIFO.pdf)
│       ├── GCD/  (v1/*, tb_gcd.v, GCD.pdf)
│       ├── MAC/  (v1/*, v2/*, top_mac_tb.v, MAC.pdf)
│       ├── Digital_filter/ (moving_avg_4_filter.v, etc.)
│       ├── gate_level_modelling/ (primitive_gates.pdf)
│       └── pipelined_architecture/ (pipelined_vs_non-pipelined.v, pdf)
├── VHDL/ (supporting slides)
├── basic_codes/
│   └── codes/
│       ├── Verilog/ (GCD, FSM/counter, seq detectors, shift regs, etc.)
│       └── VHDL/    (clock divider, shift registers, ring counter, etc.)
└── problem_set_Lab/
    ├── Assignment submission guideline.pdf
    ├── 1_Sequential_Summation_System.pdf
    ├── 2_FSM_Sequential_Logic_Operator_Selector.pdf
    ├── 3_4_point_moving_average_filter_problem.pdf
    └── basic_practice_set/ (Problem sets + lab exam tasks)
```


## License
This repository is released under the **MIT License** (see `LICENSE`).

---

## Maintainer / Contact
**Dr. Suman Samui**  
Department of ECE, NIT Durgapur
