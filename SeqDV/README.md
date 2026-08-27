# SeqDV: Scalable Order-Constrained Data Valuation for Sequential Learning

Clean code package extracted from the supplied SeqDV research archive and organized to match the DMKD manuscript.

SeqDV evaluates observation `t` only against subsets of observations available before `t`, estimates the resulting marginal contributions with incremental dynamic trees and Monte Carlo sampling, and uses an amortized neural model to predict values for the full training set. The supplied experiments use Beijing Changping air quality and Seoul bike sharing, with LOO and random baselines, grouped removal diagnostics, and repeated-ranking consistency.

> **Before citing a release:** read [`docs/CODE_AUDIT.md`](docs/CODE_AUDIT.md). The supplied manuscript and executable archive contain several settings that need author verification; this repository flags them rather than silently changing them.

## Repository layout

```text
code/
  01_1_SeqDV.R          main valuation experiment (50 seeds)
  01_2_remove_w.R       Remove-High / Remove-Low experiments
  01_3_count_w.R        distinct deletion counts for overlapping windows
  02_run_all.sh         three-stage runner
  utils.R               SeqDV estimator, dynaTree utilities, NN, baselines
analysis/
  evaluate.py           portable Kendall-W / removal-summary helper
data/processed/
  changping1.csv
  seoulbike4.csv
notebooks/
  preprocessing_extracted.ipynb
environment/
  environment_r.yaml
  environment_python.yaml
docs/
  CODE_AUDIT.md
```

## Main manuscript-aligned settings found in the archive

- split ratio: `4:2:2` with an initial `born_in = 10` block;
- resulting valuation-training sizes: 695 (Changping) and 495 (Seoul);
- 50 repeated seeds;
- SeqDV Monte Carlo stopping threshold: `0.2`;
- 80% of training observations explicitly valued for amortization targets;
- grouped deletion windows: `g = 1, 3, 5, 7`;
- deletion curve step in code: 1 percentage point; manuscript summaries use 10%, 20%, 30%, 40%.

## Setup

The supplied Conda exports are retained under `environment/` with machine-specific `prefix:` entries removed.

```bash
conda env create -f environment/environment_r.yaml
conda env create -f environment/environment_python.yaml
```

The R code uses `dynaTree`, `keras`, `tensorflow`, `foreach`, `doParallel`, `glue`, and `yardstick`.

## Run the valuation and deletion experiments

The R scripts use paths relative to the `code/` directory. The processed datasets are stored one level above, so either symlink them or copy them before running:

```bash
cd code
ln -s ../data/processed real_data   # Linux/macOS; or copy the folder on other systems
bash 02_run_all.sh -r 4,2,2 changping1 seoulbike4
```

The default valuation output directory is `./born10_422`. Override it without editing source:

```bash
SEQDV_OUTPUT_DIR=./my_results bash 02_run_all.sh changping1
```

Optional GPU selection is controlled with `SEQDV_CUDA_VISIBLE_DEVICES`; if unset, the code does not force a device.

## Evaluate repeated rankings

After valuation files have been generated:

```bash
cd analysis
python evaluate.py kendall-w --results-dir ../code/born10_422 --dataset changping1 --method seq --runs 50
python evaluate.py kendall-w --results-dir ../code/born10_422 --dataset seoulbike4 --method LOO --runs 50
```

To extract manuscript removal points from an R removal CSV:

```bash
python evaluate.py removal ../code/metric_w/changping1_seq_0.01_remove_high_w3.csv
```

## Preprocessing provenance

`notebooks/preprocessing_extracted.ipynb` contains only the main-dataset preprocessing cells extracted from the supplied large analysis notebook, with absolute server paths replaced by relative placeholders. Raw datasets are not redistributed here. The included processed CSVs are the versions found in the supplied archive.

## Scope

This package deliberately excludes duplicate historical scripts, sensitivity-analysis variants, generated plots, logs, and thousands of intermediate CSV/TXT files. It is intended as the compact manuscript-facing code base, not a byte-for-byte mirror of the working directory.
