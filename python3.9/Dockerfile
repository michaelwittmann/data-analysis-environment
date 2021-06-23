FROM micwittmann/data-analysis-environment:base

LABEL maintainer="Michael Wittmann <michael.wittmann@tum.de>"

RUN apt-get update && apt-get install -y apt-transport-https

# Python 3.9 install
# ensure local python is preferred over distribution python
ENV PATH /usr/local/bin:$PATH
RUN apt-get update && apt-get install -y --no-install-recommends \
    python3.9 \
    python3-pip \
    build-essential \
    python3-dev \
    python3-venv \
    && apt-get clean && rm -rf /var/lib/apt/lists/* \
	&& python3 --version


# make some useful symlinks that are expected to exist
RUN cd /usr/local/bin \
	&& ln -s idle3 idle \
	&& ln -s pydoc3 pydoc \
	&& ln -s python3 python \
	&& ln -s python3-config python-config

RUN pip3 install --upgrade pip
RUN pip3 install poetry

WORKDIR /home/ubuntu



