FROM python:3.11-rc-bullseye

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    cmake \
    libmd4c-dev \
    libmd4c-html0 \
  && apt-get clean

# Other custom software

ENV APPS_HOME=/apps
RUN mkdir $APPS_HOME
WORKDIR $APPS_HOME

### md4c ###
RUN wget https://github.com/mity/md4c/archive/refs/tags/release-0.4.8.tar.gz \
  && tar -xzf release-0.4.8.tar.gz \
  && cd md4c-release-0.4.8 \
  && mkdir build \
  && cd build \
  && cmake .. \
  && make \
  && make install

RUN pip install --upgrade pymd4c mdpo
