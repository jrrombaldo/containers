FROM openjdk:8-jdk-alpine

LABEL maintainer="jr.rombaldo@gmail.com"

WORKDIR /opt

ENV GATLING_VERSION 3.3.1
ENV GATLING_URL "https://repo1.maven.org/maven2/io/gatling/highcharts/gatling-charts-highcharts-bundle/${GATLING_VERSION}/gatling-charts-highcharts-bundle-${GATLING_VERSION}-bundle.zip"
ENV GATLING_HOME /opt/gatling
ENV PATH="${GATLING_HOME}/bin:${PATH}"

ENV TARGET "https://exanple123.com"
ENV DURATION "1 minutes"
ENV CONTEXT_PATH "/"
ENV REQ_SEC 20

ENV HEADER_UA "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:63.0) Gecko/20100101 Firefox/63.0"
ENV HEADER_ACCEPT "text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8"
ENV HEADER_ENC "gzip, deflate"
ENV HEADER_LANG "en-US,en;q=0.5"

RUN \
    wget -q -O /tmp/gatling-${GATLING_VERSION}.zip ${GATLING_URL} \
    && unzip /tmp/gatling-${GATLING_VERSION}.zip -d /opt/ \
    && mv /opt/gatling-* /opt/gatling \
    && rm -rf /opt/gatling/gatling-${GATLING_VERSION}.zip

COPY HTTPLoadGenerator.scala /opt/gatling/user-files/simulations/HTTPLoadGenerator.scala

VOLUME [ "/output" ]

CMD gatling.sh -s HTTPLoadGenerator --results-folder /output
# CMD sh