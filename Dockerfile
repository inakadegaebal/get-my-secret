FROM centos:7

MAINTAINER j-jeong@trifort.jp

RUN yum -y install httpd php

ADD ./httpd.conf /etc/httpd/conf/httpd.conf

ADD ./source /var/www/html

EXPOSE 4567

HEALTHCHECK --interval=10s CMD curl -f http://localhost:4567/health-checker.php || exit 1

CMD httpd -DFOREGROUND
