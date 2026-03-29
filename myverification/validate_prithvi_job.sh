#!/bin/bash
#SBATCH --account yunglu
#SBATCH --partition=a100-80gb
#SBATCH --qos=standby
#SBATCH --nodes=1
#SBATCH --ntasks=1 --cpus-per-task=8
#SBATCH --nodes=1 --gpus-per-node=1
#SBATCH --time=00:20:00
#SBATCH --mem=128G 
#SBATCH --job-name=prithvi_val

#if mem is too small, process will get 
#[2026-03-28T14:27:13.072] error: Detected 1 oom_kill event in StepId=10483536.batch. Some of the step tasks have been OOM Killed.


module load conda
conda activate /home/li5042/prithviwxc

cd /scratch/gilbreth/li5042/geoML/Prithvi-WxC

# Optional but highly recommended: Set your Hugging Face token 
# to avoid rate limits downloading model weights on a shared HPC IP.
source secrets.env

python -m validation.validate_prithvi_wxc -c validation/config.yaml