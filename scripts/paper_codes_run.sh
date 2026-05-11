#!/bin/bash

# Load environment and activate conda
module load miniconda
source $(conda info --base)/etc/profile.d/conda.sh
conda activate dde

# Define the experiment names
eqns=("advection" "burgers" "traffic")

# Navigate to the project directory
cd /home/tp526/neuraloperator/PI-FNO-reproduce || { echo "Directory not found"; exit 1; }

# Outer loop: Iterate through each equation type
for eqn in "${eqns[@]}"
do
    echo "================================================"
    echo "Processing all configs for: ${eqn}"
    echo "================================================"
    
    # Inner loop: Find every yaml file starting with the equation name
    # The path expansion happens here: configs/pretrain/Paper-codes/advection_*.yaml
    for CONFIG in configs/pretrain/Paper-codes/"${eqn}"-*.yaml
    do
        # Check if any files actually matched the pattern
        [ -e "$CONFIG" ] || continue
        
        echo "------------------------------------------------"
        echo "Running: $CONFIG"
        echo "------------------------------------------------"
        
        # Run the training script for this specific config
        python3 "train_${eqn}.py" --config_path "$CONFIG" --mode train
        
        echo "Finished: $CONFIG"
    done
done

echo "All experiments and sub-configs completed!"