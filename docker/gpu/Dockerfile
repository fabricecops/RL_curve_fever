
RUN apt-get update \
    && apt-get install -y libav-tools \
    python3-numpy \
    python3-scipy \
    python3-setuptools \
    python3-pip \
    libpq-dev \
    libjpeg-dev \
    curl \
    cmake \
    swig \
    python3-opengl \
    libboost-all-dev \
    libsdl2-dev \
    wget \
    unzip \
    git \
    golang \
    net-tools \
    iptables \
    libvncserver-dev \
    software-properties-common \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN ln -sf /usr/bin/pip3 /usr/local/bin/pip \
    && ln -sf /usr/bin/python3 /usr/local/bin/python \
    && pip install -U pip

# Install gym
RUN pip install gym[all]

# Get the faster VNC driver
RUN pip install go-vncdriver>=0.4.0

# Install pytest (for running test cases)
RUN pip install pytest

# Force the container to use the go vnc driver
ENV UNIVERSE_VNCDRIVER='go'

# Just in case any python cache files were carried over from the source directory, remove them
RUN py3clean .

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
RUN pip install -r /app/docker/requirements.txt
RUN pip install tensorflow-gpu -y
# #--------------------------
# # Install local packages
# #--------------------------
RUN git submodule update --init --recursive
RUN cd /app/lib/universe/  && pip install -e .
RUN pip install -e .


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