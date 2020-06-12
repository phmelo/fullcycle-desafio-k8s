#!/bin/sh -x
kubectl apply -f nginx/configmap.yaml
kubectl apply -f nginx/service.yaml
kubectl apply -f nginx/deployment.yaml

kubectl get configmap
kubectl get deployments
kubectl get services
kubectl describe nodes | grep nginx