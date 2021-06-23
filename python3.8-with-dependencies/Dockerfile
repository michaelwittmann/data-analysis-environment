FROM micwittmann/data-analysis-environment:python3.8

LABEL maintainer="Michael Wittmann <michael.wittmann@tum.de>"

# Install poetry
ENV VIRTUAL_ENV=/opt/venv
RUN python3.8 -m venv $VIRTUAL_ENV
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

WORKDIR /tmp
COPY pyproject.toml poetry.lock ./

#ENV POETRY_VIRTUALENVS_IN_PROJECT=true
RUN poetry install --no-interaction --no-ansi

RUN jupyter contrib nbextension install --user
RUN jupyter contrib nbextension install --user

WORKDIR /home/ubuntu


