FROM debian:latest

MAINTAINER mmagalha "mmagalha@gmail.com"

ENV DEBIAN_FRONTEND noninteractive
ENV TZ=America/Recife
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt update \
&& apt -y upgrade \
&& apt -y install \
apache2 \
php \
php-mysql \
php-ldap \
php-xmlrpc \
php-imap \
curl \
php-curl \
php-gd \
php-mbstring \
php-xml \
php-apcu-bc \
php-cas \
cron \
wget \
jq

COPY glpi-start.sh /opt/
COPY cust/ /tmp/.
RUN chmod +x /opt/glpi-start.sh
ENTRYPOINT ["/opt/glpi-start.sh"]

EXPOSE 80 443