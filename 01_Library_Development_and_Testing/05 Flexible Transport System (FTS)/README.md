# Flexible Transport System (FTS) — Visual Components Simulation Library

A parametric **Visual Components 5.0 Premium** component library for the Bosch Rexroth
**Flexible Transport System (FTS)** — a linear-motor transport system whose workpiece
carriers (WPCs) are independently controllable along the track. This section documents the
component and variant modelling, three carrier-movement behaviour approaches, centralised
collision avoidance, two families of statistics, and a drive-sizing import add-on.

> Built during an internship in Customer Business Factory Automation, Bosch Rexroth AG
> (Lohr am Main). Scope: simulation model → virtual-commissioning demonstrator → library release.

![FTS layout example](01_System_Overview/fts_layout_example.png)

---

## Contents

1. [System Overview](#1-system-overview)
2. [Component & Variant Modelling](#2-component--variant-modelling)
3. [Behaviour Modelling — three approaches](#3-behaviour-modelling--three-approaches)
4. [Collision Avoidance](#4-collision-avoidance)
5. [Statistics Analysis](#5-statistics-analysis)
6. [Drive-Sizing DPF Import Add-On](#6-drive-sizing-dpf-import-add-on)
7. [Tools & Stack](#7-tools--stack)
8. [Virtual Commissioning (in progress)](#8-virtual-commissioning-in-progress)

---

## 1. System Overview

The FTS moves products on independently controllable carriers driven by linear motors. The
library reduces a real layout to three reusable simulation components — a straight **Section**,
a **Carrier (WPC)**, and a **Horizontal Ferry** for lateral transfer between parallel sections.
Curves, vertical elevators, and rotational platforms are deferred to a later version.

![FTS VC library development overview](01_System_Overview/fts_overview.png)

<!-- full system running: carriers traversing sections + ferry transfer -->
![FTS full run](01_System_Overview/fts_full_run.gif)

---

## 2. Component & Variant Modelling

Each component is parametric, so a single component reconfigures into the variants a real layout
needs (track length, motor pitch, carrier size, ferry port count).

### Section
Parametric straight track; length and linear-motor pitch drive the geometry and the motion model.

![Section component graph](02_Component_and_Variant_Modelling/Section/section_component_graph.png)
![Section variants](02_Component_and_Variant_Modelling/Section/section_variants.gif)

### Carrier (WPC)
The independently controllable mover. Carries the motion model and per-carrier state.

![Carrier component graph](02_Component_and_Variant_Modelling/Carrier_WPC/carrier_component_graph.png)
![Carrier variants](02_Component_and_Variant_Modelling/Carrier_WPC/carrier_variants.gif)

### Horizontal Ferry
Lateral transfer between parallel sections; routing rules across its ports, geometry scaled to
section width.

![Ferry component graph](02_Component_and_Variant_Modelling/Horizontal_Ferry/ferry_component_graph.png)
![Ferry transfer](02_Component_and_Variant_Modelling/Horizontal_Ferry/ferry_transfer.gif)

---

## 3. Behaviour Modelling — three approaches

Per-carrier motion was prototyped three ways. They coexist; the **Link-Based** approach is the
adopted production architecture for timing-accurate simulation and virtual commissioning, while
the path-based approaches serve layout and throughput studies.

| Approach | Carrier modelled as | Independent velocity | Opposing motion on one section | Inter-carrier blocking | Best for |
|---|---|---|---|---|---|
| **Link-Based** | Component with a Custom DOF translational joint, driven by `vcServoController` setpoints | Yes (one joint per carrier) | Yes | Centralised supervisor (see §4) | Timing-accurate simulation, virtual commissioning |
| **Dynamic Path-Based** | Product flowing on VC path behaviour(s); position parameterised by path distance | Per-path | Limited | Within a single path | Throughput / layout studies |
| **VC Path-Based** | Product on VC path(s), one path per carrier | Per-path override | No | Breaks across separate paths* | Quick layout sketches |

\* With one path per carrier, `Accumulate` and `SpaceUtilisation` only apply within a single
path, so inter-carrier blocking is not captured — documented as a known limitation.

### 3.1 Link-Based (adopted)
Carrier = component with its own translational joint; `vcServoController` runs the trapezoidal
profile, giving true independent speed / acceleration / direction per carrier.

![Servo controller carrier movement architecture](03_Behaviour_Modelling/01_Link_Based/servo_controller_architecture.png)
![Link-based demo](03_Behaviour_Modelling/01_Link_Based/link_based_demo.gif)

### 3.2 Dynamic Path-Based
![Dynamic path-based demo](03_Behaviour_Modelling/02_Dynamic_Path_Based/dynamic_path_demo.gif)

### 3.3 VC Path-Based
![Multiple-path carrier movement](03_Behaviour_Modelling/03_VC_Path_Based/multiple_path_movement.png)
![VC path-based demo](03_Behaviour_Modelling/03_VC_Path_Based/vc_path_demo.gif)

---

## 4. Collision Avoidance

A centralised supervisor computes a permitted position window `[pmin, pmax]` per carrier and
publishes movement permits; each carrier clamps its move target to its window and re-issues as
windows advance. This keeps carriers from converging on the same track segment.

![Collision avoidance architecture](04_Collision_Avoidance/collision_avoidance_architecture.png)
![Supervisor logic](04_Collision_Avoidance/supervisor_logic.png)
![Carrier step loop](04_Collision_Avoidance/carrier_step_loop.png)
![Collision avoidance demo](04_Collision_Avoidance/collision_avoidance_demo.gif)

---

## 5. Statistics Analysis

Two families of statistics run on top of the simulation:

- **State-based (per carrier)** — time spent per carrier state (e.g. IDLE / BUSY / BLOCKED /
  BROKEN), yielding utilisation and per-state percentages.
- **Flow-based (per section)** — material-flow metrics (components arrived/departed, average
  time, parts utilisation) via explicit `flowEnter()` / `flowLeave()` calls, required here
  because carriers are not held in VC containers.

![Statistics analysis overview](05_Statistics_Analysis/statistics_overview.png)
![Tier 1 — carrier state statistics](05_Statistics_Analysis/tier1_carrier_states.png)
![Tier 2 — section flow statistics](05_Statistics_Analysis/tier2_section_flow.png)

---

## 6. Drive-Sizing DPF Import Add-On

A Visual Components add-on that imports a **`.dpf` project file** exported from the Bosch Rexroth
**Drive Sizing Tool** and applies the selected motor/drive configuration onto the matching FTS
components (motor company, motor type, drive, etc.). The add-on closes the loop between drive
dimensioning and the simulation model.

![DPF import flow](06_Drive_Sizing_DPF_Import_AddOn/dpf_import_flow.png)
![Add-on command panel](06_Drive_Sizing_DPF_Import_AddOn/addon_command_panel.png)
![Before/after parameterisation](06_Drive_Sizing_DPF_Import_AddOn/before_after_parameterization.gif)

Implementation notes: VC add-on environment (Python 2.7 / IronPython); native file browse via a
`URI` property in a command panel; components filtered by an `FTS_Component` property gate before
any change is applied.

---

## 7. Tools & Stack

| Area | Tools |
|---|---|
| Simulation | Visual Components 5.0 Premium |
| Scripting | Python 3 (component behaviours, `vcCore` asyncio) · Python 2.7 / IronPython (add-ons) |
| Motion control | NYCe4000 stack (NYCeConfigurator, NYCeTuner, MCU), Bosch Rexroth Drive Sizing Tool |
| Connectivity (VC mode) | OPC UA · ctrlX CORE · TCP socket |
| Architecture & diagrams | FigJam |

---

## 8. Virtual Commissioning (in progress)

Extends the model to a digital twin: an external control service owns carrier motion and VC
animates streamed positions (internal supervisor bypassed). Connectivity options under
evaluation: OPC UA vs. TCP socket. *Coming soon.*

---

<sub>This section documents simulation/architecture concepts; it intentionally omits proprietary
production code and internal repository details.</sub>
