#!/bin/bash

# Initialize MySQL data directory
mysql_install_db --user=mysql --ldata=/var/lib/mysql

# Start MariaDB server
mysqld --user=mysql --datadir=/var/lib/mysql --skip-networking &

# Wait for MariaDB server to start
sleep 5

# Create root user and grant privileges
mysql -u root <<-EOSQL
  CREATE USER 'root'@'%' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';
  GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION;
  FLUSH PRIVILEGES;
EOSQL

# Stop MariaDB server
mysqladmin -u root shutdown