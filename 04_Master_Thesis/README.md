# Master Thesis: Evaluation of EPLAN Generation in a Digital Engineering Toolchain for Mechatronic Components of Transport Systems

<sub>Otto-von-Guericke University Magdeburg · Institute for Engineering of Products and Systems (IEPS) · in cooperation with Bosch Rexroth AG · 2026</sub>

## Overview

This thesis develops and validates an **engineering data logistics pipeline** that automatically generates EPLAN electrical wiring schematics directly from upstream **Visual Components** simulation artifacts, closing the manual, error-prone gap between mechanical layout planning and electrical design in a digital engineering toolchain for mechatronic transport systems.

The prototype is realized for Bosch Rexroth **Transfer System 2 (TS2)** components, and the generated wiring plans are validated against a real Bosch Rexroth TS2 reference project, confirming structural correspondence at the page, device, and connection levels.

## Motivation & Problem Statement

In Bosch Rexroth's digital engineering toolchain, the transition from mechanical layout planning (Visual Components) to electrical wiring design (EPLAN Electric P8) is **not automated**. The two tools use proprietary, non-harmonised data models with no neutral interface, so wiring diagrams are authored manually, which increases engineering effort and produces inconsistencies between the simulation model and the wiring plan.

Existing AutomationML-based data logistics approaches further assume that *every* domain supplies its own raw export, leaving the case of a **derived target domain** (a domain whose data must be derived from other domains rather than exported directly) unaddressed.

<div align="center">
  <img src="Bosch Rexroth toolchain.png" alt="Bosch Rexroth digital engineering toolchain" width="620"/>
</div>
<div align="center">
  <i>Figure 1: Bosch Rexroth digital engineering toolchain; the simulation-to-electrical (EPLAN) handoff is the manual gap this thesis automates</i>
</div>

<br/>

## Objective & Contribution

The work extends the **Integrated Engineering Data Transformation (IEDT)** framework to derive wiring-planning data from upstream simulation artifacts and use it to generate electrical schematics downstream. It builds on the foundations of the **DIAMOND** project, the **CDM4PSE** common data model, and **AutomationML** as the neutral exchange format.

The **Extended IEDT framework** adds three capabilities to the baseline:

- **Cross-domain data derivation:** an intermediate integration stage that lets a *target* domain (wiring planning) with no independent raw export be derived from upstream source domains already in the common data model.
- **Identification View:** an explicit mechanism that resolves the domain-local naming conventions of heterogeneous tools to a shared global asset identifier.
- **Continuous pipeline:** rule authoring, transformation, integration, export, and roundtrip exchange consolidated into a single environment, so the integrated model continuously reflects the engineering state across all tools.

## Scope

- Analysis of domain-specific information models across the Simulation, Wiring planning, and PPR domains.
- A tool-independent **Common Concept Model (CCM)** unifying the three domains, aligned with the DIAMOND project results and AutomationML realisations at OvGU.
- A Python-based data logistics pipeline that generates EPLAN-relevant data from Visual Components planning artifacts, with bidirectional roundtrip exchange.
- Prototypical application to an example simulation system and a representative TS2 production system, evaluated against a reference wiring plan.

Implementation scope is limited to four representative TS2 components and a standardised TS2 function plan: **Conveyor Unit, Lift Transverse Unit (LTU), Stop Gate, and Switch Bracket Sensor**.

<div align="center">
  <img src="TS2 components.png" alt="The four TS2 components in scope" width="620"/>
</div>
<div align="center">
  <i>Figure 2: TS2 components in scope: a) Conveyor Unit, b) Lift Transverse Unit, c) Stop Gate, d) Switch Bracket Sensor</i>
</div>

<br/>

### Software Stack

- **Simulation Platform:** Visual Components 4.10 (Python 2.7 scripting for custom AddOns)
- **ECAD:** EPLAN Electric P8 (with designer license), eBuild (Library Designer, Project Generation)
- **Common data modelling:** Enterprise Architect with the RAMI 4.0 toolbox (CCM authoring & AML export)
- **Data exchange format:** AutomationML (CAEX 3.0), JSON, XML
- **Data logistics pipeline:** Streamlit-based Python implementation (extended PPR-AML tool)

## Methodology

Three domains are unified through the CCM: the **Simulation** domain (Visual Components) and **PPR** domain (Product-Process-Resource description of the production system) are upstream *source* domains, from which the downstream **Wiring planning** domain (EPLAN) is *derived*. The CCM is serialised as AutomationML and embeds three rule categories: **Common Concept Identification (CCI)**, **cross-domain attribute mapping**, and **roundtrip mapping**.

