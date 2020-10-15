FROM debian:10
LABEL MAINTAINER Albert <aforns@reus.cat>

RUN        apt update && \
           apt install -y libapache2-mod-php php-mysql php-gd && \
           apt install -y curl && \
           curl https://wordpress.org/latest.tar.gz  --output /tmp/wplatest.tar.gz && \
           tar xf /tmp/wplatest.tar.gz -C /var/www/html && \
           rm /tmp/wplatest.tar.gz

EXPOSE 80

CMD [ "/usr/sbin/apache2ctl", "-D", "FOREGROUND" ]

