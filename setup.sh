#!/bin/bash -e

BLUE='\033[0;34m'
head()
{
    clear
    echo "$BLUE    ___                                             _                     "
    echo "$BLUE   / __)   _                                       (_)                    "
    echo "$BLUE _| |__  _| |_            ___  _____   ____  _   _  _   ____  _____   ___ "
    echo "$BLUE(_   __)(_   _)          /___)| ___ | / ___)| | | || | / ___)| ___ | /___)"
    echo "$BLUE  | |     | |_  _______ |___ || ____|| |     \ V / | |( (___ | ____||___ |"
    echo "$BLUE  |_|      \__)(_______)(___/ |_____)|_|      \_/  |_| \____)|_____)(___/ 🐳"

}
start_minikube ()
{
    echo  "\n\n\n\t🖥 Starting minikube 🐳 \n";
    minikube start --driver=virtualbox
    sleep 2
    echo "\n\n\n\t🔄 Starting Proxy\n"; 
    kubectl proxy &
    sleep 5
    echo  "\tConnect 🐳  with minkube" 
    eval $(minikube -p minikube docker-env)

}

start_dashboard()
{
    echo  "\n\n\n\tStarting kubernetes dashboard.\n";
    minikube dashboard &
}

build_image()
{
    $HOME
}


main ()
{
    head
    ##start_minikube
    ##start_dashboard
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