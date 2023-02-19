FROM pytorch/pytorch:1.13.1-cuda11.6-cudnn8-runtime as base

# Installing tensorboard
FROM base as monitor

RUN pip3 install tensorboard --no-cache-dir

# Installing from requirement
FROM base as production

RUN pip install --no-cache-dir pipreqs

RUN /src && pipreqs .

RUN pip install -r requirements.txt

# Installing jupyter, and code-server
FROM base as development

RUN pip install --no-cache-dir jupyter

RUN apt update && apt install curl -y

# using url is not recommended but it has been used for simplicity
RUN curl -fsSL https://code-server.dev/install.sh | sh
