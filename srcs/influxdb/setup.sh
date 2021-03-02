/usr/sbin/influxdb & slepp 3
# Initialize database
influx -execute "CREATE DATABASE grafana"
influx -execute "CREATE USER kriosfu WITH PASSWORD 'kriosfu'"
influx -execute "GRANT ALL ON grafana TO kriosfu"

tail -f /dev/null
