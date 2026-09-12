#!/usr/bin/env bash

# Re-fetch the pipeline corpus used for empirical mining (Phase 1).
# Pipeline source code is NOT committed to this repository.

set -euo pipefail

cd "$(dirname "$0")/../corpus"

for repo in sarek rnaseq chipseq atacseq methylseq; do
    if [ ! -d "$repo" ]; then
        git clone --depth 1 "https://github.com/nf-core/${repo}.git"
    else
        echo "Skipping ${repo}: already present."
    fi
done

echo
echo "Corpus ready in corpus/"
