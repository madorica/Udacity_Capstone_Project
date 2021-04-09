#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub
docker login --username=$DOCKER_USERNAME --password=$DOCKER_PASSWORD
# Step 1:
# This is your Docker ID/path
dockerpath=mohamed992/myapp
TAG=myapp 
# Step 2
# Run the Docker Hub container with kubernetes
echo "running"
kubectl run myapp \
    --image=$dockerpath \
    --image-pull-policy="Always" \
    --overrides='{"apiVersion": "v1", "spec":{"imagePullSecrets": [{"name": "regcred"}]}}'
# Step 3:
# List kubernetes pods
echo "getting pod"
kubectl get pods --all-namespaces
# Step 4:
# Forward the container port to a host
echo "port"
kubectl port-forward pod/$TAG 8000:80