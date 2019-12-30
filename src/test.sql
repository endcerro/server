CREATE DATABASE wordpress;
CREATE USER test@localhost IDENTIFIED BY "password";
GRANT ALL PRIVILEGES ON wordpress.* TO test@localhost;
FLUSH PRIVILEGES;
