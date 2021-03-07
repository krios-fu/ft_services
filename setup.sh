#!/bin/bash -e

BLUE='\033[0;34m'
WHITE='\033[1;37m'
CIAN='\033[1;36m'
GREEN='\033[1;32m'

head()
{
    clear
    clear
    clear
    clear
    clear
    echo "$GREEN    ___                                             _                    "
    echo "$GREEN   / __)   _             ⭐️ ⭐️ ⭐️ ⭐️               (_)                   "
    echo "$GREEN _| |__  _| |_         ⭐️ ___  _____   ____  _   _  _   ____  _____   ___ "
    echo "$GREEN(_   __)(_   _)      ⭐️  /___)| ___ | / ___)| | | || | / ___)| ___ | /___)"
    echo "$GREEN  | |     | |_  _______ |___ || ____|| |     \ V / | |( (___ | ____||___ |"
    echo "$GREEN  |_|      \__)(_______)(___/ |_____)|_|      \_/  |_| \____)|_____)(___/ 🐳"
}
start_minikube ()
{
    
    echo  "\n\n\n$CIAN************************ $WHITE ⭐️ STARTING MINIKUBE ⭐️ $CIAN************************\n$WHITE";
    minikube start --driver=virtualbox
    sleep 2
    printf "\n\n\n📡   CONNECTING PROXY  "
    kubectl proxy & > /dev/null
    sleep 5
    printf "\n🔄   $CIAN CONNECTING WITH DOCKER 🐳 "
    sleep 3
    echo "\r✅    $CIAN CONNECTED TO DOCKER    🐳 "
    eval $(minikube -p minikube docker-env)
}

function reset_virtualbox(){

	echo "\n\n\🧼 Cleaning DHCP ..."
	kill -9 $(ps aux | grep -i "vboxsvc\|vboxnetdhcp" | awk '{print $2}') 2>/dev/null

	if [[ -f ~/Library/VirtualBox/HostInterfaceNetworking-vboxnet0-Dhcpd.leases ]] ; then
        rm  ~/Library/VirtualBox/HostInterfaceNetworking-vboxnet0-Dhcpd.leases
	fi
	echo  "🧙‍♂️ Magic has been done"

}

configure_metallb()
{
    clear
    head
    echo  "\n\n\n$CIAN************************ $WHITE ⭐️ METALLB CONFIGURE ⭐️ $CIAN************************\n$WHITE";
    printf "🔄    $WHITE Setting metallb...\n"
    minikube addons enable metallb
    sleep 3
    kubectl apply -f ./srcs/metallb/metallb.yaml
    sleep 5
    minikube addons enable metrics-server
}

start_dashboard()
{
    head
    echo  "\n\n\n$CIAN******************** $WHITE STARTING KUBERNETES DASHBOARD  $CIAN*********************\n$WHITE";
    printf "🔄    Minikube Dashboard"
    sleep 4
    minikube dashboard &
    echo "\r✅    Minikube Dashboard"

}

