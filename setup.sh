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
    echo "$GREEN    ___                                             _                     "
    echo "$GREEN   / __)   _                                       (_)                    "
    echo "$GREEN _| |__  _| |_            ___  _____   ____  _   _  _   ____  _____   ___ "
    echo "$GREEN(_   __)(_   _)          /___)| ___ | / ___)| | | || | / ___)| ___ | /___)"
    echo "$GREEN  | |     | |_  _______ |___ || ____|| |     \ V / | |( (___ | ____||___ |"
    echo "$GREEN  |_|      \__)(_______)(___/ |_____)|_|      \_/  |_| \____)|_____)(___/ 🐳"

}
start_minikube ()
{
    echo  "\n\n\n$CIAN******* STARTING MINIKUBE 🖥 *******\n$WHITE";
    minikube start --driver=virtualbox
    sleep 2
    head
    #echo  "\n\n\n$CIAN******* STARTING PROXY*******\n$WHITE";
    #kubectl proxy & 1> /dev/null
    #sleep 5
    echo  "\n\n\n$CIAN******* METALLB CONFIGURE*******\n$WHITE";
    printf "🔄    $WHITE Setting metallb...\n"
    minikube addons enable metrics-server
    echo "✅ Configured               "
    kubectl apply -f ./srcs/metallb/metallb.yaml
    minikube addons enable metallb
    sleep 5
    head
    printf "\n\n\n🔄   $CIAN CONNECTING WITH DOCKER 🐳 "
    sleep 2
    head
    echo "\r\n\n\n✅    $CIAN CONNECTED TO DOCKER    🐳 "
    eval $(minikube -p minikube docker-env)
    sleep 2
}


start_dashboard()
{
    head
    minikube dashboard &
    echo  "\n\n\n$CIAN******* STARTING KUBERNETES DASHBOARD 🖥 *******";
    echo "$WHITE"
}
# Creacion de imagenes con docker 
build_image()
{
    head
    eval $(minikube -p minikube docker-env)
    echo  "\n\n\n$CIAN******* BULDING IMAGES ON 🐳 *******\n";

    printf "🔄   $WHITE Nginx"
    eval $(minikube docker-env)
    docker build -t nginx ./srcs/nginx 2> error_nginx 1> /dev/null 
    if [ $(($(wc error_nginx| xargs | cut -d" " -f2) + 0)) -gt 0 ] ;
        then
        echo "\r❌    Nginx"
        printf "\t\t ----> "
        cat ./error_nginx
        else
        echo "\r✅    Nginx"
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
        echo "\r✅    Mysql"
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
        echo "\r✅    Phpmyadmin"
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
        echo "\r✅    Wordpress"
        rm -rf error_wp
    fi
    echo  "\n$CIAN********* BUILT IMAGES 🐳 *********";
}
# Creacion de pods con docker 
build_pod()
{
    head
    eval $(minikube -p minikube docker-env)
    eval $(minikube docker-env)
    echo  "\n\n\n$CIAN******* BULDING PODS *******\n";

    printf "🔄    $WHITE Nginx"
    kubectl apply -f ./srcs/nginx/nginx.yaml 2> error_nginx 1> /dev/null 
    if [ $(($(wc error_nginx| xargs | cut -d" " -f2) + 0)) -gt 0 ] ;
        then
        echo "\r❌    Nginx"
        printf "\t\t ----> "
        cat ./error_nginx
        else
        echo "\r✅    Nginx"
        rm -rf error_nginx
    fi
    
    printf "🔄    Mysql"
    kubectl apply -f ./srcs/mysql/mysql.yaml 2> error_mysql 1> /dev/null
    if [ $(($(wc error_mysql| xargs | cut -d" " -f2) + 0)) -gt 0 ] ;
        then
        echo "\r❌    Mysql"
        printf "\t\t ----> "
        cat ./error_mysql
        rm -rf error_mysql
        else
        echo "\r✅    Mysql"
        rm -rf error_mysql
    fi

    printf "🔄    Phpmyadmin"
    kubectl apply -f ./srcs/phpmyadmin/phpmyadmin.yaml 2> error_php 1> /dev/null
    if [ $(($(wc error_php| xargs | cut -d" " -f2) + 0)) -gt 0 ] ;
        then
        echo "\r❌    Phpmyadmin"
        printf "\t\t ----> "
        cat ./error_php
        rm -rf error_php
        else
        echo "\r✅    Phpmyadmin"
        rm -rf error_php
    fi

    printf "🔄    Wordpress"
    kubectl apply -f ./srcs/wordpress/wordpress.yaml 2> error_wp 1> /dev/null
    if [ $(($(wc error_wp| xargs | cut -d" " -f2) + 0)) -gt 0 ] ;
        then
        echo "\r❌    Wordpress"
        printf "\t\t ----> "
        cat ./error_wp
        rm -rf error_wp
        else
        echo "\r✅    Wordpress"
        rm -rf error_wp
    fi
    echo  "\n$CIAN********* BUILT PODS  *********";
}

main ()
{
    head
    start_minikube
    sleep 7
    build_image
    sleep 7
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