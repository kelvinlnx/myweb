FROM registry.access.redhat.com/ubi8/ubi:latest

MAINTAINER The Great Student <student@example.com>

EXPOSE 8080

ENV MSG="Hi" VALUE1=100

RUN yum install -y httpd; \
    yum clean all; \
    sed -i 's/^Listen 80 *$/Listen 8080/' /etc/httpd/conf/httpd.conf; \
    chgrp -R 0 /var/log/httpd /var/run/httpd; \
    chmod -R g=u /var/log/httpd /var/run/httpd

ADD ./src/* /var/www/html

# Apache doesn't need the USER. The server MUST be started as root
# which will then be auto switched to the "apache" user specified in the
# /etc/httpd/conf/httpd.conf
#USER apache

ENTRYPOINT ["httpd","-DFOREGROUND"]
