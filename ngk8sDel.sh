#!/bin/sh -x
kubectl delete deployment nginx-deplo
kubectl delete service nginx-service
kubectl delete configmap nginx-conf

kubectl get deployments
kubectl get configmap
kubectl get services

