
## Master thesis: Evaluation of EPLAN Generation in a Digital Engineering Tool Chain for Mechatronic Transport Systems

## Overview
This repository contains the research artifacts, models, and prototypes developed within the scope of the Master thesis *“Evaluation of EPLAN Generation in a Digital Engineering Tool Chain for Mechatronic Transport Systems”*. The work is conducted in the context of digital production system engineering and focuses on the integration of simulation and electrical engineering workflows.

## Motivation
Modern production system engineering involves multiple disciplines and tool chains, each relying on domain-specific data models. The lack of harmonized information models leads to manual data exchange, inconsistencies, and limited automation potential. In particular, the generation of electrical documentation from upstream engineering data remains largely tool-specific and error-prone. A common, tool-independent data basis is required to enable automated and reliable engineering workflows.

## Objective
The thesis evaluates how simulation/ planning artifacts of Rexroth’s Transfer System 2 (TS2) can be enriched with electrical metadata to support electrical diagram generation using EPLAN eBUILD, by developing a scalable engineering data logistics pipeline between Visual Components and EPLAN based on a Common Data Model (CDM), implemented with AutomationML. This approach is aligned with results from the DIAMOND (Digitale Anlagenmodellierung mit neutralen Datenformaten) research project, which develops an adaptable CDM and modern data exchange via shared data spaces, funded by the EU and the German federal government with 25 consortium partners.

The objective is to establish a consistent and reusable engineering data foundation across disciplines, reduce manual effort in electrical documentation, enhance traceability from upstream planning artifacts to the resulting electrical design and contribute toward a standardized, automation ready digital engineering toolchain for mechatronic transport systems.

## Scope
The thesis includes:
- Analysis of domain-specific information models in Simulation and Electrical engineering domains.  
- Development of a Common data model based on DIAMOND concepts.  
- Prototypical generation of EPLAN relevant data from upstream planning artifacts (Visual Components simulation model)  
- *Implementation of data logistics* – Within this subtask the intended data logistics and the wiring plan generation algorithm shall be implemented. Starting point for this implementation shall be the public available results of the DIAMOND project and AutomationML based realizations at Otto-von-Guericke University. For the implementation of the wiring plan generation algorithm a python implementation integratable in the engineering data logistics shall be realized.
- Prototypical application of developed pipeline applied to an example production system.
- Evaluation of the approach with respect to engineering effort, data consistency, and automation potential.

## Information Flow Architecture

The framework implements a comprehensive information flow model that facilitates bidirectional data exchange between Visual Components and external applications, databases, or analysis tools.

<div align="center">
  <img src="Overall information flow.png" alt="Overall Information Flow Architecture" width="550"/>
</div>

<div align="center">
  <i>Figure 1: Overall information flow architecture for the data exchange framework</i>
</div>

## Production System Application

Demonstration of the framework applied to a complete production system, showcasing practical implementation and validation of the data exchange methodology.

<div align="center">
  <img src="Eg. production system.png" alt="Example Production System" width="550"/>
</div>

<div align="center">
  <i>Figure 2: Example production system used for framework validation and testing</i>
</div>

## Enriching Transfer System simulation objects with electrical metadata



## Visual Components Information Model Export

Implementation of a model export AddOn that enables export of component hierarchies, electrical metadata and EPLAN generation algorithms (Structure Identifiers, rule sets etc.) from Visual Components.

<div align="center">
  <img src="VC IF model export.png" alt="Visual Components Interface Model Export" width="550"/>
</div>

<div align="center">
  <i>Figure 3: Visual Components Information model export AddOn</i>
</div>

<br>