The generalised engineering data logistics architecture organises these domains into data sources (Simulation and PPR), a central transformation and integration stage built around the Common Data Model, and a data sink (the Wiring planning domain), with a roundtrip path feeding generated attributes back to the source. The architecture is tool-independent: each domain exchanges data through neutral AutomationML models.

<div align="center">
  <img src="Generalised EDL architecture.svg" alt="Generalised engineering data logistics architecture" width="900"/>
</div>
<div align="center">
  <i>Figure 3: Generalised tool-independent engineering data logistics architecture (data source, transformation and integration, data sink, with roundtrip)</i>
</div>

<br/>

The Extended IEDT framework realises this architecture as a continuous five-stage pipeline, from concept identification through to cross-domain derivation of the wiring-planning data.

<div align="center">
  <img src="Extended IEDT framework.png" alt="Extended IEDT framework five-stage pipeline" width="430"/>
</div>
<div align="center">
  <i>Figure 4: The Extended IEDT framework, a five-stage engineering data logistics pipeline</i>
</div>

<br/>

### Template-Based Wiring Plan Generation

Wiring schematics for mechatronic devices exhibit substantial structural repetition: the same arrangement of device symbols, terminals, and connections recurs across projects, differing only in electrical parameter values. The generation approach is therefore formulated as a tool-independent, template-based concept: predefined schematic fragments are parameterised with device-specific data and instantiated per device occurrence, rather than drawing each page element by element. This concept is realised in **EPLAN eBuild**: a TS2 eBuild library (macros, macro typicals, typical groups, and script typicals) is authored once in the eBuild Library Designer, and eBuild Project Generation combines this library with the eBuild configurator file produced by the pipeline to generate the complete EPLAN project.

<div align="center">
  <img src="eBuild project generation workflow.png" alt="eBuild project generation workflow" width="760"/>
</div>
<div align="center">
  <i>Figure 5: eBuild project generation workflow, from predefined library components to the generated EPLAN schematics</i>
</div>

<br/>

## Enriching TS2 Simulation Objects with Electrical Metadata

The TS2 Visual Components library was extended so that each simulation object carries the structured electrical metadata required for EPLAN generation, in accordance with the TS2 product documentation.

- Internal Python logic generates a unique **Device Tag (DT)** for each instantiated simulation object and subcomponent.
- An **export string** property, a comma-separated attribute list per component, specifies which attributes and behaviors the exporter AddOn includes during data export.

<div align="center">
  <img src="DeviceTag generation.png" alt="Device Tag generation and export string" width="550"/>
</div>
<div align="center">
  <i>Figure 6: Device Tag generation and export string configuration</i>
</div>

<br/>

## Visual Components Information Model Export

A custom model-export AddOn exports the component hierarchy, electrical metadata, and EPLAN generation parameters (structure identifiers, rule sets, etc.) from Visual Components.

<div align="center">
  <img src="VC IF model export.png" alt="Visual Components information model export" width="550"/>
</div>
<div align="center">
  <i>Figure 7: Visual Components information model export AddOn</i>
</div>

<br/>

**Visual Components AddOns developed:**

1. **JSON Exporter (Attribute Exporter):** exports the VC information model with selected component attributes in a structured JSON format.
2. **JSON Importer:** writes the mapped EPLAN roundtrip data back onto the corresponding attributes of each simulation object.

## Engineering Data Logistics Pipeline (Extended PPR-AML Tool)

The pipeline is realised as the **extended PPR-AML tool**, which adds cross-domain attribute mapping, VC/EPLAN input handlers, an EPLAN eBuild configuration-template mapper, and bidirectional roundtrip exchange to the DIAMOND-based baseline tool.

<div align="center">
  <img src="Tool-specific EDL architecture.svg" alt="Tool-specific engineering data logistics architecture" width="900"/>
</div>
<div align="center">
  <i>Figure 8: Tool-specific overall engineering data logistics architecture (DIAMOND backbone integrating the VC, PPR and EPLAN views)</i>
</div>

<br/>

Internally, the tool realises three processing layers: each input artefact is first normalised into a uniform intermediate representation (**ViewsDataModel**), then transformed into a domain-specific **AML-2** model; the **Integrator** consolidates these into a unified **central data model** that serves as the single source of truth for generating the integrated AML, the wiring-plan configuration, and the roundtrip data.

<div align="center">
  <img src="Data flow architecture.svg" alt="Tool-specific data flow architecture of the extended PPR-AML tool" width="500"/>
</div>
<div align="center">
  <i>Figure 9: Tool-specific data flow architecture of the extended PPR-AML tool: inputs and the CCM are normalised into a uniform ViewsDataModel, transformed into domain-specific AML-2 models, and consolidated by the Integrator into a unified central data model that drives the integrated AML, wiring-plan configuration, and roundtrip outputs</i>
</div>

<br/>

