service mysql start
service php7.3-fpm start

mysql -u root -ptoor < /docker-entrypoint-initdb.d/test.sql

cp  /var/www/html/phpmyadmin/config.sample.inc.php /var/www/html/phpmyadmin/config.inc.php
bash /docker-entrypoint-initdb.d/update.sh
bash /docker-entrypoint-initdb.d/key.sh localhost
echo "Changing var/www/html ownership..."
chown -R www-data:www-data /var/www/html
service nginx start
bash