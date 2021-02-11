#!/bin/bash -e

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
    start_minikube
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