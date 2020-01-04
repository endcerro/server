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
RUN apt-get install nginx procps default-mysql-server php php-fpm php-mbstring php-mysql curl -y

COPY ./src/test.sql /docker-entrypoint-initdb.d/
COPY ./src/init.sh /docker-entrypoint-initdb.d/
COPY ./src/update.sh /docker-entrypoint-initdb.d/

COPY ./src/latest.tar.gz /tmp/latest.tar.gz
COPY ./src/phpmyadmin.tar.gz /tmp/phpmyadmin.tar.gz

COPY ./src/default /etc/nginx/sites-available/default
COPY ./src/wordpress /etc/nginx/sites-enabled/wordpress
COPY ./src/phpmyadmin /etc/nginx/sites-enabled/phpmyadmin
COPY ./src/key.sh /docker-entrypoint-initdb.d/
COPY ./src/nginx.conf /etc/nginx/nginx.conf

RUN mkdir /var/www/html/wordpress
RUN tar xzf /tmp/latest.tar.gz --strip-components=1 -C /var/www/html/wordpress
RUN tar xzf /tmp/phpmyadmin.tar.gz --strip-components=1 -C /var/www/html/
RUN rm -rf /tmp/*
RUN rm /var/www/html/index*
RUN chown -R www-data:www-data /var/www/html

EXPOSE 80
EXPOSE 443
ENTRYPOINT bash /docker-entrypoint-initdb.d/init.sh