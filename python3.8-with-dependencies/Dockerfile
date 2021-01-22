FROM micwittmann/data-analysis-environment:python3.8

LABEL maintainer="Michael Wittmann <michael.wittmann@tum.de>"

# Install poetry
WORKDIR /tmp

COPY pyproject.toml ./

RUN poetry config virtualenvs.create false \
  && poetry install --no-interaction --no-ansi

RUN jupyter contrib nbextension install --user
RUN jupyter nbextensions_configurator enable --user

WORKDIR /home/ubuntu



