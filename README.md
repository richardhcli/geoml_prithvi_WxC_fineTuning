

# Verification: 
1) add secrets.env in root with HF_TOKEN in format: 
export HF_TOKEN="TOKEN"
2) run geoML/Prithvi-WxC/myverification/init_prithvi_env_gilbreth.sh 
this prepares conda env on gilbreth
3) cd to /scratch/gilbreth/li5042/geoML/Prithvi-WxC/myverification
- this makes sure slurm output is in right directory. 
3) run /scratch/gilbreth/li5042/geoML/Prithvi-WxC/myverification/validate_prithvi_job.sh
this runs prithvi's validation script in proper environment
- Do this via SBATCH since verification is gpu intensive