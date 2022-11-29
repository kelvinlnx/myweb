FROM registry.access.redhat.com/ubi8/ubi:latest

MAINTAINER The Great Student <student@example.com>

#EXPOSE 8080

ENV MSG="Hi" VALUE1=100

RUN yum install -y httpd; \
    yum clean all; \
    sed -i 's/^Listen 80 *$/Listen 8080/' /etc/httpd/conf/httpd.conf

ADD ./src/* /var/www/html

#USER apache

ENTRYPOINT ["httpd","-DFOREGROUND"]
