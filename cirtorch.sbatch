#!/bin/sh

#SBATCH --qos=long
#SBATCH --partition=general
#SBATCH --time=48:00:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --mem=6144
#SBATCH --mail-type=END
#SBATCH --gres=gpu:1

module use /opt/insy/modulefiles
module load cuda/10.0 cudnn/10.0-7.4.2.24

python3 -m cirtorch.examples.train 'output_w-resnet101' --gpu-id '0' --training-dataset 'retrieval-SfM-120k' --test-datasets 'roxford5k,rparis6k,247tokyo1k' --arch 'w_resnet101' --pool 'gem' --loss 'contrastive' --loss-margin 0.85 --optimizer 'adam' --lr 5e-7 --wd 5e-4 --neg-num 5 --query-size=2000 --pool-size=20000 --batch-size 5 --image-size 362 --mean '0,0,0' --std '1,1,1'
