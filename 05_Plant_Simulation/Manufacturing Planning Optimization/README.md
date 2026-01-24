# Plant Simulation and Optimization

This folder documents the application of discrete event simulation and genetic algorithm-based optimization techniques for material flow systems using Siemens Technomatix Plant Simulation.

## Overview

Plant Simulation provides a comprehensive environment for discrete event simulation and optimization of production and logistics systems. This project applies evolutionary optimization methods to enhance material flow efficiency in conveyor-based transport systems, demonstrating the integration of simulation technology with metaheuristic optimization algorithms.

## Simulation Model Architecture

The simulation model represents a material flow system with multiple conveyor sections, workstations, and material handling components. The system architecture was designed to capture realistic production scenarios while maintaining computational tractability for optimization experiments.

<div align="center">
  <img src="Plant Simulation model 2D.png" alt="Plant Simulation 2D Model" width="550"/>
</div>

<div align="center">
  <i>Figure 1: Plant Simulation model - 2D</i>
</div>

<br>

<div align="center">
  <img src="Plant Simulation model 3D.png" alt="Plant Simulation 3D Model" width="550"/>
</div>

<div align="center">
  <i>Figure 2: Plant Simulation model - 3D</i>
</div>

<br>

## Genetic Algorithm Optimization

Genetic algorithm (GA) was implemented to optimize system performance parameters, including Production Sequence, Makespan and Tardiness reduction b minimising the fiteness fucntion (Z).

### Optimization Results

The genetic algorithm demonstrated effective convergence toward optimal system configurations over successive generations, with significant improvements in the fitness function values observed in early iterations.

<div align="center">
  <img src="Evolution of the fitness values of the generations.png" alt="Fitness Evolution" width="550"/>
</div>

<div align="center">
  <i>Figure 3: Evolution of fitness values across generations showing convergence characteristics</i>
</div>

<br>

### Experimental Results Summary

```
+------------------+--------------------+------------------+
| No. of Generation| Size of Generation |   Minimized Z    |
+------------------+--------------------+------------------+
|        5         |         5          |  1:07:27:40.1726 |
|        5         |         10         |  2:11:34:17.5726 |
|        10        |         10         |  1:02:03:36.5452 |
|        15        |         15         |  1:02:27:52.9227 |
|        20        |         20         |  22:30:13.5641   |
+------------------+--------------------+------------------+
```

<div align="center">
  <i>Table 1: Experimental results comparing baseline and optimized configurations across generations</i>
</div>

<br>

## Optimization results

- Best Fitness Value: 23:33:37.0149 The parameters of the best solution are set in the model.
- Best parameter of the allocation problems: Prod A Lot Size: 21, Prod B Lot Size: 21, Prod C Lot Size: 21, Prod D Lot Size: 21, Prod E Lot Size: 61
- Best solutions of the sequence problems: **Product B > Product D, Product C, Product A, Product E**
---

*This work demonstrates the integration of discrete event simulation with  optimization for systematic enhancement of material flow system performance.*
