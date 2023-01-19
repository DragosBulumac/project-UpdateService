
FROM python:3.10-alpine as builder
ENV PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1 \
    PIP_NO_CACHE_DIR=off \
    PIP_DISABLE_PIP_VERSION_CHECK=on \
    PIP_DEFAULT_TIMEOUT=100 \
    POETRY_HOME="/opt/poetry" \
    POETRY_VIRTUALENVS_IN_PROJECT=true \
    POETRY_NO_INTERACTION=1 \
    PYSETUP_PATH="/opt/pysetup" \
    VENV_PATH="/opt/pysetup/env"

ENV PATH="$POETRY_HOME/bin:$ENV_PATH/bin:$PATH"

ENV POETRY_VERSION=1.0.5
RUN curl -sSL https://raw.githubusercontent.com/sdispater/poetry/master/get-poetry.py | python
# de facut un well
#FROM python:3.10-alpine
#COPY from builder

WORKDIR /app
WORKDIR $PYSETUP_PATH
COPY ./poetry.lock ./pyproject.toml ./




COPY . /app
#RUN pip install poetry
CMD ["uvicorn" , ".app:app" , "--host", "0.0.0.0", "--port", "8000"]

#install diffrent sets of dependencies based on some env variable
#poetry install $(test"$YOUR_ENV" == PRODUCTION && echo "--no-dev")

#RUN poetry config virtualenvs.create false
#RUN poetry install --no-interaction



