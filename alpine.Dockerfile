FROM openjdk:8-jre-alpine

LABEL MAINTAINER="zhangsean<zxf2342@qq.com>"

ENV DAVINCI3_HOME /opt/davinci

WORKDIR /opt/davinci

EXPOSE 8080

ARG DAVINCI_URL=https://github.com/edp963/davinci/releases/download/v0.3.0-rc/davinci-assembly_0.3.1-0.3.1-SNAPSHOT-dist-rc.zip

RUN wget -O davinci.zip $DAVINCI_URL \
 && unzip davinci.zip -d /opt\
 && rm -rf davinci.zip /opt/davinci \
 && mv -f /opt/davinci-assembly* /opt/davinci \
 && cd /opt/davinci/ \
 && cp -v config/application.yml.example config/application.yml \
 && sed -i 's|address:\ 127.0.0.1|address:|' config/application.yml

CMD ["./bin/start-server.sh"]
