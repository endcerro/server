service mysql start
service php7.3-fpm start
service nginx start
mysql -u root -ptoor < /docker-entrypoint-initdb.d/test.sql
chown -R www-data:www-data /var/www
bash
