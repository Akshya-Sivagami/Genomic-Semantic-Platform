# Genomic Semantic Platform

A semantic programming model and intermediate representation for genomic
computation, making biological validity (genome build, coordinate system,
assay type) a first-class, checkable property of workflows instead of an
implicit assumption buried in pipeline code.

Full architecture and phased roadmap: see `docs/`.
Empirical grounding (Phase 1) is in progress in `corpus/` and `taxonomy/`.

## Status

- [x] Repo skeleton
- [x] Related-work positioning (extends SWIRL / dhtslib / Seq — see `docs/related-work.md`)
- [ ] Phase 1: empirical corpus mining (in progress — see `corpus/MINING_LOG.md`)
- [ ] Phase 2: type system + GIR design
- [ ] Phase 3: compiler
- [ ] Phase 4: evaluation + writeup
- [ ] Phase 5 (post-paper): Visual Semantic Studio

## Layout

docs/         vision, related work, roadmap
corpus/       cloned public pipelines used for empirical mining (gitignored contents)
taxonomy/     error taxonomy derived from the corpus, with real examples
typesystem/   biological type system design + typing rules (Phase 2)
gir/          Genomic Intermediate Representation spec + implementation (Phase 2/3)
compiler/     semantic compiler, Nextflow + Snakemake backends (Phase 3)
scripts/      mining and evaluation scripts
tests/        test suite
