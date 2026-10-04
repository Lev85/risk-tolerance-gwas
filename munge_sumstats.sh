#!/bin/bash
set -e

# Limpia (munge) el archivo de tolerancia al riesgo (UKB + replicación, sin 23andMe)
# N = 431,126 (UKB) + 35,445 (replicación) = 466,571
conda run -n ldsc39 python ldsc/munge_sumstats.py \
  --sumstats /content/RISK_GWAS_MA_UKBreplication.txt \
  --snp MarkerName --a1 A1 --a2 A2 --p Pval \
  --signed-sumstats Beta,0 \
  --N 466571 \
  --merge-alleles w_hm3.snplist \
  --out risk_tolerance

# Limpia (munge) el archivo de número de hijos (Barban et al. 2016)
# N = 343,072
conda run -n ldsc39 python ldsc/munge_sumstats.py \
  --sumstats /content/NumberChildrenEverBorn_Pooled.txt \
  --snp SNPID --a1 A1 --a2 A2 --p Pvalue \
  --signed-sumstats Zscore,0 \
  --N 343072 \
  --merge-alleles w_hm3.snplist \
  --out number_children

echo "Munge completo para ambos archivos."
