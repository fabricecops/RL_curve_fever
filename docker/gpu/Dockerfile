FROM nvidia/cuda:9.0-cudnn7-runtime-ubuntu16.04

ARG https_proxy
ARG http_proxy

#------------------------
# General setup
#------------------------
RUN apt-get update \
    && apt-get install -y lsb-release \
    wget


# #------------------------
# # Install python dependecies
# #------------------------

RUN apt-get update && apt-get install -q -y \
    python3-pip \
    python3-dev \
    build-essential \
	libgtk2.0-dev \
	nano \
	git \
	golang \
	libjpeg-turbo8-dev

RUN pip3 install --upgrade pip


# #--------------------------
# Set the working directory to /app
# #--------------------------
WORKDIR /app

# #--------------------------
# #Copy framework
# #--------------------------
ADD . .

# #--------------------------
# # Install remote packages
# #--------------------------
RUN pip3 install -r /app/docker/requirements.txt
RUN pip3 install tensorflow-gpu

# #--------------------------
# # Install local packages
# #--------------------------

RUN git submodule update --init --recursive
RUN cd /app/lib/universe/  && pip3 install -e .
RUN pip3 install -e .


# #--------------------------
# #Set env
# #--------------------------


# #--------------------------
# #Expose ports
# #--------------------------
# #notebook
EXPOSE 8888
EXPOSE 6006



ENTRYPOINT [ "./docker/entrypoint.sh" ]
CMD [ "/bin/bash"]