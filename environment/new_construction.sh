#!/bin/bash

ENVNAME=$1
CUDA_VERSION=$2

cd 

# First, install conda
wget -c https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh

chmod 777 Miniconda3-latest-Linux-x86_64.sh #给执行权限
bash Miniconda3-latest-Linux-x86_64.sh #运行

rm Miniconda3-latest-Linux-x86_64.sh

# Then create an enviroment, now only 3.7 is compatible with torch
conda create -n $ENVNAME python==3.7

echo "conda activate $ENVNAME" >> '~/.bashrc'
conda actiate $ENVNAME

# Then install necessay ML packages
conda install pytorch torchvision torchaudio cudatoolkit=$CUDA_VERSION -c pytorch
conda install spacy
pip install sklearn

