#!/bin/sh -x
kubectl delete deployment go-server
kubectl delete services go-service

kubectl get deployments
kubectl get services
