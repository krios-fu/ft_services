#!/bin/bash

echo  "\n\n\n\t🖥 Starting minikube with virtualbox driver.\n";
minikube start --driver=virtualbox
sleep 2
echo "\n\n\n\t🔄 Starting Proxy\n"; 
kubectl proxy &
sleep 5
echo  "\tConnect 🐳  with minkube" 
eval $(minikube -p minikube docker-env)
echo  "\n\n\n\tStarting kubernetes dashboard.\n";
minikube dashboard &
