
# Modified Neural editor to run on SLURM clusters (such as NYU HPC's Prince Cluster)
How to run on slurm cluster
  1) first make sure to set the `HOME` variable in both `setup_datadir.sh` and `train_slurm.s`.  
  2) to get the data run `./setup_datadir.sh`  
  3) to submit a batch job for training run `sbatch train_slurm.s`   (you can change the config in this file)  

How to use Jupyter Notebook to examine your trained model  
  1) edit `run-jupyterGPU.sbatch` to reflect your path
  1) run `sbatch run-jupyterGPU.sbatch`


# below from original github
[https://github.com/kelvinguu/neural-editor](https://github.com/kelvinguu/neural-editor)

# Neural editor

Source code accompanying our paper [Generating Sentences by Editing Prototypes](https://arxiv.org/abs/1709.08878).

**Authors:** Kelvin Guu\*, Tatsunori B. Hashimoto\*, Yonatan Oren, Percy Liang
(\* equal contribution)

- We are drafting a more detailed README in the
  [README](https://github.com/kelvinguu/neural-editor/tree/readme) branch (see here for dataset links)
- This is research code meant to serve as a reference implementation. We do not
  recommend heavily extending or modifying this codebase for other purposes.

If you have questions, please email Kelvin at `guu.kelvin` at `gmail.com`.
