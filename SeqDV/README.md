# SeqDV: Scalable Order-Constrained Data Valuation for Sequential Learning

Manuscript-facing code extracted from the supplied SeqDV research archive and organized against the DMKD draft.

SeqDV evaluates observation `t` only against chronologically admissible predecessor contexts, uses incremental dynamic trees and Monte Carlo estimation, and applies amortized prediction to obtain values for the full training set.

> **Important:** read [`docs/CODE_AUDIT.md`](docs/CODE_AUDIT.md) before a journal release. Several manuscript/code settings require author verification; they are flagged rather than silently changed.

## Uploaded core code

```text
SeqDV/
├── README.md
├── code/
│   ├── 01_1_SeqDV.R          # main valuation experiment, 50 seeds
│   ├── 01_2_remove_w.R       # Remove-High / Remove-Low, g=1,3,5,7
│   ├── 01_3_count_w.R        # distinct deletion counts
│   ├── utils.R               # loader
│   ├── utils_core.R          # SeqDV, dynaTree, Welford, amortization, LOO/random
│   └── utils_evaluation.R    # grouped-removal and counting utilities
├── analysis/
│   └── evaluate.py           # Kendall's W / removal summary helper
└── docs/
    └── CODE_AUDIT.md         # manuscript-code consistency audit
```

## Main settings found in the supplied archive

- default split ratio: `4:2:2`, with `born_in = 10`;
- 50 repeated seeds;
- Monte Carlo stopping threshold: `0.2`;
- 80% of training points explicitly valued for amortization targets;
- grouped-removal windows: `g = 1, 3, 5, 7`;
- deletion step in the executable code: 1 percentage point; manuscript summaries use 10%, 20%, 30%, 40%.

## Run

Place the processed CSV files in `code/real_data/`, then from `code/` run:

```bash
Rscript 01_1_SeqDV.R --ratio 4,2,2 changping1 seoulbike4
Rscript 01_2_remove_w.R --ratio 4,2,2 changping1 seoulbike4
Rscript 01_3_count_w.R --ratio 4,2,2 changping1 seoulbike4
```

The default valuation output directory is `./born10_422`. It can be overridden with:

```bash
SEQDV_OUTPUT_DIR=./my_results Rscript 01_1_SeqDV.R changping1
```

Optional GPU selection is controlled by `SEQDV_CUDA_VISIBLE_DEVICES`; if unset, no fixed GPU device is forced.

## Scope

The public branch intentionally focuses on the paper-related source code. A separately prepared clean package also contains the two processed datasets, environment exports, and the extracted preprocessing notebook. The large collection of historical logs, duplicate scripts, figures, and sensitivity-analysis intermediates from the original RAR is not part of the manuscript-facing branch.
