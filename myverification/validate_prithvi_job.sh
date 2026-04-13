#!/bin/bash
#SBATCH --account yunglu
#SBATCH --partition=a100-80gb
#SBATCH --qos=normal
#SBATCH --nodes=1
#SBATCH --ntasks=1 --cpus-per-task=8
#SBATCH --nodes=1 --gpus-per-node=1
#SBATCH --time=00:30:00
#SBATCH --mem=128G 
#SBATCH --job-name=prithvi_val

#if mem is too small, process will get 
#[2026-03-28T14:27:13.072] error: Detected 1 oom_kill event in StepId=10483536.batch. Some of the step tasks have been OOM Killed.

export PRITHVIWXC_GIT_FOLDER="$SCRATCH/geoML/Prithvi-WxC"
export THIS_SCRIPT_DIR=$PRITHVIWXC_GIT_FOLDER/myverification
export VALIDATION_OUTPUT_OUT="$THIS_SCRIPT_DIR/myoutput/validation_output.out"
export VALIDATION_OUTPUT_ERR="$THIS_SCRIPT_DIR/myoutput/validation_output.err"

#======================================================================
export PRITHVIWXC_ENV="$SCRATCH/envs/prithviwxc"

#pipe all output to a log file for debugging
exec > >(tee -a $VALIDATION_OUTPUT_OUT)
exec 2> >(tee -a $VALIDATION_OUTPUT_ERR >&2)

echo "[$(date '+%Y-%m-%d %H:%M:%S')] Starting Prithvi-WxC validation job..." | tee -a $VALIDATION_OUTPUT_OUT

module load conda
conda activate $PRITHVIWXC_ENV

cd $PRITHVIWXC_GIT_FOLDER

# Optional but highly recommended: Set your Hugging Face token 
# to avoid rate limits downloading model weights on a shared HPC IP.
source secrets.env

#verify myoutput folder exists, make if not
mkdir -p $THIS_SCRIPT_DIR/myoutput

echo "[$(date '+%Y-%m-%d %H:%M:%S')] Running validation script..." | tee -a $VALIDATION_OUTPUT_OUT

python -m validation.validate_prithvi_wxc -c validation/config.yaml > $VALIDATION_OUTPUT_OUT 2> $VALIDATION_OUTPUT_ERR