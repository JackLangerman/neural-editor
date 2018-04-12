#!/bin/bash

#SBATCH --job-name=jupyterGPU
#SBATCH --nodes=1
#SBATCH --cpus-per-task=2
#SBATCH --mem=16GB
#SBATCH --time=3:00:00
#SBATCH --gres=gpu:1

############## MODIFY THIS TO FIT YOUR NEEDS ####################

## HOME should be the path to the parent folder of neural-editor
## IT WON'T WORK IF YOU DON'T SET THIS
## Maybe this should default to /scratch/$USER instead?

HOME=/scratch/$USER/neural-editor-slurm


##  If you are on Prince you should use the shared location, if you are on a 
##  differant cluster you need to download the image from https://goo.gl/bkF3cU or 
##  create it yourself and set the TEXTMORPH_IMG variable accordingly

SINGULARITY_PATH=/share/apps/singularity/2.4.4/bin/singularity     ## shared location on Prince
TEXTMORPH_IMG=/beegfs/work/public/singularity/textmorph-1.2.img    ## shared location


## SINGULARITY_PATH=/YOUR/PATH/singularity/2.4.4/bin/singularity   ## local path to Singularity
## TEXTMORPH_IMG=$HOME/neural-editor/textmorph-1.2.img             ## local image

############## ############################# ####################
## if the above is correct you shouldn't need to change anything below here 

###############################################################


port=$(shuf -i 6000-9999 -n 1)

/usr/bin/ssh -N -f -R $port:localhost:$port log-0
/usr/bin/ssh -N -f -R $port:localhost:$port log-1

cat<<EOF

Jupyter server is running on: $(hostname)
Job starts at: $(date)

Step 1 :

If you are working in NYU campus, please open an iTerm window, run command

ssh -L $port:localhost:$port $USER@prince.hpc.nyu.edu

If you are working off campus, you should already have ssh tunneling setup through HPC bastion host, 
that you can directly login to prince with command

ssh $USER@prince

Please open an iTerm window, run command

ssh -L $port:localhost:$port $USER@prince

Step 2:

Keep the iTerm windows in the previouse step open. Now open browser, find the line with

The Jupyter Notebook is running at: $(hostname)

the URL is something: http://localhost:${port}/?token=XXXXXXXX (see your token below)

you should be able to connect to jupyter notebook running remotly on prince compute node with above url

EOF

unset XDG_RUNTIME_DIR
if [ "$SLURM_JOBTMP" != "" ]; then
    export XDG_RUNTIME_DIR=$SLURM_JOBTMP
fi

export XDG_RUNTIME_DIR=""




DATA_DIR=$HOME/neural-editor/data
REPO_DIR=$HOME/neural-editor
export TEXTMORPH_DATA=$DATA_DIR

export PYTHONPATH=.:$REPO_DIR:$PYTHONPATH


$SINGULARITY_PATH exec --nv $TEXTMORPH_IMG jupyter notebook --no-browser --port $port

