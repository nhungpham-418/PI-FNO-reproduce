#!/bin/bash
#SBATCH --job-name=burgers2d-64-mode-8-data-1-pde-0.
#SBATCH --output=logs/burgers2d-64-mode-8-data-1-pde-0.txt
#SBATCH --cpus-per-task=1
#SBATCH --mem-per-cpu=32G
#SBATCH --partition=gpu_h200
#SBATCH --gpus=h200:1
#SBATCH --time=2:00:00

module load miniconda
conda activate dde

cd /home/tp526/neuraloperator/PI-FNO-reproduce

python3 train_burgers2d.py --config_path configs/pretrain/burgers2d_inviscid_pretrain_data.yaml

