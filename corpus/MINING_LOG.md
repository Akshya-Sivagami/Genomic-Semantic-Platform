# Corpus Mining Log

## Corpus

The empirical corpus consists of public genomic workflows selected to cover
different assay and analysis patterns.

Initial target corpus:

- nf-core/sarek — variant calling
- nf-core/rnaseq — RNA sequencing
- nf-core/chipseq — ChIP sequencing
- nf-core/atacseq — ATAC sequencing
- nf-core/methylseq — methylation sequencing

The pipelines are cloned shallowly for reproducible empirical mining.
Pipeline source code is not committed to this repository.

## Evidence lifecycle

Mining findings are classified using the following progression:

1. `OBSERVED` — a recurring semantic pattern exists in workflow code.
2. `CANDIDATE INVARIANT` — the pattern suggests a biological consistency rule.
3. `CONFIRMED ERROR` — a concrete inconsistent configuration or historical bug
   demonstrates that the invariant can be violated.
4. `DETECTABLE` — the proposed semantic system can detect the violation before
   or independently of workflow execution.

A recurring pattern must not automatically be described as a confirmed
biological error.

## Pass 1 — genome build reference scan

Initial scan:

grep -riIl -E "GRCh3[78]|hg19|hg38|mm10|mm39" \
  --include="*.config" --include="*.nf" .

Initial finding:

- genome-build references occur across the target workflows.
- Sarek contains build-specific resource bundles under genome configuration.

A first candidate finding was identified in:

nf-core/sarek/conf/igenomes.config

The GRCh37 configuration groups numerous resources, including reference FASTA,
FASTA index/dictionary, dbSNP, known indels, known SNPs, germline resources,
mappability resources, and ASCAT-related resources.

Current status:

`OBSERVED` / `CANDIDATE INVARIANT`

This finding must be experimentally validated before being described as a
confirmed error.

## Pass 2 — genome parameter scan

Initial scan:

grep -riIl -E "params\.genome\b" \
  --include="*.config" --include="*.nf" .

The scan identified genome parameter usage across multiple pipelines.

## Pass 3 — coordinate-related file scan

Initial coarse scan:

grep -riIl -E "\.(bed|gtf|gff3?|vcf)\b" \
  --include="*.nf" .

This identifies workflows containing coordinate-bearing genomic file formats,
but co-occurrence alone is not evidence of a coordinate-system mismatch.

Next step is to inspect actual transformations and process boundaries.

## Not yet completed

- experimental validation of the Sarek genome-bundle finding
- coordinate-system transformation mining
- assay-type assumption mining
- reference/index compatibility mining
- GitHub issue mining for historical user-reported errors
- machine-readable evidence records
- cross-pipeline evidence matrix
