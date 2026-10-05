#!/bin/bash
set -e

conda run -n ldsc39 python ldsc/ldsc.py \
  --rg risk_tolerance.sumstats.gz,number_children.sumstats.gz \
  --ref-ld-chr eur_w_ld_chr/ \
  --w-ld-chr eur_w_ld_chr/ \
  --out risk_tolerance_x_number_children

conda run -n ldsc39 python ldsc/ldsc.py \
  --rg risk_tolerance.sumstats.gz,age_first_birth.sumstats.gz \
  --ref-ld-chr eur_w_ld_chr/ \
  --w-ld-chr eur_w_ld_chr/ \
  --out risk_tolerance_x_age_first_birth

echo "Correlación genética calculada (número de hijos):"
cat risk_tolerance_x_number_children.log

echo "Correlación genética calculada (edad al primer hijo):"
cat risk_tolerance_x_age_first_birth.log
