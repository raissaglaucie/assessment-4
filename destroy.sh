#!/usr/bin/env bash


echo "Starting destroying..."

kubectl delete namespace --namespace=flask-app
kubectl delete configmap flask-config --namespace=flask-app
kubectl delete secret flask-secret --namespace=flask-app
kubectl delete resourcequota flask-app-quota ---namespace=flask-app
kubectl delete service postgres-service --namespace=flask-app
kubectl delete deployment postgres ---namespace=flask-app
kubectl delete service flask-service --namespace=flask-app
kubectl delete deployment flask-app ---namespace=flask-app
kubectl delete pvc my-pvc --namespace=flask-app