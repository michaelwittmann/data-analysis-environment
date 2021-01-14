FROM ubuntu:20.04

LABEL maintainer="Michael Wittmann <michael.wittmann@tum.de>"

ENV TZ=Europe/Berlin

# install and set the "de_DE.UTF-8"
RUN apt-get update && apt-get install -y locales && rm -rf /var/lib/apt/lists/* \
	&& localedef -i de_DE -c -f UTF-8 -A /usr/share/locale/locale.alias de_DE.UTF-8
ENV LANG de_DE.utf8


RUN apt-get update && apt-get install -y --no-install-recommends\
    apt-utils \
    software-properties-common \
    dirmngr \
    apt-transport-https \
    lsb-release \
    ca-certificates


# Python 3.8.7 install
# ensure local python is preferred over distribution python
ENV PATH /usr/local/bin:$PATH


## extra dependencies (over what buildpack-deps already includes)
#RUN apt-get update && apt-get install -y --no-install-recommends \
#		libbluetooth-dev \
#		tk-dev \
#		uuid-dev \
#	&& rm -rf /var/lib/apt/lists/*


RUN apt-get update && apt-get install -y --no-install-recommends \
    python3.8 \
    python3-pip \
    build-essential \
    libssl-dev \
    libffi-dev \
    python3-dev \
	&& python3 --version


# make some useful symlinks that are expected to exist
RUN cd /usr/local/bin \
	&& ln -s idle3 idle \
	&& ln -s pydoc3 pydoc \
	&& ln -s python3 python \
	&& ln -s python3-config python-config

RUN pip3 install --upgrade pip
RUN pip3 install poetry

# GIS dependencies
#RUN add-apt-repository ppa:ubuntugis/ubuntugis-stable
RUN add-apt-repository ppa:ubuntugis/ubuntugis-unstable
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
		libpdal-plugin-python

# Install poetry

RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    git-lfs

WORKDIR /usr/src/app

COPY ./pyproject.toml ./

RUN poetry config virtualenvs.create false \
  && poetry install --no-interaction --no-ansi

WORKDIR /home/ubuntu


