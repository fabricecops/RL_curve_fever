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
	git

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

# #--------------------------
# # Install local packages
# #--------------------------
RUN git submodule update --init --recursive
RUN cd /app/lib/universe/  && pip install -e .
RUN pip3 install -e .


# #--------------------------
# #Set env
# #--------------------------


# #--------------------------
# #Expose ports
# #--------------------------
# #notebook
EXPOSE 8888



ENTRYPOINT [ "./docker/entrypoint.sh" ]
CMD [ "/bin/bash"]