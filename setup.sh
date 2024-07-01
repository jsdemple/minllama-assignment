#!/usr/bin/env bash

conda create -n llama_hw python=3.11
conda activate llama_hw

# Modify this command depending on your system's environment.
# As written, this command assumes you have CUDA on your machine, but
# refer to https://pytorch.org/get-started/previous-versions/ for the correct
# command for your system.
OS_NAME=$(uname)
if [[ "$OS_NAME" == "Darwin" ]]; then
    echo "Installing pytorch on OSX"
    conda install pytorch==2.3.0 torchvision==0.18.0 torchaudio==2.3.0 -c pytorch
elif [[ "$OS_NAME" == "Linux" ]]; then
    echo "Installing pytorch on Linux"
    conda install pytorch==2.1.2 torchvision==0.16.2 torchaudio==2.1.2 pytorch-cuda=11.8 -c pytorch -c nvidia
else
    echo "Unsupported OS: $OS_NAME" >&2
    exit 1
fi

# Install rest of dependencies
pip install tqdm==4.66.1
pip install requests==2.31.0
pip install importlib-metadata==3.7.0
pip install filelock==3.0.12
pip install scikit-learn==1.2.2
pip install numpy==1.26.3
pip install tokenizers==0.13.3
pip install sentencepiece==0.1.99
wget https://www.cs.cmu.edu/~vijayv/stories42M.pt