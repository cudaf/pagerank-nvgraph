#!/usr/bin/env bash

# Download nvGraph
cd ~
git clone https://github.com/rapidsai/nvgraph
cd ~/nvgraph
git submodule update --init --recursive

# Install nvGraph
export CUDA_ROOT="/usr/local/cuda" && ./build.sh


# Build and Install the C/C++ CUDA components
mkdir -p ~/nvgraph/cpp/build
cd ~/nvgraph/cpp/build
cmake .. -DCMAKE_INSTALL_PREFIX=$CONDA_PREFIX
make -j && make install


# C++ stand alone tests
cd ~/nvgraph/cpp/build
gtests/NVGRAPH_TEST
