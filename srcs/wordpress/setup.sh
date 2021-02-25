php -S 0.0.0.0:9000 -t /www/ &
sleep 5
/usr/sbin/nginx -g "daemon off;"
