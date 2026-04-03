#!/bin/bash

# Load environment and activate conda
module load miniconda
source $(conda info --base)/etc/profile.d/conda.sh
conda activate dde

# Define the point configurations to iterate through
points=(1000 800 500 200 100)

# Navigate to the project directory
cd /home/tp526/neuraloperator/PI-FNO-reproduce

# Loop through each point value
for p in "${points[@]}"
do
    echo "------------------------------------------------"
    echo "Starting training with ${p} points..."
    echo "------------------------------------------------"
    
    # Construct the path and run the command
    CONFIG="configs/pretrain/burgers_${p}_points_pretrain.yaml"
    
    python3 train_burgers_mask.py --config_path "$CONFIG" --mode train
    
    echo "Finished training for ${p} points."
done

echo "All experiments completed!"