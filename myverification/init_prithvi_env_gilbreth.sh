#run this once to set up the conda environment for Prithvi-WxC fine-tuning and evaluation

export PRITHVIWXC_GIT_FOLDER="$SCRATCH/geoML/Prithvi-WxC"
export PRITHVIWXC_ENV="$SCRATCH/envs/prithviwxc"


#======================================================================
conda create --prefix $SCRATCH/envs/prithviwxc python=3.11 pip -y

cd $PRITHVIWXC_GIT_FOLDER
pip install '.[examples]'
