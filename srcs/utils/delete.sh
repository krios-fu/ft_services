#!/bin/bash

eval $(minikube -p minikube docker-env)	
kubectl delete services --all
kubectl delete pods --all
kubectl delete deployments --all
docker rm -f $(docker ps -a -q) && docker rmi $(docker images -q) --force