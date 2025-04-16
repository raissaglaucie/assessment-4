#!/usr/bin/env bash

echo "Starting deployment..."

cd deployment 

kubectl apply -f "Namespace.yaml"

kubectl apply -f "Config.yaml"

kubectl apply -f "Secrets.yaml"

kubectl apply -f "ResourceQuota.yaml"

kubectl apply -f "StorageClass.yaml"

kubectl apply -f "PersistentVolume.yaml" 

kubectl apply -f "PersistentVolumeClaim.yaml"

kubectl apply -f "Postgres-Service.yaml"

kubectl apply -f "Postgres-deployment.yaml"

sleep 5

kubectl apply -f "Twoge-Service.yaml"

kubectl apply -f "Twoge-Deployment.yaml"

sleep 15

kubectl rollout restart deployment flask-app --namespace=flask-app

kubectl get pods --namespace=flask-app