-- creading wordpress db if it doesnt exist
CREATE DATABASE IF NOT EXISTS wordpress;

-- creating user
CREATE USER IF NOT EXISTS 'wp_user'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';
GRANT ALL PRIVILEGES ON wordpress.* TO 'wp_user'@'%';

-- creating root
CREATE USER IF NOT EXISTS 'root'@'%' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION;

FLUSH PRIVILEGES;