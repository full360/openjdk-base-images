FROM openjdk:11-jdk-slim

LABEL build.publish.majorversion="11"
LABEL build.publish.minorversion="11-jdk"
LABEL build.publish.imagebase="slim"

# envelope version
ENV ENVELOPE_VERSION 0.3.3

RUN apt-get update && apt-get install -y \
      bash \
      curl \
      unzip \
      ca-certificates \
      gnupg \
  && mkdir -p /root/.gnupg \
  && echo "allow-loopback-pinentry" >> /root/.gnupg/gpg-agent.conf \
  && echo "pinentry-mode loopback" >> /root/.gnupg/gpg.conf \
  && curl -s -o /usr/local/share/ca-certificates/full360-root-ca.crt \
    https://s3.amazonaws.com/full360-cloudformation-init/public/full360-root-ca.crt \
  && update-ca-certificates \
  && curl -s -o /tmp/envelope.zip \
    https://releases-full360.s3.amazonaws.com/public/envelope/${ENVELOPE_VERSION}/envelope_${ENVELOPE_VERSION}_linux_amd64.zip \
  && unzip /tmp/envelope.zip -d /usr/local/bin/ \
  && rm /tmp/envelope.zip
