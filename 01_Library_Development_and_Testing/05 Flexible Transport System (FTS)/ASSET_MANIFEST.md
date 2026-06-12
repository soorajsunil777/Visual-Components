# Asset manifest — what to drop where

Delete this file once the images are in place. Filenames below match the embed paths in
`README.md`, so once a file lands at the listed path it renders automatically on GitHub.

## Already on disk (from the project) — just copy in and rename
| Source file | Target path |
|---|---|
| `FTSSingle_Section_Component_graph.png` | `02_Component_and_Variant_Modelling/Section/section_component_graph.png` |
| `FTSCarrier_Component_graph.png` | `02_Component_and_Variant_Modelling/Carrier_WPC/carrier_component_graph.png` |
| `FTSHorizontal_Ferry_Component_graph.png` | `02_Component_and_Variant_Modelling/Horizontal_Ferry/ferry_component_graph.png` |
| `Example_FTS_layout_with_Carrier_Ferry_Segment.png` | `01_System_Overview/fts_layout_example.png` |

## Export from FigJam (board: FTS Library Development)
In FigJam: select the frame → right-click → **Copy/Paste as → Copy as PNG**, or
**Export** from the right panel. Save to the path shown.

| FigJam frame | Target path |
|---|---|
| Overview page (node `0:1`) | `01_System_Overview/fts_overview.png` |
| "VC Servo Controller Carrier Movement" diagram (in node `60:96`) | `03_Behaviour_Modelling/01_Link_Based/servo_controller_architecture.png` |
| "Multiple Path based FTS Carrier Movement" (node `36:92`) | `03_Behaviour_Modelling/03_VC_Path_Based/multiple_path_movement.png` |
| "Controlled Collision Avoidance Architecture V1" (in `60:96`) | `04_Collision_Avoidance/collision_avoidance_architecture.png` |
| "FTS Collision Avoidance — Supervisor Logic V1" (in `60:96`) | `04_Collision_Avoidance/supervisor_logic.png` |
| "FTS Collision Avoidance — Carrier Step Loop V1" (in `60:96`) | `04_Collision_Avoidance/carrier_step_loop.png` |
| "FTS Statistical Analysis" (node `97:914`) | `05_Statistics_Analysis/statistics_overview.png` |
| "Drive Sizing Tool DPF import VC AddOn" (node `118:739`) | `06_Drive_Sizing_DPF_Import_AddOn/dpf_import_flow.png` |

## Capture in Visual Components (GIFs / screenshots)
| Capture | Target path |
|---|---|
| Whole layout running | `01_System_Overview/fts_full_run.gif` |
| Section / Carrier / Ferry variants reconfiguring | `02_.../<component>/<...>_variants.gif`, `ferry_transfer.gif` |
| Link-Based carriers (independent speeds) | `03_Behaviour_Modelling/01_Link_Based/link_based_demo.gif` |
| Dynamic Path-Based run | `03_Behaviour_Modelling/02_Dynamic_Path_Based/dynamic_path_demo.gif` |
| VC Path-Based run | `03_Behaviour_Modelling/03_VC_Path_Based/vc_path_demo.gif` |
| Two carriers converging + permit window | `04_Collision_Avoidance/collision_avoidance_demo.gif` |
| Carrier-state statistics panel | `05_Statistics_Analysis/tier1_carrier_states.png` |
| Section-flow statistics panel | `05_Statistics_Analysis/tier2_section_flow.png` |
| Add-on command panel / browse dialog | `06_Drive_Sizing_DPF_Import_AddOn/addon_command_panel.png` |
| Component before/after DPF import | `06_Drive_Sizing_DPF_Import_AddOn/before_after_parameterization.gif` |

## Reference tables (from node `60:96`)
The Software Stack / APIs & Libraries / Tools / System States tables on that page are easiest as
**Markdown tables** in the README rather than screenshots. Send me the legible text (or a
higher-zoom export) and I'll format them.
