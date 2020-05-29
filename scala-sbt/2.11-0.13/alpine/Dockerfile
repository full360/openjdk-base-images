FROM full360/openjdk:8-jdk-alpine

LABEL build.publish.majorversion="2-0"
LABEL build.publish.minorversion="2.11-0.13"
LABEL build.publish.imagebase="jdk-alpine"

# Set the sbt and scala versions
ENV SCALA_VERSION 2.11.8
ENV SBT_VERSION 0.13.15

RUN mkdir -p /opt
WORKDIR /opt
ADD https://dl.bintray.com/sbt/native-packages/sbt/${SBT_VERSION}/sbt-${SBT_VERSION}.tgz .
RUN tar xvfz sbt-${SBT_VERSION}.tgz \
  && rm -f sbt-${SBT_VERSION}.tgz \
  && ln -s /opt/sbt/bin/sbt /usr/bin/ \
  && mkdir -p /tmp/scala \
  && cd /tmp/scala \
  && echo "scalaVersion := \"${SCALA_VERSION}\"" > build.sbt \
  && sbt compile \
  && rm -rf /tmp/scala
