FROM debian:10
LABEL MAINTAINER Kenneth Peiruza <aforns@reus.cat>

RUN        apt update && \
           apt install -y libapache2-mod-php php-mysql php-gd && \
           apt install -y curl && \
           curl https://wordpress.org/latest.tar.gz  --output /tmp/wplatest.tar.gz && \
		   tar xf /tmp/wplatest.tar.gz -C /var/www/html && \
		   rm /tmp/wplatest.tar.gz && \
		   ln -sf /dev/stdout /var/log/apache2/access.log && \
	       ln -sf /dev/sterr /var/log/apache2/error.log 

EXPOSE 80

CMD [ "/usr/sbin/apache2ctl start", "-D","FOREGROUND" ]
