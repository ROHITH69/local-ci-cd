#!/bin/bash

source config/app.env

echo "Building Docker image..."

docker build -t ${IMAGE_NAME}:${IMAGE_TAG} .

docker tag ${IMAGE_NAME}:${IMAGE_TAG} \
${REGISTRY}/${IMAGE_NAME}:${IMAGE_TAG}

echo "Docker image built successfully."