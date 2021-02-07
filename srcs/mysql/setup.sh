# Setup MySQL
mysql -uroot -p mysql < wordpress.sql
mariadb-install-db --datadir="/var/lib/mysql"

# Initialize database

# Keep container running
tail -f /dev/null