FROM ubuntu:16.04
RUN apt-get update
RUN apt-get install locales

# Set the locale
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

# Install dependencies
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update
RUN apt-get install -qq wget unzip build-essential cmake gcc libcunit1-dev libudev-dev
RUN apt-get install -qq checkinstall
RUN apt-get install -qq libreadline-gplv2-dev libncursesw5-dev libssl-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev
RUN apt-get -y install python3-pip curl

# Install nvidia drivers
RUN apt-get -y install nvidia-384 nvidia-modprobe

# Create a volume named "avod-docker"
VOLUME /avod-docker

# Use volume as active directory
WORKDIR /avod-docker
COPY . /avod-docker

# Install nvidia cuda
RUN wget https://developer.nvidia.com/compute/cuda/8.0/Prod2/local_installers/cuda-repo-ubuntu1604-8-0-local-ga2_8.0.61-1_amd64-deb
RUN dpkg -i cuda-repo-ubuntu1604-8-0-local-ga2_8.0.61-1_amd64-deb
RUN apt-get update
RUN apt-get -y install cuda-8.0

# Install Python dependencies for AVOD
RUN pip3 install -r requirements.txt
RUN pip3 install tensorflow-gpu==1.3.0
