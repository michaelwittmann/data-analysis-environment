FROM micwittmann/data-analysis-environment:python3.9

LABEL maintainer="Michael Wittmann <michael.wittmann@tum.de>"

# Install poetry
WORKDIR /python_env

COPY pyproject.toml ./
COPY poetry.lock ./

ENV POETRY_VIRTUALENVS_IN_PROJECT=true
RUN poetry install --no-interaction --no-ansi

#RUN poetry config virtualenvs.create false \
#  && poetry export -f requirements.txt --output requirements.txt --without-hashes \
#  && pip3 install --ignore-installed -r requirements.txt

RUN . /python_env/.venv/bin/activate && jupyter contrib nbextension install --user
RUN . /python_env/.venv/bin/activate && jupyter contrib nbextension install --user

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Set working directory
WORKDIR /home/ubuntu
ENTRYPOINT ["/entrypoint.sh"]



