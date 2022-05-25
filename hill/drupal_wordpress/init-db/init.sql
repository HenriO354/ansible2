-- Create databases
CREATE DATABASE IF NOT EXISTS drupaldb;
CREATE DATABASE IF NOT EXISTS wordpressdb;

-- Create users
CREATE USER 'drupal'@'%' IDENTIFIED BY 'drupalpass';
CREATE USER 'wordpress'@'%' IDENTIFIED BY 'wordpresspass';

-- grant rights to dbuser
GRANT ALL PRIVILEGES ON drupaldb.* TO 'drupal'@'%' WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON wordpressdb.* TO 'wordpress'@'%' WITH GRANT OPTION;