# Creacion de imagenes con docker 
build_image()
{
    head
    eval $(minikube -p minikube docker-env)
    echo  "\n\n\n$CIAN************************ $WHITE 🐳  BUILDING IMAGES 🐳  $CIAN************************\n$WHITE";
    printf "🔄   $WHITE Nginx"
    eval $(minikube docker-env)
    docker build -t nginx ./srcs/nginx 2> error_nginx 1> /dev/null 
    if [ $(($(wc error_nginx| xargs | cut -d" " -f2) + 0)) -gt 0 ] ;
        then
        echo "\r❌    Nginx"
        printf "\t\t ----> "
        cat ./error_nginx
        else
        echo "\r🐳    Nginx"
        rm -rf error_nginx
    fi
    
    printf "🔄    Mysql"
    docker build -t mysql ./srcs/mysql 2> error_mysql 1> /dev/null
    if [ $(($(wc error_mysql| xargs | cut -d" " -f2) + 0)) -gt 0 ] ;
        then
        echo "\r❌    Mysql"
        printf "\t\t ----> "
        cat ./error_mysql
        rm -rf error_mysql
        else
        echo "\r🐳    Mysql"
        rm -rf error_mysql
    fi

    printf "🔄    Phpmyadmin"
    docker build -t phpmyadmin ./srcs/phpmyadmin 2> error_php 1> /dev/null
    if [ $(($(wc error_php| xargs | cut -d" " -f2) + 0)) -gt 0 ] ;
        then
        echo "\r❌    Phpmyadmin"
        printf "\t\t ----> "
        cat ./error_php
        rm -rf error_php
        else
        echo "\r🐳    Phpmyadmin"
        rm -rf error_php
    fi

    printf "🔄    Wordpress"
    docker build -t wordpress ./srcs/wordpress 2> error_wp 1> /dev/null
    if [ $(($(wc error_wp| xargs | cut -d" " -f2) + 0)) -gt 0 ] ;
        then
        echo "\r❌    Wordpress"
        printf "\t\t ----> "
        cat ./error_wp
        rm -rf error_wp
        else
        echo "\r🐳    Wordpress"
        rm -rf error_wp
    fi

    printf "🔄    Ftps"
    docker build -t ftps ./srcs/ftps 2> error_ftps 1> /dev/null
    if [ $(($(wc error_ftps| xargs | cut -d" " -f2) + 0)) -gt 0 ] ;
        then
        echo "\r❌    Ftps"
        printf "\t\t ----> "
        cat ./error_ftps
        rm -rf error_ftps
        else
        echo "\r🐳    Ftps"
        rm -rf error_ftps
    fi

    printf "🔄    Influxdb"
    docker build -t influxdb ./srcs/influxdb 2> error_influx 1> /dev/null
    if [ $(($(wc error_influx| xargs | cut -d" " -f2) + 0)) -gt 0 ] ;
        then
        echo "\r❌    Influxdb"
        printf "\t\t ----> "
        cat ./error_influx
        rm -rf error_influx
        else
        echo "\r🐳    Influxdb"
        rm -rf error_influx
    fi

    printf "🔄    Telegraf"
    docker build -t telegraf ./srcs/telegraf                 2> error_tele 1> /dev/null
    if [ $(($(wc error_tele| xargs | cut -d" " -f2) + 0)) -gt 0 ] ;
        then
        echo "\r❌    Telegraf"
        printf "\t\t ----> "
        cat ./error_tele
        rm -rf error_tele
        else
        echo "\r🐳    Telegraf"
        rm -rf error_tele
    fi

    printf "🔄    Grafana"
    docker build -t grafana ./srcs/grafana 2> error_grafana 1> /dev/null
    if [ $(($(wc error_grafana| xargs | cut -d" " -f2) + 0)) -gt 0 ] ;
        then
        echo "\r❌    Grafana"
        printf "\t\t ----> "
        cat ./error_grafana
        rm -rf error_grafana
        else
        echo "\r🐳    Grafana"
        rm -rf error_grafana
    fi
    echo  "\n$CIAN************************* $WHITE 🐳  BUILT IMAGES 🐳  $CIAN**************************\n$WHITE";
}
# Creacion de pods con docker 
build_pod()
{
    head
    eval $(minikube -p minikube docker-env)
    eval $(minikube docker-env)
    echo  "\n\n\n$CIAN************************* $WHITE 🧸 BUILDING PODS 🧸  $CIAN**************************\n$WHITE";


    printf "🔄     Nginx"
    kubectl apply -f ./srcs/nginx/srcs/nginx.yaml 2> error_nginx 1> /dev/null 
    if [ $(($(wc error_nginx| xargs | cut -d" " -f2) + 0)) -gt 0 ] ;
        then
        echo "$WHITE\r❌    Nginx"
        printf "\t\t ----> "
        cat ./error_nginx
        else
        echo "\r🍹    Nginx"
        rm -rf error_nginx
    fi

    printf "🔄    Mysql"
    kubectl apply -f ./srcs/mysql/srcs/mysql.yaml 2> error_mysql 1> /dev/null
    if [ $(($(wc error_mysql| xargs | cut -d" " -f2) + 0)) -gt 0 ] ;
        then
        echo "\r❌    Mysql"
        printf "\t\t ----> "
        cat ./error_mysql
        rm -rf error_mysql
        else
        echo "\r🍺    Mysql"
        rm -rf error_mysql
    fi

    printf "🔄    Phpmyadmin"
    kubectl apply -f ./srcs/phpmyadmin/srcs/phpmyadmin.yaml 2> error_php 1> /dev/null
    if [ $(($(wc error_php| xargs | cut -d" " -f2) + 0)) -gt 0 ] ;
        then
        echo "\r❌    Phpmyadmin"
        printf "\t\t ----> "
        cat ./error_php
        rm -rf error_php
        else
        echo "\r🍸    Phpmyadmin"
        rm -rf error_php
    fi

    printf "🔄    Wordpress"
    kubectl apply -f ./srcs/wordpress/srcs/wordpress.yaml 2> error_wp 1> /dev/null
    if [ $(($(wc error_wp| xargs | cut -d" " -f2) + 0)) -gt 0 ] ;
        then
        echo "\r❌    Wordpress"
        printf "\t\t ----> "
        cat ./error_wp
        rm -rf error_wp
        else
        echo "\r🍾    Wordpress"
        rm -rf error_wp
    fi

    printf "🔄    Ftps"
    kubectl apply -f ./srcs/ftps/srcs/ftps.yaml 2> error_ftp 1> /dev/null
    if [ $(($(wc error_ftp| xargs | cut -d" " -f2) + 0)) -gt 0 ] ;
        then
        echo "\r❌    Ftps"
        printf "\t\t ----> "
        cat ./error_ftp
        rm -rf error_ftp
        else
        echo "\r🥃    Ftps"
        rm -rf error_ftp
    fi

      printf "🔄    Influxdb"
    kubectl apply -f ./srcs/influxdb/srcs/influxdb.yaml 2> error_influx 1> /dev/null
    if [ $(($(wc error_influx| xargs | cut -d" " -f2) + 0)) -gt 0 ] ;
        then
        echo "\r❌    Influxdb"
        printf "\t\t ----> "
        cat ./error_influx
        rm -rf error_influx
        else
        echo "\r☕️    Influxdb"
        rm -rf error_influx
    fi

  printf "🔄    Telegraf"
    kubectl apply -f ./srcs/telegraf/srcs/telegraf.yaml 2> error_tele 1> /dev/null
    if [ $(($(wc error_tele | xargs | cut -d" " -f2) + 0)) -gt 0 ] ;
        then
        echo "\r❌    Telegraf"
        printf "\t\t ----> "
        cat ./error_tele
        rm -rf error_tele
        else
        echo "\r🍻    Telegraf"
        rm -rf error_tele
    fi
    

    printf "🔄    Grafana"
    kubectl apply -f ./srcs/grafana/srcs/grafana.yaml 2> error_grafana 1> /dev/null
    if [ $(($(wc error_grafana| xargs | cut -d" " -f2) + 0)) -gt 0 ] ;
        then
        echo "\r❌    Grafana"
        printf "\t\t ----> "
        cat ./error_grafana
        rm -rf error_grafana
        else
        echo "\r🥂    Grafana"
        rm -rf error_grafana
    fi
    
    echo  "\n$CIAN************************** $WHITE 🧸 BUILT PODS 🧸  $CIAN***************************\n$WHITE";
    }

main ()
{
    #minikube delete
    #sleep 3
    head
    start_minikube
    sleep 7
    build_image
    sleep 5
    configure_metallb
    sleep 5
    build_pod
    sleep 7
    start_dashboard
}

if [[ $1 == "x" ]]
then
	main $1
elif [ $1 ]
then
	custom $@
else
	main
fi