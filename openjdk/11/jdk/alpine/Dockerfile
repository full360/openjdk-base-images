FROM openjdk:11-jdk-alpine

LABEL build.publish.majorversion="11"
LABEL build.publish.minorversion="11-jdk"
LABEL build.publish.imagebase="alpine"

# envelope version
ENV ENVELOPE_VERSION 0.3.1

RUN apk add --no-cache \
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
       http://releases.full360.com/envelope/envelope_${ENVELOPE_VERSION}_linux_amd64.zip \
  && unzip /tmp/envelope.zip -d /usr/local/bin/ \
  && rm /tmp/envelope.zip
