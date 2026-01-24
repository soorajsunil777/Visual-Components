# Virtual Commissioning

This folder contains virtual commissioning work for Rexroth Transfer System TS2, integrating Visual Components simulation models with PLC control logic. 

The work establishes a standardized framework through systematic data evaluation, development environment definition, and proof-of-concept implementation with operational PLC function blocks for selected material flow scenarios, which was then generalized and expanded across the entire TS2 library.

### Technologies Used:

- **Simulation Platform:** Visual Components 4.10
- **PLC Programming:** Structured Text (IEC 61131-3) ctrlX PLC Engineering
- **Data Layer:** ctrlX AUTOMATION
- **Communication protocol:** OPC UA / Signal-based integration
- **Control Architecture:** Function plan control methodology


---

<div align="left">
  <i>Figure 1: Virtual commissioning development overview and workflow</i>
</div>


```
┌─────────────────────────────────────────────────────────────────────────┐
│ WP1: Software Environment                                               │
│ • Virtual crlX, OPC UA Server App, OPC UA Connection Visual Components  │
│ • Development environment                                               │
└──────────────────────────────────┬──────────────────────────────────────┘
                                   │
                                   ↓
┌─────────────────────────────────────────────────────────────────────────┐
│ WP2: Simulation Objects                                                 │
│ • List of components, variables, properties                             │
│ • Evaluate Python code (Internal component mechanism)                   │
└──────────────────────────────────┬──────────────────────────────────────┘
                                   │
                                   ↓
┌─────────────────────────────────────────────────────────────────────────┐
│ WP3: Screening Product Documentation                                    │
│ • I/O signals, Sequence of actions, Node Variances (Basic and extended) │
│                                                                         │
└──────────────────────────────────┬──────────────────────────────────────┘
                                   │
                                   ↓
┌─────────────────────────────────────────────────────────────────────────┐
│ WP4: Simulation Objects Visual Components Evaluation                    │
│ • Comparison of I/O signals and simulation variables, comparison of     │
│   sequence of actions with simulation mechanism                         │
│ • Modification of components:Adding additional attributes and behaviours│ 
│   to mimic the real life counterpart of the system.                     │          
└──────────────────────────────────┬──────────────────────────────────────┘
                                   │
                                   ↓
┌─────────────────────────────────────────────────────────────────────────┐
│ WP5: Demonstrator                                                       │
│ • Layout definition (TFE1, TFE2, TFE3, TFE4 etc.), Configurable PLC FBs │
│                                                                         │
└─────────────────────────────────────────────────────────────────────────┘
```

## Virtual Commissioning Demostrator Models

Proof-of-concept Virtual Commissioning demonstration models showcasing virtual commissioning capabilities and system behavior validation.

**Demonstrator Visualizations:**

<div align="center">
  <img src="PoC demo models/ctrlX Dashboard.png" alt="ctrlX WORKS Dashboard" width="550"/>
</div>

<div align="center">
  <i>Figure 2: ctrlX WORKS Dashboard</i>
</div>

<br>
<div align="center">
  <img src="PoC demo models/VCOM TFE1.gif" alt="TFE1 Virtual Commissioning Demo" width="550"/>
</div>

<div align="center">
  <i>Figure 3: TFE1 Function Plan Demonstrator</i>
</div>

<br>

<div align="center">
  <img src="PoC demo models/VCOM TFE3.gif" alt="TFE3 Virtual Commissioning Demo" width="550"/>
</div>

<div align="center">
  <i>Figure 4: TFE3 Function Plan Demonstrator</i>
</div>

<br>

<div align="center">
  <img src="PoC demo models/VCOM TFE4 Combined.gif" alt="TFE4 Virtual Commissioning Demo" width="550"/>
</div>

<div align="center">
  <i>Figure 5: Combination of Function plans Demonstrator</i>
</div>

<br>

## Key Features

- **Digital Twin Integration:** Real-time synchronization between simulation model and PLC control system
- **Function Plan Control:** Structured implementation of transfer system control sequences
- **State Machine Logic:** Robust state-based control for reliable material handling operations
- **Scalable Architecture:** Modular control structure supporting various system configurations
- **Early Validation:** Pre-commissioning verification of control logic and system behavior
---

*This work demonstrates practical implementation of virtual commissioning workflows for industrial automation systems, enabling efficient validation and optimization of control systems prior to physical deployment.*
