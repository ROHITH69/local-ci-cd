#!/bin/bash

source config/app.env

echo "Building Docker image..."

docker build -t ${IMAGE_NAME} .

docker tag ${IMAGE_NAME} localhost:5001/${IMAGE_NAME}

echo "Docker image built successfully."