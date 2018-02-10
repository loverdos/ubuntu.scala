FROM loverdos/ubuntu.java:latest
LABEL maintainer christos KK Loverdos <loverdos@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

# Add sbt repo
RUN echo "deb https://dl.bintray.com/sbt/debian /" | tee -a /etc/apt/sources.list.d/sbt.list \
  && apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2EE0EA64E40A89B84B2DF73499E82A75642AC823

# install: sbt
RUN apt-get update
RUN apt-get -y install sbt

# install: scala via linuxbrew
RUN su - christos -c 'brew install scala'

# force update: sbt
RUN su - christos -c 'sbt exit'

USER christos