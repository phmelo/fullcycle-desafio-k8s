#!/bin/sh -x
kubectl create secret generic mysql-pass --from-literal=password=senha321
kubectl apply -f mysql/persistentVolume.yaml
kubectl apply -f mysql/deployment.yaml

kubectl get secrets
kubectl get persistentvolume
kubectl get deployments

kubectl describe nodes | grep mysql