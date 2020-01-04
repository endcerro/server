service mysql start
echo "php init..."
service php7.3-fpm start
echo "db init..."
mysql -u root -ptoor < /docker-entrypoint-initdb.d/test.sql
cp  /var/www/html/phpmyadmin/config.sample.inc.php /var/www/html/phpmyadmin/config.inc.php
echo "wordpress db install..."
bash /docker-entrypoint-initdb.d/update.sh
echo "SSL keygen..."
bash /docker-entrypoint-initdb.d/key.sh localhost
service nginx start
bash