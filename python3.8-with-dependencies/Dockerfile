FROM micwittmann/data-analysis-environment:python3.8

LABEL maintainer="Michael Wittmann <michael.wittmann@tum.de>"

# Install poetry
WORKDIR /tmp

COPY pyproject.toml ./
COPY poetry.lock ./


# Install pyyaml manually
RUN curl https://github.com/yaml/pyyaml/archive/refs/tags/5.4.1.tar.gz\
 && tar -xf pyyaml-5.4.1.tar.gz \
 && python3 pyyaml-5.4.1/setup.py install

RUN poetry config virtualenvs.create false \
  && poetry install --no-interaction --no-ansi

#RUN poetry config virtualenvs.create false \
#  && poetry export -f requirements.txt --output requirements.txt --without-hashes \
#  && pip3 install --ignore-installed -r requirements.txt

RUN jupyter contrib nbextension install --user
RUN jupyter nbextensions_configurator enable --user

# Set working directory
WORKDIR /home/ubuntu



