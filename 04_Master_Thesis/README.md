
## Master thesis: Evaluation of EPLAN Generation in a Digital Engineering Tool Chain for Mechatronic Transport Systems

## Overview
This repository contains artifacts, models, and prototypes from the Master thesis *“Evaluation of EPLAN Generation in a Digital Engineering Tool Chain for Mechatronic Transport Systems”*, focusing on integrating simulation and electrical engineering workflows.

## Motivation
Production system engineering spans multiple disciplines and tool chains with fragmented data models, causing manual exchange, inconsistencies, and limited automation. A common, tool-independent data basis is needed to reliably automate electrical documentation from upstream engineering data.

## Objective
Evaluate enriching Rexroth’s Transfer System 2 (TS2) simulation artifacts with electrical metadata to generate electrical diagrams in EPLAN eBUILD via a scalable data logistics pipeline between Visual Components and EPLAN, based on a Common Data Model (CDM) implemented with AutomationML and aligned with the DIAMOND research project.

The goal is a consistent, reusable engineering data foundation that reduces manual documentation effort, improves traceability, and supports a standardized, automation-ready toolchain for mechatronic transport systems.

## Scope
The thesis includes:
- Analysis of domain-specific information models in Simulation and Electrical engineering domains.  
- Development of a Common data model based on DIAMOND concepts.  
- Prototypical generation of EPLAN relevant data from upstream planning artifacts (Visual Components simulation model)  
- *Implementation of data logistics* – Within this subtask the intended data logistics and the wiring plan generation algorithm shall be implemented. Starting point for this implementation shall be the public available results of the DIAMOND project and AutomationML based realizations at Otto-von-Guericke University. For the implementation of the wiring plan generation algorithm a python implementation integratable in the engineering data logistics shall be realized.
- Prototypical application of developed pipeline applied to an example production system.
- Evaluation of the approach with respect to engineering effort, data consistency, and automation potential.

### Technologies Used:

- **Simulation Platform:** Visual Components 4.10
- **ECAD:** EPLAN Electric P8 2026, eBUILD Library Designer, eBUILD Project Generation
- **Data exchange format:** Automation ML, JSON, XML.
- **Engineering Data logistics pipeline:** Streamlit based python implementation 

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
Extended TS2 simulation objects by adding electrical attributes metadata for EPLAN generation and in accordance with Transfer System 2 product documentation.

- Implemented internal Python logic to generate a unique identifier Device Tag (DT) for each instantiated simulation object.
- Introduced an export string property, consisting of a comma-separated attribute list of each component, that specifies which component attributes and behaviors shall be included by the exporter add-on during data export.

<div align="center">
  <img src="TS2 Custom components.png" alt="TS2 custom components with electrical metadata" width="550"/>
</div>

<div align="center">
  <i>Figure 4: TS2 components extended with electrical metadata</i>
</div>

<div align="center">
  <img src="DeviceTag generation.png" alt="Device Tag generation and export string" width="550"/>
</div>

<div align="center">
  <i>Figure 5: Device Tag generation and export string configuration</i>
</div>


## Visual Components Information Model Export

Implementation of a model export AddOn that enables export of component hierarchies, electrical metadata and EPLAN generation algorithms (Structure Identifiers, rule sets etc.) from Visual Components.

<div align="center">
  <img src="VC IF model export.png" alt="Visual Components Interface Model Export" width="550"/>
</div>

<div align="center">
  <i>Figure 3: Visual Components Information model export AddOn</i>
</div>

<br>

---

*Thesis Work in progress.*