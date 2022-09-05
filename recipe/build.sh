#!/bin/bash

set -ex

./configure --prefix=${PREFIX}

make


if [[ "${target_platform}" == osx-* ]]; then
    # I feel like the build scripts need to be regenerated
    # to get the correct install executable
    # https://github.com/conda-forge/bisonpp-feedstock/issues/5#issuecomment-1237391820
    rm ./install
    ln -s $(which install) ./install
fi

make install  || (cat Makefile && exit 1)
