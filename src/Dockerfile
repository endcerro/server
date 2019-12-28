# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: edal--ce <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/12/28 09:29:42 by edal--ce          #+#    #+#              #
#    Updated: 2019/12/28 17:44:52 by edal--ce         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster
RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install nginx -y
RUN apt-get install -y procps
RUN apt-get install default-mysql-server -y
RUN apt-get install php-curl php-fpm php-gd php-intl php-mbstring php-soap php-xml php-xmlrpc php-zip -y
RUN apt-get install php -y
RUN apt-get install curl -y
RUN service mysql start
RUN service nginx start
RUN apt-get install vim -y
RUN apt-get install wget -y
RUN apt-get install php-mysql -y
RUN service php7.3-fpm start
RUN wget https://wordpress.org/latest.tar.gz -P /tmp
RUN tar xzf /tmp/latest.tar.gz --strip-components=1 -C /var/www/html/
#RUN service mysql start
#RUN mysql -u root -ptoor
#CREATE DATABASE wordpress;
#CREATE USER test@localhost IDENTIFIED BY 'root'; 
#GRANT ALL PRIVILEGES ON wordpress.* TO test@localhost;
#FLUSH PRIVILEGES
#REMOVE COMMENTS
#MOD _
#RESTART ALL
RUN echo "hello world"
EXPOSE 80
EXPOSE 8080
EXPOSE 443
WORKDIR / 
