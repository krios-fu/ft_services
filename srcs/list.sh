#!/bin/bash
#connect docker with kubernetes
eval $(minikube docker-env)
#list docker images
echo "----->IMAGES";
docker images
#list pods
echo "----->PODS";
kubectl get pods
#list services
echo "----->SERVICES";
kubectl get services
echo "----->PV_STORAGE";
kubectl get pv
echo "----->PVC_STORAGE";
kubectl get pvc 