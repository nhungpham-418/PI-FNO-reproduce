#!/bin/bash
#SBATCH --job-name=burgers2d-64-mode-8-8-data-1-pde-0001-jack.
#SBATCH --output=logs/burgers2d-64-mode-8-8-data-1-pde-0001-jack.txt
#SBATCH --cpus-per-task=1
#SBATCH --mem-per-cpu=32G
#SBATCH --partition=gpu_h200
#SBATCH --gpus=h200:1
#SBATCH --time=2:00:00

module load miniconda
conda activate fno

cd /home/jw3275/PI-FNO-reproduce

python3 train_burgers2d.py --config_path configs/pretrain/burgers2d_inviscid_pretrain_physics_2-data-1-pde-0001-jack.yaml
