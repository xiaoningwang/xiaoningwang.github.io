#!/usr/bin/env python3
"""Portable evaluation helpers for SeqDV outputs.

Reconstructed from the supplied experiment outputs because the original analysis
scripts import an `evaluation.py` module that was not present in the archive.
"""
from __future__ import annotations
import argparse
from pathlib import Path
import numpy as np
import pandas as pd
from scipy.stats import rankdata

METHOD_COLUMNS = {"seq": "nn_sv", "LOO": "LOO", "random_sample": "random", "random": "random"}

def kendalls_w(rank_matrix: np.ndarray) -> float:
    ranks=np.asarray(rank_matrix,dtype=float)
    if ranks.ndim != 2 or ranks.shape[0] < 2 or ranks.shape[1] < 2:
        raise ValueError("rank_matrix must be 2-D with at least 2 runs and 2 items")
    m,n=ranks.shape
    R=ranks.sum(axis=0); S=((R-R.mean())**2).sum(); T=0.0
    for row in ranks:
        _,counts=np.unique(row,return_counts=True); T += np.sum(counts**3-counts)
    denom=m*m*(n**3-n)-m*T
    return float(12*S/denom) if denom>0 else float('nan')

def repeated_kendall_w(results_dir: Path, dataset: str, method: str, runs: int=50) -> float:
    col=METHOD_COLUMNS[method]; all_ranks=[]
    for seed in range(1,runs+1):
        p=results_dir/f"{dataset}_{method}_{seed}.txt"
        vals=pd.read_csv(p)[col].to_numpy(dtype=float)
        all_ranks.append(rankdata(-vals,method='average'))
    n=min(map(len,all_ranks))
    return kendalls_w(np.vstack([r[:n] for r in all_ranks]))

def removal_points(csv_path: Path, percentages=(10,20,30,40), step_percent=1):
    df=pd.read_csv(csv_path); rows=[]
    for pct in percentages:
        idx=int(round(pct/step_percent)); row=df.iloc[idx]
        rows.append({"percent":pct,"accuracy":float(row['mean_01']),"std":float(row.get('std_01',np.nan))})
    return pd.DataFrame(rows)

def main():
    ap=argparse.ArgumentParser(); sub=ap.add_subparsers(dest='cmd',required=True)
    k=sub.add_parser('kendall-w'); k.add_argument('--results-dir',default='../born10_422'); k.add_argument('--dataset',required=True); k.add_argument('--method',choices=sorted(METHOD_COLUMNS),required=True); k.add_argument('--runs',type=int,default=50)
    r=sub.add_parser('removal'); r.add_argument('csv'); args=ap.parse_args()
    if args.cmd=='kendall-w': print(repeated_kendall_w(Path(args.results_dir),args.dataset,args.method,args.runs))
    else: print(removal_points(Path(args.csv)).to_csv(index=False),end='')
if __name__=='__main__': main()
