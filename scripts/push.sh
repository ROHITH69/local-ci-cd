#!/bin/bash

source config/app.env

echo "Pushing image to local registry..."

docker push ${REGISTRY}/${IMAGE_NAME}:${IMAGE_TAG}

echo "Image pushed successfully."