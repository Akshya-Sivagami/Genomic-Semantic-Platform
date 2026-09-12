# Related Work and Positioning

This document records the current positioning of the Genomic Semantic Platform
against closely related systems. The purpose is to make the novelty boundary
explicit before implementation.

## 1. SWIRL

SWIRL provides a formal intermediate representation and execution semantics
for scientific workflows.

### Existing capability

SWIRL focuses on workflow representation and execution semantics.

### GSP distinction

The Genomic Semantic Platform investigates biological validity as a first-class
semantic layer over workflow computation.

The intended contribution is not to replace a workflow IR. Instead, GSP
investigates whether biological semantic types can be empirically derived from
real genomic workflow corpora and propagated through a workflow-level IR.

## 2. dhtslib / Typesafe Coordinate Systems

Typesafe coordinate-system work demonstrates that genomic coordinate systems
can be represented and checked at the library/API level.

### Existing capability

Coordinate assumptions can be made explicit for individual operations and
library calls.

### GSP distinction

GSP investigates propagation of biological semantics across an entire
workflow DAG, including interactions between processes, resources, file
formats, references, assays, and configuration.

The research question is therefore broader than checking a coordinate value
at one library call.

## 3. Seq

Seq is a bioinformatics-oriented programming language with genomics-aware
language abstractions and types.

### Existing capability

Seq provides biological abstractions and genomics-aware programming
constructs.

### GSP distinction

The proposed GSP semantic algebra is intended to be empirically grounded in
real genomic workflow corpora rather than being entirely hand-designed.

The research therefore starts with corpus mining and evidence collection
before committing to a final semantic type system.

## Research Position

The central research claim is intentionally narrower than "a new programming
language for genomics."

The project investigates whether recurring biological assumptions in existing
genomic workflows can be empirically extracted into a small semantic algebra
and then used to provide workflow-level validation independent of the
underlying workflow engine.

The empirical corpus is therefore a foundational part of the contribution,
not merely an implementation dataset.
