# Code audit against the supplied DMKD manuscript

This repository was distilled from the supplied `SeqDV.rar` and checked against `SeqDV_DMKD(1).pdf`. It excludes thousands of logs, sensitivity-analysis intermediates, duplicate historical scripts, and generated figures.

## Directly matched components
- `code/01_1_SeqDV.R`: 50 seeds; SeqDV, amortized NN, random, sampled-random, sequential LOO and non-sequential LOO.
- `code/utils_core.R`: chronological subset sampling, incremental dynaTree updates, Welford stopping, amortization MLP and baselines.
- `code/01_2_remove_w.R` and `code/utils_evaluation.R`: Remove-High/Remove-Low with group sizes 1, 3, 5, 7.
- `code/01_3_count_w.R`: actual distinct deletion counts when local windows overlap.
- `analysis/evaluate.py`: portable Kendall's W and removal-point extraction.

## Items requiring author verification before a journal release
1. **Dynamic-tree particle count:** manuscript states `Ntree = 0.05N`, but supplied `real_stability()` uses `N <- round(0.1 * n)` for SeqDV. LOO uses `0.05 * n`. The public extraction preserves the supplied SeqDV setting and flags the mismatch.
2. **Changping forecast horizon:** manuscript describes four-hour-ahead PM2.5. The supplied preprocessing notebook contains a `w = 4` candidate, but the cell immediately preceding export of `changping1.csv` uses `w = 1`.
3. **Amortization architecture wording:** `stability_nn()` sets `n_layers <- 2`, `n_nodes <- 128`; the corresponding helper branch constructs three 128-unit dense hidden layers before the output layer. This should be reconciled with manuscript wording of two hidden layers.
4. **Missing original `evaluation.py`:** the archived `03_kendalls_tau.py` and `04_heat_map.py` import `evaluation as ev`, but no standalone `evaluation.py` was present. The public `analysis/evaluate.py` is therefore a documented portability layer, not claimed to be an original archived file.
5. **Portability:** machine-specific `/DATA2/...` paths, Conda prefixes and a fixed CUDA device should not appear in the final journal repository.

## Recommended pre-submission verification
- Resolve items 1-3 and rerun both main datasets from a clean environment.
- Record exact package versions and seeds.
- Add stable source citations/licenses for the public raw datasets.
- If the manuscript adds modern data-valuation baselines, add their executable implementations to the repository as well.
