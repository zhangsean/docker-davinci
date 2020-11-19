# docker-davinci

Docker image for [davinci](https://github.com/edp963/davinci) data dashboard.

[![DockerHub Badge](http://dockeri.co/image/zhangsean/davinci)](https://hub.docker.com/r/zhangsean/davinci/)

## Tags

openj9 | alpine
---|---
latest | alpine
v0.3.0-rc | v0.3.0-rc-alpine

Tag | Base JRE | Compressed image size | Running memory
---|---|---|---
latest | adoptopenjdk:8-jre-openj9 | ~227 MB | ~200 MiB
alpine | openjdk:8-jre-alpine | ~188 MB | ~600 MiB

## Usage

```sh
# pull latest image
docker pull zhangsean/davinci:latest
# prepare davinci.sql
docker run --rm -v $PWD:/tmp zhangsean/davinci:latest cp bin/davinci.sql /tmp/
# run local mysql and init davinci db tables.
docker run -itd --name mysql \
  -p 3306:3306 \
  -v $PWD/davinci.sql:/docker-entrypoint-initdb.d/davinci.sql \
  -e MYSQL_DATABASE=davinci \
  -e MYSQL_ROOT_PASSWORD=pass \
  mysql:5.7
# run davinci
docker run -itd --name davinci \
  -p 8080:8080 \
  --link mysql:localdb \
  -e SPRING_DATASOURCE_URL="jdbc:mysql://localdb/davinci?useUnicode=true&characterEncoding=UTF-8&zeroDateTimeBehavior=convertToNull&allowMultiQueries=true&useSSL=false" \
  -e SPRING_DATASOURCE_USERNAME="root" \
  -e SPRING_DATASOURCE_PASSWORD="pass" \
  -e SPRING_MAIL_HOST="smtp.qq.com" \
  -e SPRING_MAIL_PORT="465" \
  -e SPRING_MAIL_PROPERTIES_MAIL_SMTP_SSL_ENABLE="true" \
  -e SPRING_MAIL_USERNAME="someone@qq.com" \
  -e SPRING_MAIL_PASSWORD="bomgxxoocgkobjdc" \
  -e SPRING_MAIL_NICKNAME="Davinci" \
  zhangsean/davinci:latest
# login to http://localhost:8080 with following account/password.
guest/123456
```

## More info

[edp963/davinci](https://github.com/edp963/davinci)
