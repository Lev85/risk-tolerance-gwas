#!/bin/bash
set -e

kaggle datasets download -d pavlllamocca/risk-tolerance-gwas-ukb-replication-full-2019 --unzip
kaggle datasets download -d pavlllamocca/number-children-gwas-pooled-2016 --unzip

echo "Descarga completa de ambos datasets."
