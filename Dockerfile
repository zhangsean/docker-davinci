FROM adoptopenjdk:8-jre-openj9

LABEL MAINTAINER="zhangsean<zxf2342@qq.com>"

ENV DAVINCI3_HOME /opt/davinci

WORKDIR /opt/davinci

EXPOSE 8080

ARG DAVINCI_ASSET=https://github.com/edp963/davinci/releases/download/v0.3.0-rc/davinci-assembly_0.3.1-0.3.1-SNAPSHOT-dist-rc.zip

RUN curl -SLo davinci.zip $DAVINCI_ASSET \
 && apt-get update \
 && apt-get install -y unzip \
 && apt-get -y autoremove && apt-get autoclean && apt-get clean all \
 && rm -rf /var/lib/apt/lists/* && rm -rf /var/cache/debconf/* && rm -rf /tmp/* \
 && unzip davinci.zip -d /opt\
 && rm -rf davinci.zip /opt/davinci \
 && mv -f /opt/davinci-assembly* /opt/davinci \
 && cd /opt/davinci \
 && cp -v config/application.yml.example config/application.yml \
 && sed -i 's|address:\ 127.0.0.1|address:|' config/application.yml

CMD ["./bin/start-server.sh"]
