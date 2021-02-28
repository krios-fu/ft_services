#sleep 5
php -S 0.0.0.0:9000 -t /www/ &
/usr/sbin/nginx -g "daemon off;"
