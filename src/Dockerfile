# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: edal--ce <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/12/28 09:29:42 by edal--ce          #+#    #+#              #
#    Updated: 2019/12/30 03:28:31 by edal--ce         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster
RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install nginx -y
RUN apt-get install -y procps
RUN apt-get install default-mysql-server -y
RUN apt-get install php-curl php-fpm php-gd php-intl php-mbstring php-soap php-xml php-xmlrpc php-zip -y
RUN apt-get install unzip -y
RUN apt-get install php -y
#RUN service mysql start
#RUN service nginx start
RUN apt-get install vim -y
RUN apt-get install wget -y
RUN apt-get install php-mysql -y
RUN wget https://wordpress.org/latest.tar.gz -P /tmp
RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.0/phpMyAdmin-5.0.0-all-languages.zip -P /tmp
RUN unzip /tmp/phpMyAdmin-5.0.0-all-languages.zip -d /var/www/html/

RUN mv /var/www/html/phpMyAdmin-5.0.0-all-languages /var/www/html/phpmyadmin
RUN mkdir /var/www/html/wordpress
RUN tar xzf /tmp/latest.tar.gz --strip-components=1 -C /var/www/html/wordpress

COPY ./test.sql /docker-entrypoint-initdb.d/
COPY ./init.sh /docker-entrypoint-initdb.d/

RUN rm -rf /tmp/*
RUN rm /var/www/html/index*

COPY ./ressources/default /etc/nginx/sites-available/default
COPY ./ressources/wordpress /etc/nginx/sites-enabled/wordpress


COPY ./ressources/phpmyadmin /etc/nginx/sites-enabled/phpmyadmin

EXPOSE 80
EXPOSE 443
#WORKDIR / 
ENTRYPOINT bash /docker-entrypoint-initdb.d/init.sh
#CMD echo "Hello World"
#CMD bash
#CMD echo "hllo ?"
