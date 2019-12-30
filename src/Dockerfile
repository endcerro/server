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
RUN apt-get install nginx procps default-mysql-server php php-fpm php-mbstring unzip vim php-mysql -y

COPY ./ressources/latest.tar.gz /tmp/latest.tar.gz
COPY ./ressources/phpMyAdmin-5.0.0-all-languages.zip /tmp/phpMyAdmin-5.0.0-all-languages.zip 
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
ENTRYPOINT bash /docker-entrypoint-initdb.d/init.sh