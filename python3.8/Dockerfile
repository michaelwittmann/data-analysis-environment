FROM micwittmann/data-analysis-environment:base

LABEL maintainer="Michael Wittmann <michael.wittmann@tum.de>"

RUN apt-get update && apt-get install -y apt-transport-https

# Python 3.8.7 install
# ensure local python is preferred over distribution python
ENV PATH /usr/local/bin:$PATH
RUN apt-get update && apt-get install -y --no-install-recommends \
    python3.8 \
    python3-pip \
    build-essential \
    python3-dev \
    && apt-get clean && rm -rf /var/lib/apt/lists/* \
	&& python3 --version


# make some useful symlinks that are expected to exist
RUN cd /usr/local/bin \
	&& ln -s idle3 idle \
	&& ln -s pydoc3 pydoc \
	&& ln -s python3 python \
	&& ln -s python3-config python-config

# Poetry config from https://github.com/python-poetry/poetry/discussions/1879
ENV PYTHONUNBUFFERED=1 \
    # prevents python creating .pyc files
    PYTHONDONTWRITEBYTECODE=1 \
    \
    # pip
    PIP_NO_CACHE_DIR=off \
    PIP_DISABLE_PIP_VERSION_CHECK=on \
    PIP_DEFAULT_TIMEOUT=100 \
    \
    # poetry
    # https://python-poetry.org/docs/configuration/#using-environment-variables
    POETRY_VERSION=1.0.3 \
    # make poetry install to this location
    POETRY_HOME="/opt/poetry" \
    # make poetry create the virtual environment in the project's root
    # it gets named `.venv`
    POETRY_VIRTUALENVS_IN_PROJECT=true \
    # do not ask any interactive question
    POETRY_NO_INTERACTION=1 \
    \
    # paths
    # this is where our requirements + virtual environment will live
    PYSETUP_PATH="/opt/pysetup" \
    VENV_PATH="/opt/pysetup/.venv"

# prepend poetry and venv to path
ENV PATH="$POETRY_HOME/bin:$VENV_PATH/bin:$PATH"

RUN curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python -


WORKDIR /home/ubuntu



