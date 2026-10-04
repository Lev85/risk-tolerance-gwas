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
# Nota: los enlaces originales de data.broadinstitute.org ya no funcionan
# (devuelven 404 tras redirigir); se usa el mirror en Zenodo en su lugar.
# Sin -q, para que un fallo de descarga se vea en el log en vez de morir en silencio.
wget https://zenodo.org/records/8182036/files/eur_w_ld_chr.tar.gz?download=1 -O eur_w_ld_chr.tar.gz
tar -xzf eur_w_ld_chr.tar.gz

# Descarga la lista de SNPs de HapMap3 (usada por munge_sumstats.py)
wget https://zenodo.org/records/7773502/files/w_hm3.snplist.gz?download=1 -O w_hm3.snplist.gz
gunzip w_hm3.snplist.gz

echo "Instalación de ldsc completa."
