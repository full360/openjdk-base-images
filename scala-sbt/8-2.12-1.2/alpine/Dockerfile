FROM 115159323386.dkr.ecr.ap-southeast-2.amazonaws.com/base/openjdk:8-jdk-alpine

LABEL build.publish.majorversion="8-2-1"
LABEL build.publish.minorversion="8-2.12-1.2"
LABEL build.publish.imagebase="jdk-alpine"

# Set the sbt and scala versions
ENV SCALA_VERSION 2.12.2
ENV SBT_VERSION 1.2.7

RUN mkdir -p /opt
WORKDIR /opt
ADD https://piccolo.link/sbt-${SBT_VERSION}.tgz .
RUN tar xvfz sbt-${SBT_VERSION}.tgz \
  && rm -f sbt-${SBT_VERSION}.tgz \
  && ln -s /opt/sbt/bin/sbt /usr/bin/ \
  && mkdir -p /tmp/scala \
  && cd /tmp/scala \
  && echo "scalaVersion := \"${SCALA_VERSION}\"" > build.sbt \
  && sbt compile \
  && rm -rf /tmp/scala