The tool consumes the domain-specific data models (VC JSON, PPR Excel), the Common Concept Model, the Identification View, and the eBuild configuration template, and produces the per-domain AML models, the integrated AML model, and the eBuild configurator file.

<div align="center">
  <img src="PPR-AML tool artefacts.svg" alt="PPR-AML tool input and output data artefacts" width="950"/>
</div>
<div align="center">
  <i>Figure 10: Input and output data artefacts of the extended PPR-AML tool</i>
</div>

<br/>

<div align="center">
  <img src="DIAMOND Engineering Data Logistics Streamlit web app.png" alt="DIAMOND EDL Streamlit app" width="950"/>
</div>
<div align="center">
  <i>Figure 11: Extended PPR-AML tool: DIAMOND engineering data logistics Streamlit app</i>
</div>

<br/>

The discipline-specific AML models (VC, PPR, EPLAN) are integrated into a single unified AML model around the Common Concept Model, which acts as the single source of truth for the pipeline.

<div align="center">
  <img src="Unified AML model.png" alt="Unified AML model from discipline-specific AML models" width="650"/>
</div>
<div align="center">
  <i>Figure 12: Unified AML model integrated from the discipline-specific AML models</i>
</div>

<br/>

In the eBuild generation tab, the integrated AutomationML model is mapped to the eBuild configuration template and the EPLAN SystemUnitClass library, and the eBuild configurator file is generated for handover to EPLAN eBuild.

<div align="center">
  <img src="eBuild configuration mapper.png" alt="eBuild configuration mapper tab of the extended PPR-AML tool" width="950"/>
</div>
<div align="center">
  <i>Figure 13: eBuild configuration mapper (Integration tab) of the extended PPR-AML tool</i>
</div>

<br/>

<div align="center">
  <img src="Eg.Generated eBUILD Config.png" alt="Generated eBuild configuration" width="650"/>
</div>
<div align="center">
  <i>Figure 14: Generated eBuild XML configuration for a TS2 Conveyor Unit, mapped from the DIAMOND backbone</i>
</div>

<br/>

## Prototype Application

The pipeline was applied end-to-end to a representative TS2 **production system** (an ECU-housing / PCB assembly line built from the in-scope TS2 components), as well as to a smaller example simulation system.

<div align="center">
  <img src="Example production system.png" alt="Example production system in Visual Components" width="500"/>
</div>
<div align="center">
  <i>Figure 15: Example TS2 production system modelled in Visual Components</i>
</div>

<br/>

The PPR (Product-Process-Resource) diagram below describes the same production system formally, capturing the products, processes, and the TS2 resources that execute them. This PPR view is one of the upstream source domains consumed by the pipeline, providing the production-system context that the simulation domain alone does not represent.

<div align="center">
  <img src="PPR diagram production system.svg" alt="PPR diagram of the example production system" width="560"/>
</div>
<div align="center">
  <i>Figure 16: PPR diagram of the example production system (green: Product, red: Process, grey: Resource)</i>
</div>

<br/>

## Results & Evaluation

From the integrated common data model (the single source of truth consolidating the VC, PPR, and derived wiring-planning data), the pipeline generated a complete EPLAN project, with schematic pages organised under structure identifiers (cabinet, machine, pneumatic) and parts lists, for every in-scope component instance, including correct device placement and connection resolution.

A comparative analysis against an existing Bosch Rexroth TS2 reference project confirmed **structural correspondence at the page, device, and connection levels**, including cross-references across pages. Differences are limited to instance-specific attribute values and project-specific naming conventions. Pages outside the defined scope (power distribution, AP-bus topology, PLC, compressed-air) appear as disconnected endpoints by design, leaving the generated mechatronic device layer to be connected during detailed electrical design.

<div align="center">
  <img src="Reference schematic.png" alt="Reference TS2 project conveyor drive schematic" width="560"/>
  <br/><br/>
  <img src="Eg. Generated schematics.png" alt="Automatically generated conveyor drive schematic" width="560"/>
</div>
<div align="center">
  <i>Figure 17: Reference TS2 project schematic (top) vs the automatically generated schematic (bottom) for a conveyor drive</i>
</div>

<br/>

## Roundtrip & Traceability

Because every concept carries a shared asset identifier across the domain views, EPLAN device attributes generated downstream (Device Tag, Full Device Tag, and schematic page reference) are propagated **back into the Visual Components model**. This establishes a closed information loop and cross-domain traceability that did not exist in the prior toolchain, supporting change management across the engineering workflow.

<div align="center">
  <img src="Roundtrip mapping.png" alt="EPLAN data mapped back to VC after roundtrip" width="620"/>
</div>
<div align="center">
  <i>Figure 18: EPLAN domain attributes mapped back onto a VC component before (left) and after (right) roundtrip</i>
</div>
