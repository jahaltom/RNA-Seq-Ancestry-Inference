#!/bin/bash

#SBATCH --time=4:00:00   # walltime limit (HH:MM:SS)
#SBATCH -p RM-shared
#SBATCH -c 20

source activate Ancestry

cp 1KGP.pop output/SAMPLE/
cd output/SAMPLE/
plink --vcf ChrAll.SAMPLE.Noise.vcf.gz --make-bed --out 1KGP
/work/LAS/xgu-lab/RIA/dist/admixture_linux-1.3.0/admixture 1KGP.bed 5 --supervised -j4
tail -1 1KGP.5.Q > SAMPLE.prop

python  SAMPLE.py
