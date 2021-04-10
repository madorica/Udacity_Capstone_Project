#!/usr/bin/env bash

## Complete the following steps to get Docker running locally
# docker login --username=$DOCKER_USERNAME --password=$DOCKER_PASSWORD
# Step 1:
# Build image and add a descriptive tag
docker build -t capstone:v2 .
# Step 2: 
# List docker images
docker image ls
# Step 3: 
# Run flask app
docker run -d -p 8000:5000 --name capstoneapp capstone:v2
