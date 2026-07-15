mkdir -p tmp home && \
apptainer shell --containall -B ./tmp:/tmp -B ./home:/home/${USER} ubuntu-latest.sif && \ 
rm -rf tmp home 
