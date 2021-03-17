# Start influxdb

# Initialize database
influx -execute "CREATE DATABASE ft_services"
influx -execute "CREATE USER kriosfu WITH PASSWORD 'kriosfu'"
influx -execute "GRANT ALL ON influxdb TO kriosfu"


