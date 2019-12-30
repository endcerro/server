service mysql start
service php7.3-fpm start

mysql -u root -ptoor < /docker-entrypoint-initdb.d/test.sql

cp  /var/www/html/phpmyadmin/config.sample.inc.php /var/www/html/phpmyadmin/config.inc.php
bash /docker-entrypoint-initdb.d/update.sh
bash /docker-entrypoint-initdb.d/key.sh localhost > /dev/null
chown -R www-data:www-data /var/www
service nginx start
bash
#mysql -u root -ptoor < /var/www/html/phpmyadmin/sql/create_tables.sql