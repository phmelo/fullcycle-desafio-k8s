#!/bin/sh -x
kubectl delete secrets mysql-pass
kubectl delete deployment mysql-deplo
kubectl delete pv volumename

kubectl get secrets
kubectl get deployments
kubectl get pv
kubectl describe nodes | grep mysql

