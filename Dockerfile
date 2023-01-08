FROM python:3.9.5-slim-buster

ENV APP_ROOT="/root"
ENV CODE_DIR="/code"
WORKDIR ${APP_ROOT}

COPY requirements.txt requirements.txt

RUN pip install -r requirements.txt

COPY config/.flake8 .
COPY config/.isort.cfg .
COPY entrypoint.sh /usr/local/bin

ENV DEFAULT_FLAKE8_CONFIG=${APP_ROOT}/.flake8
ENV DEFAULT_ISORT_CONFIG=${APP_ROOT}/.isort.cfg

VOLUME ${CODE_DIR}
WORKDIR ${CODE_DIR}

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
