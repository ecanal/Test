FROM library/debian:stretch
MAINTAINER esther.canal@gmail.com

RUN 	apt-get update && \
	apt-get -y install php-mysql php-gd libapache2-mod-php7.0 && \
	#apt-get -y install php-mysql php-gd lib-apache2-mod-php7.0 && \
	rm -rf /var/lib/dpkg /var/lib/apt /var/www/html/index.html && \
	ln -sf /dev/stdout /var/log/apache2/access.log && \
	ln -sf /dev/sterr /var/log/apache2/error.log  
COPY index.html /var/www/html
ENTRYPOINT [ "/usr/sbin/apache2ctl", "-D", "FOREGROUND" ]
#CMD [ "8.8.8.8 ]
#EXPOSE	80
