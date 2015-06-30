FROM ubuntu:trusty
MAINTAINER Shiqiao Du lucidfrontier.45@gmail.com

RUN apt-get install -y wget
WORKDIR /tmp
RUN wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh 
RUN chmod 777 Miniconda3-latest-Linux-x86_64.sh; ./Miniconda3-latest-Linux-x86_64.sh -b -p /opt/conda3
ENV PATH /opt/conda3/bin:$PATH
RUN rm -rf Miniconda3-latest-Linux-x86_64.sh
RUN conda update -y --all
RUN conda install -y numpy scipy scikit-learn ipython-notebook statsmodels cytoolz matplotlib pandas sqlalchemy psycopg2 pymongo pip
RUN conda install -y requests
RUN yes | pip install -U elasticsearch
VOLUME /notebooks
WORKDIR /notebooks
CMD ipython notebook --ip='*' --no-browser
