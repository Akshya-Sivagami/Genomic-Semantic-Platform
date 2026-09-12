# Biological Error Taxonomy

This taxonomy is derived incrementally from empirical workflow mining.

A category is not considered a confirmed error merely because a suspicious
pattern occurs in source code.

## Category 1 — Implicit Genome-Build Bundling

**Status:** Seeded — observed pattern / candidate invariant

### Description

A workflow configuration can group multiple genome-dependent resources under
a single genome/build key.

Typical resources include:

- reference FASTA
- FASTA index
- sequence dictionary
- dbSNP
- known indels
- known SNPs
- germline resources
- mappability resources
- assay/tool-specific reference resources

The semantic assumption is that these resources all correspond to the same
genome build.

### Initial real example

`nf-core/sarek/conf/igenomes.config`

The GRCh37 configuration contains multiple build-specific resource paths
under the GRCh37 configuration block.

### Why this is potentially important

A workflow-level invariant may be:

> All resources participating in a genome-dependent computation must be
> compatible with the same genome build.

A workflow engine can execute paths without necessarily proving that every
resource belongs to the same biological coordinate system.

### Current evidence state

`OBSERVED`

The configuration structure demonstrates an implicit semantic relationship.

It is **not yet classified as a confirmed error**.

### Required validation

We need to determine whether a user can create an inconsistent combination of
genome-dependent resources through supported configuration/override
mechanisms, and whether the existing workflow detects that inconsistency.

### Candidate semantic rule

A `GenomeBundle` carries a build tag.

Resources associated with the bundle inherit that build unless explicitly
declared otherwise.

An incompatible resource assignment should become a semantic type error before
workflow execution.

## Category 2 — Coordinate-System Mismatch

**Status:** Candidate — mining required

Potential examples include:

- 0-based vs 1-based coordinates
- inclusive vs half-open intervals
- BED/VCF/GTF coordinate conventions
- coordinate transformations between tools

File-format co-occurrence alone is insufficient evidence.

The mining target is an actual transformation or process boundary where a
coordinate-system assumption is introduced, consumed, or converted.

## Category 3 — Assay-Type Mismatch

**Status:** Candidate — mining required

Potential examples include a workflow component assuming an assay-specific
input or interpretation while receiving data from an incompatible assay.

The target is to identify concrete workflow-level assumptions rather than
invent an assay ontology in advance.

## Category 4 — Reference / Index Incompatibility

**Status:** Candidate — mining required

Potential examples include a reference sequence being paired with an index,
dictionary, annotation, or auxiliary resource generated from a different
reference.

The key research question is whether such compatibility relationships are
implicit and therefore invisible to ordinary execution validation.

## Evidence Standard

For every future category, evidence should be recorded as:

`OBSERVED`
→ `CANDIDATE INVARIANT`
→ `CONFIRMED ERROR`
→ `DETECTABLE`

This distinction is essential for avoiding overclaiming from static source-code
patterns.
