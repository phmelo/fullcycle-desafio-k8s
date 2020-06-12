#!/bin/sh -x
kubectl apply -f ./go-server/deployment.yaml
kubectl apply -f ./go-server/service.yaml

kubectl get deployments
kubectl get services
kubectl describe nodes | grep go-server