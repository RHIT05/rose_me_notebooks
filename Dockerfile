FROM jupyter/scipy-notebook:latest

USER root
RUN apt-get update && \
 apt-get install --yes gfortran ninja-build libblas-dev libopenblas64-dev libopenblas-dev

# Install from requirements.txt file
COPY requirements.txt /tmp/

USER $NB_USER
RUN pip install --requirement /tmp/requirements.txt && \
    fix-permissions $CONDA_DIR && \ 
    fix-permissions /home/$NB_USER
