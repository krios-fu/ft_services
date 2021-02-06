CREATE DATABASE wordpress;
CREATE USER 'kriosfu'@'localhost' IDENTIFIED BY 'kriosfu';
GRANT ALL PRIVILEGES ON  * . * TO 'kriosfu'@'localhost';
FLUSH PRIVILEGES;