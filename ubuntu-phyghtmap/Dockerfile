# docker build --tag ubuntu-phyghtmap ubuntu-phyghtmap
# docker run -v $(pwd):$(pwd) -w $(pwd) -it ubuntu-phyghtmap phyghtmap --version
FROM ubuntu:20.04

# disable interactive functions
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y \
        wget python3 \
        python3-matplotlib \
        python3-numpy \
        python3-bs4 \
        python3-pkg-resources \
        python3-gdal \
    && rm -rf /var/lib/apt/lists/*

RUN wget http://katze.tfiu.de/projects/phyghtmap/phyghtmap_2.23-1_all.deb && \
    dpkg -i phyghtmap_2.23-1_all.deb && \
    rm phyghtmap_2.23-1_all.deb

