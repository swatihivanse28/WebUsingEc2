#!/bin/bash

ECR_REPO="648908580279.dkr.ecr.ap-south-1.amazonaws.com/devenvmanual"
IMAGE_TAG="latest"

aws ecr get-login-password --region ap-south-1 | docker login --username AWS --password-stdin $ECR_REPO
docker pull $ECR_REPO:$IMAGE_TAG
