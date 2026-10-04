#!/bin/bash
set -e

conda run -n ldsc39 python ldsc/ldsc.py \
  --rg risk_tolerance.sumstats.gz,number_children.sumstats.gz \
  --ref-ld-chr eur_w_ld_chr/ \
  --w-ld-chr eur_w_ld_chr/ \
  --out risk_tolerance_x_number_children

echo "Correlación genética calculada."
cat risk_tolerance_x_number_children.log
