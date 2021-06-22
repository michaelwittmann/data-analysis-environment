FROM micwittmann/data-analysis-environment:python3.8

LABEL maintainer="Michael Wittmann <michael.wittmann@tum.de>"

# Install poetry
WORKDIR /tmp

COPY pyproject.toml ./

#RUN poetry config virtualenvs.create false \
#  && poetry install --no-interaction --no-ansi

RUN poetry config virtualenvs.create false \
  && poetry export -f requirements.txt --output requirements.txt --without-hashes \
  && pip3 install --ignore-installed -r requirements.txt

RUN jupyter contrib nbextension install --user
RUN jupyter nbextensions_configurator enable --user

# Set working directory
WORKDIR /home/ubuntu



