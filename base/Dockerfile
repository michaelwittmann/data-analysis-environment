FROM ubuntu:20.04

LABEL maintainer="Michael Wittmann <michael.wittmann@tum.de>"

# Fix DL4006
SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN apt-get update && apt-get install -y apt-transport-https
# install and set the "de_DE.UTF-8"
RUN apt-get update && apt-get install -y locales
#&& rm -rf /var/lib/apt/lists/* \
#	&& localedef -i de_DE -c -f UTF-8 -A /usr/share/locale/locale.alias de_DE.UTF-8
#ENV LANG de_DE.utf8
RUN locale-gen de_DE.UTF-8
RUN update-locale LANG=de_DE.UTF-8
ENV TZ=Europe/Berlin


# Install apt essentials
RUN apt-get update && apt-get install -y --no-install-recommends\
    apt-utils \
    software-properties-common \
    dirmngr \
    apt-transport-https \
    lsb-release \
    ca-certificates

# Install usefull stuff
RUN apt-get update && apt-get install -yq --no-install-recommends \
    build-essential \
    vim-tiny \
    git \
    git-lfs \
    inkscape \
    libsm6 \
    libxext-dev \
    libxrender1 \
    lmodern \
    netcat \
    # ---- nbconvert dependencies ----
    texlive-xetex \
    texlive-fonts-recommended \
    texlive-plain-generic \
    # ----
    lsb-core\
    tzdata \
    unzip \
    nano-tiny \
    wget \
    locales \
    fonts-liberation \
    run-one \
    libssl-dev \
    build-essential \
    libffi-dev \
    libllvm-10-ocaml-dev \
    libllvm10 \
    llvm-10 \
    llvm-10-dev \
    llvm-10-doc \
    llvm-10-examples \
    llvm-10-runtime \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Create alternative for nano -> nano-tiny
RUN update-alternatives --install /usr/bin/nano nano /bin/nano-tiny 10

# Install GIS dependencies
RUN add-apt-repository ppa:ubuntugis/ppa
#RUN add-apt-repository ppa:ubuntugis/ubuntugis-unstable
#RUN add-apt-repository ppa:grass/grass-stable

RUN apt-get update && apt-get install -y --no-install-recommends \
    libproj-dev \
    proj-data \
    proj-bin \
    libgeos-dev \
    libgdal-dev \
    gdal-bin \
    libpdal-dev \
    pdal \
    libpdal-plugin-python \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR /home/ubuntu



