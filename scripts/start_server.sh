#!/bin/bash
REPO_URI="648908580279.dkr.ecr.ap-south-1.amazonaws.com/devenvmanual"
IMAGE_TAG="latest"

# Pull latest image
aws ecr get-login-password --region ap-south-1 | docker login --username AWS --password-stdin $REPO_URI
docker pull $REPO_URI:$IMAGE_TAG

# Stop previous container if running
docker stop flaskapp || true
docker rm flaskapp || true

# Run new container
docker run -d -p 5000:5000 --name flaskapp $REPO_URI:$IMAGE_TAG
