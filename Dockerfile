# 1) choose base container
# generally use the most recent tag

# data science notebook
# https://hub.docker.com/repository/docker/ucsdets/datascience-notebook/tags
# FROM jupyter/scipy-notebook:d113a601dbb8
FROM ucsdets/scipy-ml-notebook

LABEL maintainer="Anthony Tarbinian <atarbini@ucsd.edu>"

# Install Pytorch from pip
RUN pip3 install --user --no-cache-dir torch==1.10.0+cu113 torchvision==0.11.1+cu113 torchaudio==0.10.0+cu113 -f https://download.pytorch.org/whl/cu113/torch_stable.html

# Install apt packages
USER root
RUN apt-get update
apt-get -y install pipenv 
apt-get -y install vim zsh git


#  Add startup script
# USER root
# COPY /run_jupyter.sh /
# RUN chmod 755 /run_jupyter.sh

# 4) change back to notebook user
USER $NB_UID

# # Override command to disable running jupyter notebook at launch
# # CMD ["/bin/bash"]
