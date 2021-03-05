# Start influxdb
/usr/sbin/influxd & sleep 3

# Initialize database
influx -execute "CREATE DATABASE ft_services"
influx -execute "CREATE USER kriosfu WITH PASSWORD 'kriosfu'"
influx -execute "GRANT ALL ON influxdb TO kriosfu"

# Keep container running
tail -f /dev/null
