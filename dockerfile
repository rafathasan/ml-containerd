FROM pytorch/pytorch:1.13.1-cuda11.6-cudnn8-runtime as base

# Installing tensorboard
FROM base as monitor

RUN pip3 install tensorboard --no-cache-dir

# Installing from requirement
FROM base as build

RUN pip install --no-cache-dir pipreqs

COPY ./src /src

WORKDIR /src

RUN pipreqs .

RUN pip install -r requirements.txt

FROM build as production

# Installing jupyter, and code-server
FROM build as development

ARG CODE_SERVER_VER='4.10.0'

RUN pip install --no-cache-dir jupyter

RUN apt update && apt install curl -y

# using url is not recommended but it has been used for simplicity
RUN curl -fsSL https://code-server.dev/install.sh | sh -s -- --version $CODE_SERVER_VER

RUN code-server --install-extension ms-python.python

RUN code-server --install-extension ms-toolsai.jupyter
