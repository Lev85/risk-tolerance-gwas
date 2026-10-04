#!/bin/bash
set -e

# Clona el sucesor oficial en Python 3 de LDSC (CBIIT/ldsc)
git clone -b ldsc39 https://github.com/CBIIT/ldsc.git

# Crea un entorno conda dedicado con Python 3.9
# Nota: no se usa requirements.txt porque fija versiones de 2017
# (pandas 0.20.3, numpy 1.16.6) que ya no se pueden compilar con
# pip/setuptools actuales. Se instalan versiones modernas en su lugar.
conda create -y --name ldsc39 python=3.9
conda run -n ldsc39 pip install numpy pandas scipy bitarray

# Descarga los LD scores de referencia (población europea, 1000 Genomes)
wget -q https://data.broadinstitute.org/alkesgroup/LDSCORE/eur_w_ld_chr.tar.bz2
tar -jxf eur_w_ld_chr.tar.bz2

# Descarga la lista de SNPs de HapMap3 (usada por munge_sumstats.py)
wget -q https://data.broadinstitute.org/alkesgroup/LDSCORE/w_hm3.snplist.bz2
bunzip2 w_hm3.snplist.bz2

echo "Instalación de ldsc completa."
