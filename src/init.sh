chown -R root:www-data /var/www/
service mysql start
service php7.3-fpm start
service nginx start
mysql -u root -ptoor < /docker-entrypoint-initdb.d/test.sql
chown -R www-data:www-data /var/www
#sed -i '57s/#//' /etc/nginx/sites-available/default
#sed -i '56s/#//' /etc/nginx/sites-available/default
#sed -i '60s/#//' /etc/nginx/sites-available/default
#sed -i '63s/#//' /etc/nginx/sites-available/default
#sed -i '46s/_;/wordpress;/' /etc/nginx/sites-available/default
#sed -i '57s/#//' /etc/nginx/sites-available/default
#sed -i '44s/index.html/index.php/' /etc/nginx/sites-available/default
bash
