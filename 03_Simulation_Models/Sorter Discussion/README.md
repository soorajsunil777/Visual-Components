# Sorting System Design

Evaluation of three design approaches for an efficient sorting system that handles mixed product flow from multiple sources and ensures single product-type output on each conveyor line.

## Approach 1: Waterfall Sorting (Horizontal Conveyors)
- Multiple horizontal conveyors at different vertical levels
- Lift transverse units as decision points
- Heuristic decomposition: pre-sort products from sources 3 & 4
- **Trade-off:** More decision points = better flexibility but higher cost

<div align="center">
  <img src="Approach%201%20Design%20concept-%20Horizontal%20Conveyors.png" alt="Horizontal Conveyors Design" width="550"/>
</div>

<div align="center">
  <i>Figure 1: Design concept-Horizontal conveyor</i>
</div>

<br>

<div align="center">
  <img src="Approach%201%20Horizontal%20Conveyor%20Sorting%20Logic.png" alt="Horizontal Conveyor Sorting Logic" width="550"/>
</div>

<div align="center">
  <i>Figure 2: Decision flow logic for horizontal conveyors</i>
</div>

<br>

<div align="center">
  <img src="VC%20Model%20Approach1.png" alt="VC Model Approach 1" width="550"/>
</div>

<div align="center">
  <i>Figure 3: Approach 1-Visual Components model</i>
</div>

<br>

<div align="center">
  <img src="VC%20Model%20Sort%20Approach1.png" alt="Sorter Configuration Approach 1" width="550"/>
</div>

<div align="center">
  <i>Figure 4: Approach 1-Sorter configuration</i>
</div>

<br>

## Approach 2: Circular Conveyor with Bypass
- Central circular conveyor with capacity control logic
- Bypass lines for direct transfer to target conveyors
- Fill level control at entry/exit points
- Eliminates blockages by allowing circulation when target full
- **Components:** Lift transverse units + capacity control nodes

<div align="center">
  <img src="Approach%202%20Circular%20conveyor.png" alt="Circular Conveyor Concept" width="550"/>
</div>

<div align="center">
  <i>Figure 5: Design concept-Circular conveyor</i>
</div>

<br>

<div align="center">
  <img src="Approach%202%20Circular%20Conveyor%20sorting%20logic.png" alt="Circular Conveyor Design" width="550"/>
</div>

<div align="center">
  <i>Figure 6: Decision flow logic for Circular conveyor</i>
</div>

<br>

<div align="center">
  <img src="VC%20Model%20Approach2.png" alt="VC Model Approach 2" width="550"/>
</div>

<div align="center">
  <i>Figure 7: Approach 2-Visual Components model</i>
</div>

<br>

<div align="center">
  <img src="VC%20Model%20Sort%20Approach2.png" alt="Sorter Configuration Approach 2" width="550"/>
</div>

<div align="center">
  <i>Figure 8: Approach 2-Sorter configuration</i>
</div>

<br>

## Approach 3: Dead-end Buffers
- Temporary storage lines for pre-sorting before transfer
- Buffer lines can accumulate products and distribute to output when required
- Enables strategic product batching and reduces congestion
- **Trade-off:** Additional space required but improved sorting flexibility

<div align="center">
  <img src="Approach%203%20Dead%20end%20buffers.png" alt="Dead-end Buffers" width="550"/>
</div>

<div align="center">
  <i>Figure 9: Dead-end buffer configuration</i>
</div>

<br>
