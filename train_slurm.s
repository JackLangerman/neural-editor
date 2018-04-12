#!/bin/bash

#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=4
#SBATCH --time=5:00:00
#SBATCH --mem=32GB
#SBATCH --job-name=neural-editor-train
#SBATCH --mail-type=END
#SBATCH --mail-user=$USER@nyu.edu   ## your email
#SBATCH --output=slurm_train.out
#SBATCH --gres=gpu:1


############## MODIFY THIS TO FIT YOUR NEEDS ####################

## HOME should be the path to the parent folder of neural-editor
## IT WON'T WORK IF YOU DON'T SET THIS
## Maybe this should default to /scratch/$USER instead?

HOME=/scratch/$USER/neural-editor-slurm


## CONFIG should be the name of a config file in the configs folder

## CONFIG=edit_logp.txt   # yelp
CONFIG=edit_onebil.txt    # billion


##  If you are on Prince you should use the shared location, if you are on a 
##  differant cluster you need to download the image from https://goo.gl/bkF3cU or 
##  create it yourself and set the TEXTMORPH_IMG variable accordingly

SINGULARITY_PATH=/share/apps/singularity/2.4.4/bin/singularity     ## shared location on Prince
TEXTMORPH_IMG=/beegfs/work/public/singularity/textmorph-1.2.img    ## shared location


## SINGULARITY_PATH=/YOUR/PATH/singularity/2.4.4/bin/singularity   ## local path to Singularity
## TEXTMORPH_IMG=$HOME/neural-editor/textmorph-1.2.img             ## local image

############## ############################# ####################
## if the above is correct you shouldn't need to change anything below here 


DATA_DIR=$HOME/neural-editor/data
REPO_DIR=$HOME/neural-editor
export TEXTMORPH_DATA=$DATA_DIR

export PYTHONPATH=.:$REPO_DIR:$PYTHONPATH


$SINGULARITY_PATH exec --nv $TEXTMORPH_IMG python $REPO_DIR/textmorph/edit_model/main.py $REPO_DIR/configs/edit_model/$CONFIG
