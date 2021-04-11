#!/usr/bin/env bash
# This file tags and uploads an image to Docker Hub

docker login --username=$DOCKER_USERNAME --password=$DOCKER_PASSWORD
# Assumes that an image is built via `run_docker.sh`

# Step 1:
# Create dockerpath
 dockerpath=mohamed992/myapp
docker tag myapp $dockerpath
# Step 2:  
# Authenticate & tag
echo "Docker ID and Image: $dockerpath"

# Step 3:
# Push image to a docker repository
docker push $dockerpath