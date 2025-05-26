FROM debian:bullseye

RUN apt-get update && \
    apt-get install -y \
      python3 \
      python3-pip \
      build-essential \
      libffi-dev \
      patchelf \
      patchelf \
      python3-venv \
    && pip3 install --no-cache-dir nuitka

RUN apt-get install -y ccache

#RUN pip install --no-cache-dir --user -r requirements.txt

WORKDIR /workspace
