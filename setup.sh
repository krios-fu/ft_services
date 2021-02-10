#!/bin/bash

echo -e "\n\n\n🖥\tStarting minikube with virtualbox driver.\n";
minikube start --driver=virtualbox
sleep 2
echo -e "\n\n\n🔄\tStarting Proxy\n"; 
kubectl proxy &
sleep 5
echo -e "\tConnect 🐳 with ⛴" 
eval $(minikube -p minikube docker-env)
echo -e "\n\n\n\tStarting kubernetes dashboard.\n";
minikube dashboard &
