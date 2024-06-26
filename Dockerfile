FROM python:3.9 as base

ARG PACKAGE_NAME="slackbot"

# Install python packages
WORKDIR /app/${PACKAGE_NAME}
COPY ./requirements.txt /app/${PACKAGE_NAME}/requirements.txt
RUN --mount=type=cache,target=/root/.cache/pip \
    pip install -r requirements.txt

# Copy all files to the container
COPY . /app/${PACKAGE_NAME}
WORKDIR /app/${PACKAGE_NAME}

RUN chmod a+x /app/${PACKAGE_NAME}/scripts/start.sh

ENV PACKAGE_NAME=$PACKAGE_NAME
ENV PYTHONPATH "/app"
ENTRYPOINT /app/${PACKAGE_NAME}/scripts/start.sh
