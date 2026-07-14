#!/bin/bash

# first build the container:
# apptainer build ubuntu-latest.sif ubuntu-latest.def

mkdir -p tmp home && \ # create the rw mountpoints 
apptainer shell --containall -B ./tmp:/tmp -B ./home:/home/${USER} ubuntu-latest.sif && \ 
rm -rf tmp home # cleanup
